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

import Model.Atividade;
import Model.Tema;
import Model.Turma;
import Service.PesquisaService;
import Service.PesquisaServiceA;
import Service.PesquisaServiceT;
import Service.TemaService;

/**
 * Servlet implementation class ManterTurmaController
 */
@WebServlet("/ManterTemaController.do")
public class ManterTemaController extends HttpServlet {
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
		String pDtCadastro = request.getParameter("dtCadastro");
		String pTitulo = request.getParameter("titulo");
		String pIntroducao = request.getParameter("introducao");
		String pRequisitos = request.getParameter("requisitos");

		int id = 1;
		try {
			id = Integer.parseInt(pId);
		} catch (NumberFormatException e) {

		}
		Date pdtCadastro;
		Tema tema = new Tema();
		tema.setId(id);
		tema.setTitulo(pTitulo);
		tema.setIntroducao(pIntroducao);
		tema.setRequisitos(pRequisitos);

		TemaService ts = new TemaService();
		PesquisaServiceA pesquisaA = new PesquisaServiceA();
		PesquisaServiceT pesquisaT = new PesquisaServiceT();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();
		
		if (pAcao.equals("Criar")) {
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

			try {
				pdtCadastro = sdf.parse(pDtCadastro);
				tema.setDtCadastro(pdtCadastro);
			} catch (ParseException e) {

				e.printStackTrace();
			}
			
			ts.criar(tema);
			ArrayList<Tema> listaTema = new ArrayList<>();
			listaTema.add(tema);
			session.setAttribute("listaTema", listaTema);
			view = request.getRequestDispatcher("ListarTema.jsp");
			
		} else if (pAcao.equals("Excluir")) {
			try {
				ts.excluir(tema.getId());
			ArrayList<Tema> lista = (ArrayList<Tema>) session.getAttribute("lista");
			lista.remove(busca(tema, lista));
			session.setAttribute("lista", lista);
			view = request.getRequestDispatcher("ListarTema.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
				view = request.getRequestDispatcher("TratamentoErroTema.jsp");
			}
		} else if (pAcao.equals("Alterar")) {
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

			try {
				pdtCadastro = sdf.parse(pDtCadastro);
				tema.setDtCadastro(pdtCadastro);
			} catch (ParseException e) {

				e.printStackTrace();
			}
			ts.atualizar(tema);
			ArrayList<Tema> lista = (ArrayList<Tema>) session.getAttribute("lista");
			int pos = busca(tema, lista);
			lista.remove(pos);
			lista.add(pos, tema);
			session.setAttribute("lista", lista);
			request.setAttribute("tema", tema);
			view = request.getRequestDispatcher("VisualizarTema.jsp");

		} else if (pAcao.equals("Visualizar")) {
			tema = ts.carregar(tema.getId());
			request.setAttribute("tema", tema);
			view = request.getRequestDispatcher("VisualizarTema.jsp");
		} else if (pAcao.equals("Editar")) {
			tema = ts.carregar(tema.getId());
			request.setAttribute("tema", tema);
			ArrayList<Atividade> listaAtividade = null;
			listaAtividade = pesquisaA.CarregarTemaId(tema.getId());
			session.setAttribute("listaAtividade", listaAtividade);
			view = request.getRequestDispatcher("AlterarTema.jsp");
		} else if (pAcao.equals("reiniciar")) {
			ArrayList<Tema> lista = null;
			lista = pesquisaT.listarTema();
			session.setAttribute("lista", lista);
			view = request.getRequestDispatcher("CadastroTema.jsp");
		}
		view.forward(request, response);

	}

	public int busca(Tema tema, ArrayList<Tema> lista) {
		Tema to;
		for (int i = 0; i < lista.size(); i++) {
			to = lista.get(i);
			if (to.getId() == tema.getId()) {
				return i;
			}
		}
		return -1;
	}
}
