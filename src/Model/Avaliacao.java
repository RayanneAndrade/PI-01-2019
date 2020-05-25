package Model;

import java.util.Date;

public class Avaliacao {
	
	private Entrega entrega;
	private double nota;
	private Date dtAvaliacao;
	private String comentario;
	
	public Avaliacao(Entrega entrega, double nota, Date dtAvaliacao, String comentarios) {
		this.entrega = entrega;
		this.nota = nota;
		this.dtAvaliacao = dtAvaliacao;
		this.comentario = comentarios;
	}
	
	public Entrega getEntrega() {
		return entrega;
	}

	public void setEntrega(Entrega entrega) {
		this.entrega = entrega;
	}

	public double getNota() {
		return nota;
	}

	public void setNota(double nota) {
		this.nota = nota;
	}

	public Date getDtAvaliacao() {
		return dtAvaliacao;
	}

	public void setDtAvaliacao(Date dtAvaliacao) {
		this.dtAvaliacao = dtAvaliacao;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	
}
