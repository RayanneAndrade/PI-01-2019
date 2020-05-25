package Model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Turma implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private int semestreLetivo;
	private int anoLetivo;
	private String sigla;
	private Tema tema;
	private List <Tema> ListaTemaCombo;
	
	public void inicializar(){
		this.ListaTemaCombo = new ArrayList<Tema>();
	}
	
	public Turma(int semestreLetivo, int anoLetivo, String sigla, Tema tema) {
		this.semestreLetivo = semestreLetivo;
		this.anoLetivo = anoLetivo;
		this.sigla = sigla;
		this.tema = tema;
	}
	
	public Turma() {
		
	}
	
	public Turma(int semestreLetivo, int anoLetivo) {
		super();
		this.semestreLetivo = semestreLetivo;
		this.anoLetivo = anoLetivo;
	}

	public int getSemestreLetivo() {
		return semestreLetivo;
	}

	public void setSemestreLetivo(int semestreLetivo) {
		this.semestreLetivo = semestreLetivo;
	}

	public int getAnoLetivo() {
		return anoLetivo;
	}

	public void setAnoLetivo(int pAnoLetivo) {
		this.anoLetivo = pAnoLetivo;
	}

	public String getSigla() {
		return sigla;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
	}

	public Tema getTema() {
		return tema;
	}

	public void setTema(Tema tema) {
		this.tema = tema;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}	
	
	public List<Tema> getListaTemaCombo() {
		return ListaTemaCombo;
	}

	public void setListaTemaCombo(List<Tema> listaTemaCombo) {
		ListaTemaCombo = listaTemaCombo;
	}

	@Override
	public String toString() {
		return "Turma [id=" + id + ", semestreLetivo=" + semestreLetivo + ", anoLetivo=" + anoLetivo
				+ ", sigla=" + sigla + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Turma other = (Turma) obj;
		if (sigla == null) {
			if (other.sigla != null)
				return false;
		} else if (!sigla.equals(other.sigla))
			return false;
		if (semestreLetivo != other.semestreLetivo)
			return false;
		if (id != other.id)
			return false;
		if (anoLetivo == 0) {
			if (other.anoLetivo != 0)
				return false;
		} if (anoLetivo != other.anoLetivo)
			return false;
		return true;
	}
}
