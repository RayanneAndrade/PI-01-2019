package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

import ConnectionFactory.Conexao;
import Model.Tema;

public class TemaDAO {

	public int criar(Tema tema) {
		String sqlInsert = "INSERT INTO tema (dt_cadastro, titulo, introducao, requisitos) VALUES (?,?,?,?)";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlInsert);) {

			stm.setDate(1, new Date(tema.getDtCadastro().getTime()));
			stm.setString(2, tema.getTitulo());
			stm.setString(3, tema.getIntroducao());
			stm.setString(4, tema.getRequisitos());

			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();) {
				if (rs.next()) {
					tema.setId(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tema.getId();
	}

	public void atualizar(Tema tema) {
		String sqlUpdate = "UPDATE tema SET dt_Cadastro=?, titulo=?, introducao=?, requisitos=? WHERE id=?";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setDate(1, new Date(tema.getDtCadastro().getTime()));
			stm.setString(2, tema.getTitulo());
			stm.setString(3, tema.getIntroducao());
			stm.setString(4, tema.getRequisitos());
			stm.setInt(5, tema.getId());

			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void excluir(int id) throws SQLException {
		String sqlDelete = "DELETE FROM Tema WHERE id = ?";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, id);
			stm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new SQLException("Não é possivel excluir esse tema");
		}
	}

	public Tema carregar(int id) {

		Tema tema = new Tema();
		tema.setId(id);

		String sqlSelect = "SELECT dt_Cadastro, titulo, introducao, requisitos FROM Tema WHERE Tema.id = ?";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setInt(1, id);
			try (ResultSet rs = stm.executeQuery();) {
				if (rs.next()) {
					tema.setDtCadastro(rs.getDate("dt_Cadastro"));
					tema.setTitulo(rs.getString("titulo"));
					tema.setIntroducao(rs.getString("introducao"));
					tema.setRequisitos(rs.getString("requisitos"));

				} else {
					tema.setId(-1);
					tema.setDtCadastro(null);
					tema.setTitulo(null);
					tema.setIntroducao(null);
					tema.setRequisitos(null);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return tema;
	}

	public ArrayList<Tema> listarTema() {
		Tema tema;
		ArrayList<Tema> lista = new ArrayList<>();
		String sqlSelect = "SELECT id, dt_Cadastro, titulo, introducao, requisitos FROM tema";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					tema = new Tema();
					tema.setId(rs.getInt("id"));
					tema.setDtCadastro(rs.getDate("dt_Cadastro"));
					tema.setTitulo(rs.getString("titulo"));
					tema.setIntroducao(rs.getString("introducao"));
					tema.setRequisitos(rs.getString("requisitos"));
					lista.add(tema);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}

	public ArrayList<Tema> listarTema(String chave) {
		Tema tema;
		ArrayList<Tema> lista = new ArrayList<>();
		String sqlSelect = "SELECT id, dt_Cadastro, titulo, introducao, requisitos FROM tema where upper(dt_cadastro) like ?";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			stm.setString(1, "%" + chave.toUpperCase() + "%");
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					tema = new Tema();
					tema.setId(rs.getInt("id"));
					tema.setDtCadastro(rs.getDate("dt_Cadastro"));
					tema.setTitulo(rs.getString("titulo"));
					tema.setIntroducao(rs.getString("introducao"));
					tema.setRequisitos(rs.getString("requisitos"));
					lista.add(tema);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return lista;
	}
	
	public ArrayList<Tema> listarTemaCombo() {
		Tema tema;
		ArrayList<Tema> listaCombo = new ArrayList<>();
		String sqlSelect = "SELECT titulo FROM tema";
		// usando o try with resources do Java 7, que fecha o que abriu
		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlSelect);) {
			try (ResultSet rs = stm.executeQuery();) {
				while (rs.next()) {
					tema = new Tema();
					tema.setTitulo(rs.getString("titulo"));
					listaCombo.add(tema);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e1) {
			System.out.print(e1.getStackTrace());
		}
		return listaCombo;
	}

}