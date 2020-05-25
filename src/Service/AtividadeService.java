package Service;

import java.sql.SQLException;

import javax.swing.JOptionPane;

import DAO.AtividadeDAO;
import Model.Atividade;

public class AtividadeService {

	AtividadeDAO dao;

	public AtividadeService() {
		dao = new AtividadeDAO();
	}

	public void criar(Atividade atividade) {
		dao.criar(atividade);
	}

	public void atualizar(Atividade atividade) {
		dao.atualizar(atividade);
	}

	public void excluir(int idAtividade) throws SQLException {
			dao.excluir(idAtividade);
	}

	public Atividade carregar(int id) {
		Atividade atividade = dao.carregar(id);
		return atividade;
	}
}