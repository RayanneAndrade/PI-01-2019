package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

import ConnectionFactory.Conexao;
import Model.Atividade;
import Model.Tema;

public class AtividadeDAO {
	public int criar(Atividade atividade) {

		String sqlInsert = "INSERT INTO Atividade (numero, tema_id, descricao, formato_entrega, dt_inicio, dt_fim) VALUES (?,?,?,?,?,?)";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlInsert);) {

			stm.setInt(1, atividade.getNumero());
			stm.setInt(2, atividade.getTema().getId());
			stm.setString(3, atividade.getDescricao());
			stm.setString(4, atividade.getFormatoEntrega());
			stm.setDate(5, new Date (atividade.getDataInicial().getTime()));
			stm.setDate(6, new Date (atividade.getDataFinal().getTime()));

			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();) {
				if (rs.next()) {
					atividade.setIdAtividade(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return atividade.getId();
	}

	public void atualizar(Atividade atividade) {
		String sqlInsert = "UPDATE Atividade SET numero=?, descricao=?, formato_entrega=?, dt_inicio=?, dt_fim=? WHERE id=?";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlInsert);) {

			stm.setInt(1, atividade.getNumero());
			stm.setString(2, atividade.getDescricao());
			stm.setString(3, atividade.getFormatoEntrega());
			stm.setDate(4, new Date(atividade.getDataInicial().getTime()));
			stm.setDate(5, new Date(atividade.getDataFinal().getTime()));
			stm.setInt(6, atividade.getId());

			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void excluir(int idAtividade) throws SQLException{
		String sqlDelete = "DELETE FROM Atividade WHERE id = ?";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, idAtividade);
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new SQLException("Não é possivel excluir essa atividade");
		}
	}

	public Atividade carregar(int id) {

		Atividade atividade = new Atividade();
		atividade.setIdAtividade(id);

		String sqlSelect = "SELECT numero, descricao, formato_entrega, dt_inicio, dt_fim FROM Atividade WHERE Atividade.id = ?";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, atividade.getId());
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					atividade.setNumero(rs.getInt("numero"));
					atividade.setDescricao(rs.getString("descricao"));
					atividade.setFormatoEntrega(rs.getString("formato_entrega"));
					atividade.setDataInicio(rs.getDate("dt_inicio"));
					atividade.setDataFinal(rs.getDate("dt_fim"));

				} else {
					atividade.setIdAtividade(-1);
					atividade.setNumero(0);
					atividade.setDescricao(null);
					atividade.setFormatoEntrega(null);
					atividade.setDataInicio(null);
					atividade.setDataFinal(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return atividade;
	}

	public ArrayList<Atividade> listarAtividade() {
		Atividade atividade;
		ArrayList<Atividade> lista = new ArrayList<>();
		String sqlSelect = "SELECT id, numero, descricao, formato_entrega, dt_inicio, dt_fim FROM atividade";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					atividade = new Atividade();
					atividade.setIdAtividade(rs.getInt("id"));
					atividade.setNumero(rs.getInt("numero"));
					atividade.setDescricao(rs.getString("descricao"));
					atividade.setFormatoEntrega(rs.getString("formato_entrega"));
					atividade.setDataInicio(rs.getDate("dt_inicio"));
					atividade.setDataFinal(rs.getDate("dt_fim"));
					lista.add(atividade);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	public ArrayList<Atividade> listarAtividade(String chave) {
		Atividade atividade;
		ArrayList<Atividade> lista = new ArrayList<>();
		String sqlSelect = "SELECT id, numero, descricao, formato_entrega, dt_inicio, dt_fim FROM atividade where upper(numero) like ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1, "%" + chave.toUpperCase() + "%");
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					atividade = new Atividade();
					atividade.setIdAtividade(rs.getInt("id"));
					atividade.setNumero(rs.getInt("numero"));
					atividade.setDescricao(rs.getString("descricao"));
					atividade.setFormatoEntrega(rs.getString("formato_entrega"));
					atividade.setDataInicio(rs.getDate("dt_inicio"));
					atividade.setDataFinal(rs.getDate("dt_fim"));
					lista.add(atividade);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}
	
	public ArrayList<Atividade> carregarTemaId(int id) {
		Atividade atividade;
		ArrayList<Atividade> listaAtividade = new ArrayList<>();
		String sqlSelect = "SELECT * FROM ATIVIDADE WHERE atividade.tema_id = ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, id);
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					atividade = new Atividade();
					atividade.setIdAtividade(rs.getInt("id"));
					atividade.setNumero(rs.getInt("numero"));
					atividade.setDescricao(rs.getString("descricao"));
					atividade.setFormatoEntrega(rs.getString("formato_entrega"));
					atividade.setDataInicio(rs.getDate("dt_inicio"));
					atividade.setDataFinal(rs.getDate("dt_fim"));
					listaAtividade.add(atividade);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return listaAtividade;
	}
}
