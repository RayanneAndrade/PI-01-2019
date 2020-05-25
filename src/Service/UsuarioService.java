package Service;

import java.io.Serializable;
import java.sql.SQLException;

import DAO.UsuarioDAO;

public class UsuarioService implements Serializable{
	
	UsuarioDAO dao;
	
	public UsuarioService() {
		dao = new UsuarioDAO();
	}

	public int logar(String email, String senha) throws SQLException {
		return dao.logar(email, senha);
	}
	
}