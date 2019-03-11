package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.User;

/**
 * Servlet implementation class UserListServlet
 */
@WebServlet("/UserListServlet")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO 未実装：ログインセッションがない場合、ログイン画面にリダイレクトさせる

		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") == null) {
		// ログイン画面サーブレットにリダイレクト
			response.sendRedirect("LoginServlet");
			return;
		}

		//全件表示
		// ユーザ一覧情報を取得
		UserDao userDao = new UserDao();
		ArrayList<User> userList = userDao.AllUser();

		// リクエストスコープにユーザ一覧情報をセット
		request.setAttribute("userList", userList);


		// フォワード
				RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/UserList.jsp");
				dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO  未実装：検索処理全般

		request.setCharacterEncoding("UTF-8");

		// リクエストパラメータの入力項目を取得
		String loginId = request.getParameter("loginId");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String birthday2 = request.getParameter("birthday2");

		// ユーザ一覧情報を取得
		UserDao userDao = new UserDao();
		ArrayList<User> userList = userDao.UserList(loginId,name,birthday,birthday2);


		// リクエストスコープにユーザ一覧情報をセット
		request.setAttribute("userList", userList);

		// ユーザ一覧のjspにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/UserList.jsp");
		dispatcher.forward(request, response);
	}
}