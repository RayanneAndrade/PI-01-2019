package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Tema;
import Model.Turma;
import Service.PesquisaService;
import Service.PesquisaServiceT;
import Service.TemaService;
import Service.TurmaService;

/**
 * Servlet implementation class ManterTurmaController
 */
@WebServlet("/ManterTurmaController.do")
public class ManterTurmaController extends HttpServlet {
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
		int pSemestreLetivo = Integer.parseInt(
				request.getParameter("semestreLetivo") == null ? "0" : request.getParameter("semestreLetivo"));
		int pAnoLetivo = Integer
				.parseInt(request.getParameter("anoLetivo") == null ? "0" : request.getParameter("anoLetivo"));
		String pSigla = request.getParameter("sigla");
		int pTemaId = Integer.parseInt(request.getParameter("TemaId") == null ? "0" : request.getParameter("TemaId"));

		int id = -1;
		try {
			id = Integer.parseInt(pId);
		} catch (NumberFormatException e) {

		}

		// instanciar o javabean
		Turma turma = new Turma();
		Tema tema = new Tema();
		tema.setId(pTemaId);
		turma.setId(id);
		turma.setSemestreLetivo(pSemestreLetivo);
		turma.setAnoLetivo(pAnoLetivo);
		turma.setSigla(pSigla);
		turma.setTema(tema);
		TurmaService ts = new TurmaService();
		PesquisaServiceT pesquisaT = new PesquisaServiceT();
		RequestDispatcher view = null;
		HttpSession session = request.getSession();

		if (pAcao.equals("Criar")) {
			try {
				ts.criar(turma);
				ArrayList<Turma> lista = new ArrayList<>();
				lista.add(turma);
				session.setAttribute("lstTurmas", lista);
				view = request.getRequestDispatcher("ListarTurma.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
				view = request.getRequestDispatcher("TratamentoErroTurma.jsp");
			}
		} else if (pAcao.equals("Excluir")) {
			ts.excluir(turma.getId());
			ArrayList<Turma> lista = (ArrayList<Turma>) session.getAttribute("lstTurmas");
			lista.remove(busca(turma, lista));
			session.setAttribute("lista", lista);
			view = request.getRequestDispatcher("ListarTurma.jsp");
		} else if (pAcao.equals("Alterar")) {
			ts.atualizar(turma);
			ArrayList<Turma> lista = (ArrayList<Turma>) session.getAttribute("lstTurmas");
			int pos = busca(turma, lista);
			lista.remove(pos);
			lista.add(pos, turma);
			session.setAttribute("lista", lista);
			request.setAttribute("turma", turma);
			view = request.getRequestDispatcher("VisualizarTurma.jsp");
		} else if (pAcao.equals("Visualizar")) {
			turma = ts.carregar(turma.getId());
			request.setAttribute("turma", turma);
			view = request.getRequestDispatcher("VisualizarTurma.jsp");
		} else if (pAcao.equals("Editar")) {
			turma = ts.carregar(turma.getId());
			request.setAttribute("turma", turma);
			view = request.getRequestDispatcher("AlterarTurma.jsp");
		} else if (pAcao.equals("reiniciar")) {
			ArrayList<Tema> lista = null;
			lista = pesquisaT.listarTema();
			session.setAttribute("lista", lista);
			view = request.getRequestDispatcher("CadastroTurma.jsp");
		}
		view.forward(request, response);
	}

	public int busca(Turma turma, ArrayList<Turma> listaTurma) {
		Turma x;
		for (int i = 0; i < listaTurma.size(); i++) {
			x = listaTurma.get(i);
			if (x.getId() == turma.getId()) {
				return i;
			}
		}
		return -1;
	}
}
