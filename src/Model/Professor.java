package Model;

public class Professor extends Usuario {
	
	private int idProf;
	private int administrador;
	private String matricula; 
	
	public Professor(int idUsuario, String nome, String email, String senha, int idProf, int administrador, String matricula) {
		super(idUsuario, nome, email, senha);
		this.idProf = idProf;
		this.administrador = administrador;
		this.matricula = matricula;
	}
	
	public Professor(int idUsuario, String nome, String email, String senha, String matricula, int administrador) {
		super(idUsuario, nome, email, senha);
		this.matricula = matricula;
		this.administrador = administrador;
	}
	
	public int getIdProf() {
		return idProf;
	}
	
	public void setIdProf(int idProf) {
		this.idProf = idProf;
	}
	
	public int getAdm() {
		return administrador;
	}
	
	public void setAdm(int administrador) {
		this.administrador = administrador;
	}
	
	public String getMatricula() {
		return matricula;
	}
	
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

}
