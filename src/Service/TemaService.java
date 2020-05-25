package Service;

import java.sql.SQLException;

import DAO.TemaDAO;
import Model.Tema;


public class TemaService {

	TemaDAO dao;

	public TemaService() {
		dao = new TemaDAO();
	}

	public void criar(Tema tema) {
			dao.criar(tema);
	}

	public void atualizar(Tema tema) {
		dao.atualizar(tema);
	}

	public void excluir(int id) throws SQLException {
		dao.excluir(id);
	}

	public Tema carregar(int id) {
		Tema tema = dao.carregar(id);
		return tema;
	}
}
