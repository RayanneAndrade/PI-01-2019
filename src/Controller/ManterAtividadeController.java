package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import Model.Atividade;
import Model.Tema;
import Service.AtividadeService;
import Service.TemaService;

/**
 * Servlet implementation class ManterTurmaController
 */
@WebServlet("/ManterAtividadeController.do")
public class ManterAtividadeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String pAcao = request.getParameter("acao");
		String pId = request.getParameter("id");
		int pNumero = Integer.parseInt(request.getParameter("numero") == null ? "0" : request.getParameter("numero"));
		String pDescricao = request.getParameter("descricao");
		String pFormatoEntrega = request.getParameter("formatoEntrega");
		String pDataInicio = request.getParameter("dataInicial");
		String pDataFinal = request.getParameter("dataFinal");
		String pTemaId = request.getParameter("temaId");

		int temaId = 0;
		int id = 1;
		try {
			id = Integer.parseInt(pId);
		} catch (NumberFormatException e) {
		}

		try {
			temaId = Integer.parseInt(pTemaId);
		} catch (NumberFormatException e) {
		}

		// instanciar o javabean
		Date pdtFinal;
		Date pdtInicio;
		Atividade atividade = new Atividade();
		Tema tema = new Tema();
		tema.setId(temaId);
		atividade.setIdAtividade(id);
		atividade.setNumero(pNumero);
		atividade.setTema(tema);
		atividade.setDescricao(pDescricao);
		atividade.setFormatoEntrega(pFormatoEntrega);

		AtividadeService as = new AtividadeService();
		TemaService ts = new TemaService();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();

		if (pAcao.equals("Criar")) {
			tema = ts.carregar(tema.getId());
			request.setAttribute("temaId", tema);

			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			try {
				pdtInicio = sdf.parse(pDataInicio);
				pdtFinal = sdf.parse(pDataFinal);

				atividade.setDataInicio(pdtInicio);
				atividade.setDataFinal(pdtFinal);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			as.criar(atividade);
			ArrayList<Atividade> listaAtividade = new ArrayList<>();
			listaAtividade.add(atividade);
			session.setAttribute("listaAtividade", listaAtividade);
			view = request.getRequestDispatcher("AlterarTema.jsp");
		} else if (pAcao.equals("Excluir")) {
				try {
					as.excluir(atividade.getId());
					ArrayList<Atividade> listaAtividade = (ArrayList<Atividade>) session.getAttribute("listaAtividade");
					listaAtividade.remove(buscar(atividade, listaAtividade));
					session.setAttribute("listaAtividade", listaAtividade);
					view = request.getRequestDispatcher("AlterarTema.jsp");
				} catch (SQLException e) {
					e.printStackTrace();
					view = request.getRequestDispatcher("TratamentoErroAtividade.jsp");
				}
						
		} else if (pAcao.equals("Alterar")) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			try {
				pdtInicio = sdf.parse(pDataInicio);
				pdtFinal = sdf.parse(pDataFinal);

				atividade.setDataInicio(pdtInicio);
				atividade.setDataFinal(pdtFinal);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			as.atualizar(atividade);
			ArrayList<Atividade> listaAtividade = (ArrayList<Atividade>) session.getAttribute("listaAtividade");
			int pos = buscar(atividade, listaAtividade);
			listaAtividade.remove(pos);
			listaAtividade.add(pos, atividade);
			session.setAttribute("listaAtividade", listaAtividade);
			request.setAttribute("atividade", atividade);
			view = request.getRequestDispatcher("VisualizarAtividade.jsp");
		} else if (pAcao.equals("Visualizar")) {
			atividade = as.carregar(atividade.getId());
			request.setAttribute("atividade", atividade);
			view = request.getRequestDispatcher("VisualizarAtividade.jsp");
		} else if (pAcao.equals("Editar")) {
			atividade = as.carregar(atividade.getId());
			request.setAttribute("atividade", atividade);
			view = request.getRequestDispatcher("AlterarAtividade.jsp");
		} else if (pAcao.equals("pegarID")) {
			tema = ts.carregar(tema.getId());
			request.setAttribute("tema", tema);
			view = request.getRequestDispatcher("CadastroAtividade.jsp");
		}
		view.forward(request, response);

	}

	public int buscar(Atividade atividade, ArrayList<Atividade> listaAtividade) {
		Atividade at;
		for (int i = 0; i < listaAtividade.size(); i++) {
			at = listaAtividade.get(i);
			if (at.getId() == atividade.getId()) {
				return i;
			}
		}
		return -1;
	}

	public int busca(Tema tema, ArrayList<Tema> listaTema) {
		Tema to;
		for (int i = 0; i < listaTema.size(); i++) {
			to = listaTema.get(i);
			if (to.getId() == tema.getId()) {
				return i;
			}
		}
		return -1;
	}
}
