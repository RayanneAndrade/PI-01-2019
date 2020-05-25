package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*
 * Classe DaoLogin
 * Responsável Pela Autenticação do Usuário
 */
public class LoginDAO {

	private static Connection connection;
	
	public static boolean validarLogin(String email, String senha) throws Exception {
		String sql = "SELECT * FROM usuario WHERE email = '" + email + "' AND senha = '" + senha + "'";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
			if(resultSet.next()) {
				return true;
			} else {
				return false;
			}
	}
}
