package Model;
import java.io.Serializable;
import java.util.Date;

public class Atividade implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private Tema tema;
	private int numero;
	private String descricao;
	private String formatoEntrega;
	private Date dataInicial;
	private Date dataFinal;
	
	public Atividade(int id, Tema tema, int numero, String descricao, String formatoEntrega, Date dataInicial, Date dataFinal){
		this.id = id;
		this.tema = tema;
		this.numero = numero;
		this.descricao = descricao;
		this.formatoEntrega = formatoEntrega;
		this.dataInicial = dataInicial;
		this.dataFinal = dataFinal;
	}
	
	public Atividade() {
		
	}
	
	public int getId() {
		return id;
	}
	
	public void setIdAtividade(int id) {
		this.id = id;
	}
	
	public Tema getTema() {
		return tema;
	}
	
	public void setTema(Tema tema) {
		this.tema = tema;
	}
	
	public int getNumero() {
		return numero;
	}
	
	public void setNumero(int numero) {
		this.numero = numero;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getFormatoEntrega() {
		return formatoEntrega;
	}
	
	public void setFormatoEntrega(String formatoEntrega) {
		this.formatoEntrega = formatoEntrega;
	}
	
	public Date getDataInicial() {
		return dataInicial;
	}
	
	public void setDataInicio(Date  dataInicial) {
		this.dataInicial =  dataInicial;
	}
	
	public Date getDataFinal() {
		return dataFinal;
	}
	
	public void setDataFinal(Date dataFinal) {
		this.dataFinal = dataFinal;
	}

	@Override
	public String toString() {
		return "Atividade [id=" + id + ", numero=" + numero + ", descricao=" + descricao
				+ ",formatoEntrega=" + formatoEntrega + ", dataInicio=" + dataInicial + ", dataFinal=" + dataFinal + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Atividade other = (Atividade) obj;
		if (dataInicial == null) {
			if (other.dataInicial != null)
				return false;
		} else if (!dataInicial.equals(other.dataInicial))
			return false;
		if (numero != other.numero)
			return false;
		if (id != other.id)
			return false;
		if (dataFinal == null) {
			if (other.dataFinal != null)
				return false;
		} else if (!dataFinal.equals(other.dataFinal))
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		return true;
	}
}
