package Service;

import java.io.Serializable;
import java.util.ArrayList;

import DAO.ProfessorDAO;
import Model.Professor;

public class ProfessorService implements Serializable{

	ProfessorDAO dao;
	
	public ProfessorService() {
		dao = new ProfessorDAO();
	}
	
	public void create(Professor professor) {
		dao.criar(professor);
	}
	
	public void update(Professor professor) {
		dao.atualizar(professor);
	}
	
	public void delete(int id) {
		dao.delete(id);
	}
	
	public Professor load(int id) {
		return dao.load(id);
	}
	
	public ArrayList<Professor> getProfessores(){
		return dao.getProfessores();
	}
	
	public ArrayList<Professor> buscarProfessor(String busca){
		return dao.buscarProfessor(busca);
	}
	
	public ArrayList<Professor> carrega(){
		return dao.carrega();
	}
}
