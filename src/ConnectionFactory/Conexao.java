package ConnectionFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	// Obt�mconex�ocom o bancodedados

	public static Connection obtemConexao() throws SQLException {
		return DriverManager.getConnection(
				("jdbc:mysql://localhost/mydb?useTimezone=true&serverTimezone=America/Sao_Paulo&user=root&password=root"));
	}
}
