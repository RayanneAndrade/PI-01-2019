package Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

public class Tema implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private Date dtCadastro;
	private String titulo;
	private String introducao;
	private String requisitos;
	private ArrayList <Turma> turma;
	private ArrayList <Atividade> atividade;
	
	
	public Tema(Date dtCadastro, String titulo, String introducao, String requisitos) {
		this.dtCadastro = dtCadastro;
		this.titulo = titulo;
		this.introducao = introducao;
		this.requisitos = requisitos;
	}

	public Tema() {

	}

	public Date getDtCadastro() {
		return dtCadastro;
	}

	public void setDtCadastro(Date dtCadastro) {
		this.dtCadastro = dtCadastro;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getIntroducao() {
		return introducao;
	}

	public void setIntroducao(String introducao) {
		this.introducao = introducao;
	}

	public String getRequisitos() {
		return requisitos;
	}

	public void setRequisitos(String requisitos) {
		this.requisitos = requisitos;
	}

	public ArrayList <Turma> getTurma() {
		return turma;
	}

	public void setTurma(ArrayList <Turma> turma) {
		this.turma = turma;
	}
	
	public ArrayList <Atividade> getAtividade() {
		return atividade;
	}

	public void setAtividade(ArrayList <Atividade> atividade) {
		this.atividade = atividade;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "Tema [id=" + id + ", dtCadastro=" + dtCadastro + ", titulo=" + titulo
				+ ", introducao=" + introducao + ", requisitos=" + requisitos + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Tema other = (Tema) obj;
		if (dtCadastro == null) {
			if (other.dtCadastro != null)
				return false;
		} else if (!dtCadastro.equals(other.dtCadastro))
			return false;
		if (titulo != other.titulo)
			return false;
		if (id != other.id)
			return false;
		if (introducao == null) {
			if (other.introducao != null)
				return false;
		} else if (!introducao.equals(other.introducao))
			return false;
		if (requisitos == null) {
			if (other.requisitos != null)
				return false;
		} else if (!requisitos.equals(other.requisitos))
			return false;
		return true;
	}
}
