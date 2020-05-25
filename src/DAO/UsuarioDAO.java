package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import ConnectionFactory.Conexao;
import Model.Usuario;

public class UsuarioDAO {

	/**
     * CRUD: Insere usuÃ¡rio
     * @param conn: Connection
     */
	public Usuario criar(Usuario usuario) {
		
		String sqlInsert = "INSERT INTO Usuario (nome, email, senha) VALUES (?, ?, ?)";
		
		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlInsert);) {

			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getEmail());
			stm.setString(3, usuario.getSenha());

			stm.execute();
			String sqlQuery = "SELECT LAST_INSERT_ID()";
			try (PreparedStatement stm2 = conn.prepareStatement(sqlQuery); ResultSet rs = stm2.executeQuery();) {
				if (rs.next()) {
					usuario.setIdUsuario(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuario;
	}
	
	/**
     * CRUD: Atualiza usuÃ¡rio
     * @param conn: Connection
     */
	public Usuario atualizar(Usuario usuario) {
		
		String sqlUpdate = "UPDATE Usuario SET nome = ?, email = ?, senha = ? WHERE id = ?";

		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlUpdate);) {
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getEmail());
			stm.setString(3, usuario.getSenha());
			stm.setInt(4, usuario.getIdUsuario());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return usuario;
	}
	
	
	/**
     * CRUD: Deleta usuÃ¡rio
     * @param conn: Connection
     */
	public void excluir(int id) {
		
		String sqlDelete = "DELETE FROM Usuario WHERE Id = ?";
		
		try (Connection conn = Conexao.obtemConexao(); PreparedStatement stm = conn.prepareStatement(sqlDelete);) {
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int Load(String user, String senha) throws SQLException {
		
		Connection conn= new Conexao().obtemConexao();
		
		String sqlComand = "Select id from usuario where email = ? and senha =?";
		
		try (PreparedStatement stm = conn.prepareStatement(sqlComand)) {
			stm.setString(1, "user");
			stm.setString(2, "senha");
			int i;
			ResultSet rs = stm.executeQuery();
			
			if (rs.next()) {
				i = rs.getInt("id");
				return i;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
		
	}
	
	
	public int logar(String email, String senha) throws SQLException {
		
		Connection conn = new Conexao().obtemConexao();
		int i = -1;
		String sqlComand = "SELECT id from usuario where email = ? and senha = ?";
		
		try(PreparedStatement stm = conn.prepareStatement(sqlComand)){
			
			stm.setString(1, email);
			stm.setString(2, senha);
			ResultSet rs = stm.executeQuery();
			
            if(rs.next()) {
				i = rs.getInt("id");	
            }
            
		}catch (SQLException e) {
			e.printStackTrace();
			throw new SQLException("Não é possivel acessar o sistema");
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return i;
	}
}