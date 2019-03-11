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
 * Servlet implementation class Deleate
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") == null) {
		// ログイン画面サーブレットにリダイレクト
			response.sendRedirect("LoginServlet");
			return;
		}

		// URLからGETパラメータとしてIDを受け取る
		String id = request.getParameter("id");

		UserDao dao = new UserDao();
		User user = dao.UserData(id);
		request.setAttribute("user",user);

		// フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/Delete.jsp");
		dispatcher.forward(request, response);
		}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// リクエストパラメータの文字コードを指定
        request.setCharacterEncoding("UTF-8");

		//リクエストパラメーターの取得
        String id = request.getParameter("id");
        String ok = request.getParameter("OK");

		UserDao user = new UserDao();

		//OKな時
		if(ok!=null&&id!=null) {
		//消す
		user.Delete(id);

		//全件表示
		// ユーザ一覧情報を取得
		UserDao userDao = new UserDao();
		ArrayList<User> userList = userDao.AllUser();

		// リクエストスコープにユーザ一覧情報をセット
		request.setAttribute("userList", userList);

		// フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/UserList.jsp");
		dispatcher.forward(request, response);
		return ;
		}else {

		//キャンセルした時

		//全件表示
		// ユーザ一覧情報を取得
		UserDao userDao = new UserDao();
		ArrayList<User> userList = userDao.AllUser();

		// リクエストスコープにユーザ一覧情報をセット
		request.setAttribute("userList", userList);

		// ユーザ一覧のサーブレットにリダイレクト
		response.sendRedirect("UserListServlet");
		}
	}
}