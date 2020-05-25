package Service;

import java.util.ArrayList;

import Model.Tema;
import DAO.TemaDAO;

public class PesquisaServiceT {

	TemaDAO dao;

	public PesquisaServiceT(){
		dao = new TemaDAO();
	}

	public ArrayList<Tema> listarTema() {
		return dao.listarTema();
	}

	public ArrayList<Tema> listarTema(String chave) {
		return dao.listarTema(chave);
	}
	
	public ArrayList<Tema> listarTemaCombo() {
		return dao.listarTemaCombo();
	}
}
