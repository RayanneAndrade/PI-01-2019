package Model;

public class ProfessorBanca {
	
	private Banca banca;
	private Professor professor;
	private int id;
	private double avaliacao;
	
	public ProfessorBanca(Banca banca, Professor professor, int id, double avaliacao) {
		this.setBanca(banca);
		this.setProfessor(professor);
		this.id = id;
		this.avaliacao = avaliacao;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getAvaliacao() {
		return avaliacao;
	}

	public void setAvaliacao(double avaliacao) {
		this.avaliacao = avaliacao;
	}

	public Professor getProfessor() {
		return professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

	public Banca getBanca() {
		return banca;
	}

	public void setBanca(Banca banca) {
		this.banca = banca;
	}

}
