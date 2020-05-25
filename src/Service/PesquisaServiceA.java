package Service;

import java.util.ArrayList;

import Model.Atividade;
import DAO.AtividadeDAO;

public class PesquisaServiceA {

	AtividadeDAO dao;

	public PesquisaServiceA(){
		dao = new AtividadeDAO();
	}

	public ArrayList<Atividade> listarAtividade() {
		return dao.listarAtividade();
	}

	public ArrayList<Atividade> listarAtividade(String chave) {
		return dao.listarAtividade(chave);
	}
	
	public ArrayList<Atividade> CarregarTemaId(int id) {
		return dao.carregarTemaId(id);
		
	}
}
