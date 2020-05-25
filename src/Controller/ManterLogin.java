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

import Model.Aluno;
import Model.Professor;
import Model.Turma;
import Service.UsuarioService;
import Service.AlunoService;
import Service.PesquisaService;
import Service.ProfessorService;
import Service.TurmaService;


/**
 * Servlet implementation class ManterLogin
 */
@WebServlet("/ManterLogin")
public class ManterLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManterLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String erro = null;
		
		//Carrega os dados do BD
		UsuarioService us = new UsuarioService();
		int id = 0;
		try {
			id = us.logar(email, senha);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		RequestDispatcher view = null;
		HttpSession session = request.getSession();	
		
		if(id > 0) {
			ProfessorService ps = new ProfessorService();
			Professor professor = ps.load(id);
			
			//verifica se o usuario Ã© um professor
			if(professor != null) {
				session.setAttribute("usuario", professor);
				session.setAttribute("erro", erro);
				view = request.getRequestDispatcher("ManterMenu?acao=buscar");
				
			}
			//carrega os dados de aluno
			else {
				AlunoService as = new AlunoService();
				Aluno aluno = as.load(id);
				session.setAttribute("aluno", aluno);
				session.setAttribute("erro", erro);
				view = request.getRequestDispatcher("Login.jsp");
				view.forward(request, response);
			}		
		}	
		if(id <= 0) {
			try {
			erro = "Usuario ou senha incorreto";
			session.setAttribute("erro", erro);
			view = request.getRequestDispatcher("Login.jsp");
			}catch(Exception e) {
				e.printStackTrace();
				view = request.getRequestDispatcher("TratamentoErroLogin.jsp");
			}
			
		}
		view.forward(request, response);
	}
}