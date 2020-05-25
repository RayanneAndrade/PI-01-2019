package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import ConnectionFactory.Conexao;
import Model.Turma;
import Model.Tema;

public class TurmaDAO {

	public int criar(Turma turma) throws SQLException {

		String sqlInsert = "INSERT INTO Turma (semestre_letivo, ano_letivo, sigla, tema_id) VALUES (?,?,?,?)";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlInsert);) {

			stm.setInt(1, turma.getSemestreLetivo());
			stm.setInt(2, turma.getAnoLetivo());
			stm.setString(3, turma.getSigla());
			stm.setInt(4, turma.getTema().getId());

			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();) {
				if (rs.next()) {
					turma.setId(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new SQLException("Não é possivel excluir essa atividade");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new SQLException("Não é possivel excluir essa atividade");
		}
		return turma.getId();
	}

	public void atualizar(Turma turma) {
		String sqlUpdate = "UPDATE turma SET semestre_letivo=?, ano_letivo=?, sigla=? WHERE id=?";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setInt(1, turma.getSemestreLetivo());
			stm.setInt(2, turma.getAnoLetivo());
			stm.setString(3, turma.getSigla());
			// stm.setInt(4, turma.getTema().getId());
			stm.setInt(4, turma.getId());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void excluir(int id) {
		String sqlDelete = "DELETE FROM Turma WHERE id = ?";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Turma carregar(int id) {

		Turma turma = new Turma();
		TemaDAO temaDAO = new TemaDAO();
		turma.setId(id);
		String sqlSelect = "SELECT semestre_letivo, ano_letivo, sigla, tema_id FROM Turma WHERE Turma.id = ?";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, turma.getId());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					turma.setSemestreLetivo(rs.getInt("semestre_letivo"));
					turma.setAnoLetivo(rs.getInt("ano_letivo"));
					turma.setSigla(rs.getString("sigla"));
					turma.setTema(temaDAO.carregar(rs.getInt("tema_id")));

				} else {
					turma.setId(-1);
					turma.setSemestreLetivo(0);
					turma.setAnoLetivo(0);
					turma.setSigla(null);
					turma.setTema(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return turma;
	}

	public ArrayList<Turma> listarTurma() {
		Turma turma;
		TemaDAO temaDAO = new TemaDAO();
		ArrayList<Turma> lista = new ArrayList<>();
		String sqlSelect = "SELECT id, semestre_letivo, ano_letivo, sigla, tema_id FROM turma";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					turma = new Turma();
					turma.setId(rs.getInt("id"));
					turma.setSemestreLetivo(rs.getInt("semestre_letivo"));
					turma.setAnoLetivo(rs.getInt("ano_letivo"));
					turma.setSigla(rs.getString("sigla"));
					turma.setTema(temaDAO.carregar(rs.getInt("tema_id")));
					lista.add(turma);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	public ArrayList<Turma> listarTurma(String chave) {
		Turma turma;
		ArrayList<Turma> lista = new ArrayList<>();
		String sqlSelect = "SELECT id, semestre_letivo, ano_letivo, sigla FROM turma where upper(semestre_letivo) like ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1, "%" + chave.toUpperCase() + "%");
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					turma = new Turma();
					turma.setId(rs.getInt("id"));
					turma.setSemestreLetivo(rs.getInt("semestre_letivo"));
					turma.setAnoLetivo(rs.getInt("ano_letivo"));
					turma.setSigla(rs.getString("sigla"));
					lista.add(turma);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	public ArrayList<Turma> getTurmasPeriodo(int ano, int semestre) {
		ArrayList<Turma> lstTurma = new ArrayList<>();
		TemaDAO temaDAO = new TemaDAO();
		String sqlSelect = "SELECT * FROM turma WHERE ano_letivo = ? AND semestre_letivo = ?";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, ano);
			stm.setInt(2, semestre);
			ResultSet rs = stm.executeQuery();

			while (rs.next()) {
				Turma turma = new Turma();
				turma.setId(rs.getInt("id"));
				turma.setSigla(rs.getString("sigla"));
				turma.setAnoLetivo(rs.getInt("ano_letivo"));
				turma.setSemestreLetivo(rs.getInt("semestre_letivo"));
				turma.setTema(temaDAO.carregar(rs.getInt("tema_id")));
				lstTurma.add(turma);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lstTurma;
	}

	public ArrayList<Turma> selectTurmaPeriodo(int idProf, int ano, int semestre) {
		ArrayList<Turma> lstTurma = new ArrayList<>();
		TemaDAO temaDAO = new TemaDAO();
		String sqlSelect = "SELECT DISTINCT turma.id, turma.semestre_letivo, turma.ano_letivo, turma.sigla, turma.tema_id FROM turma "
				+ "												JOIN turma_aluno a ON turma.id = a.turma_id"
				+ "												JOIN grupo g ON a.grupo_id = g.id "
				+ "											   WHERE g.orientador_id = ?"
				+ "												 AND turma.ano_letivo = ?"
				+ "					                             AND turma.semestre_letivo = ?";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, idProf);
			stm.setInt(2, ano);
			stm.setInt(3, semestre);
			ResultSet rs = stm.executeQuery();

			while (rs.next()) {
				Turma turma = new Turma();

				turma.setId((rs.getInt("id")));
				turma.setSemestreLetivo((rs.getInt("semestre_letivo")));
				turma.setAnoLetivo((rs.getInt("ano_letivo")));
				turma.setSigla((rs.getString("sigla")));
				turma.setTema(temaDAO.carregar(rs.getInt("tema_id")));
				lstTurma.add(turma);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lstTurma;
	}

	public ArrayList<Turma> mostrarAno() {
		Turma turma = null;
		ArrayList<Turma> lista = new ArrayList<Turma>();

		String sqlSelect = "SELECT DISTINCT ano_letivo, semestre_letivo FROM turma ORDER BY ano_letivo DESC, semestre_letivo  DESC";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			ResultSet rs = stm.executeQuery();

			while (rs.next()) {
				int ano = rs.getInt("ano_letivo");
				int semestre = rs.getInt("semestre_letivo");
				turma = new Turma(semestre, ano);

				lista.add(turma);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;
	}
}
