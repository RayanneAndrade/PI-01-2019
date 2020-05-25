package Service;

import java.util.ArrayList;

import Model.Turma;
import DAO.TurmaDAO;

public class PesquisaService {

	TurmaDAO dao;

	public PesquisaService(){
		dao = new TurmaDAO();
	}

	public ArrayList<Turma> listarTurma() {
		return dao.listarTurma();
	}
	
	public ArrayList<Turma> mostrarAno() {
		return dao.mostrarAno();
	}
	
	public ArrayList<Turma> getTurmasPeriodo(int ano, int semestre) {
		return dao.getTurmasPeriodo(ano, semestre);
	}

	public ArrayList<Turma> listarTurma(String chave) {
		return dao.listarTurma(chave);
	}
	
	public ArrayList<Turma> selectTurmaPeriodo( int idProf,int ano, int semestre) {
		return dao.selectTurmaPeriodo( idProf,ano, semestre);
	}
	
}
