package Service;

import java.sql.SQLException;

import DAO.TurmaDAO;
import Model.Turma;

public class TurmaService {

	TurmaDAO dao = new TurmaDAO();
	
	public int criar(Turma turma) throws SQLException {
		return dao.criar(turma);
	}
	
	public void atualizar(Turma turma){
		dao.atualizar(turma);
	}
	
	public void excluir(int id){
		dao.excluir(id);
	}
	
	public Turma carregar(int id){
		return dao.carregar(id);
	}
}