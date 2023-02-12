
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ProductServlet
 */
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Product proObj = new Product();

		proObj.setProductId(Integer.parseInt(request.getParameter("pId")));
		proObj.setProductName(request.getParameter("pNm"));
		proObj.setProductPrice(Integer.parseInt(request.getParameter("pPri")));
		proObj.setProductQty(Integer.parseInt(request.getParameter("pQty")));
		proObj.setProductType(request.getParameter("pTyp"));

		ProductDAO proDAOObj = new ProductDAO();
		if (proDAOObj.insertRecord(proObj)) {
			response.sendRedirect("Success.html");
		} else {
			response.sendRedirect("Retry.html");
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
