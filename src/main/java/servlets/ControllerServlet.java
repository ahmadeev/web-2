package servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static servlets.AreaCheckServlet.getDouble;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        //принтер для теста
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        out.println("<html><body>");
//        out.println("<h1>" + request.getParameter("xType") + "</h1>");
//        out.println("<h1>" + request.getParameter("yType") + "</h1>");
//        out.println("<h1>" + request.getParameter("RType") + "</h1>");
//        out.println("</body></html>");
//        out.close();

//        PrintWriter out = response.getWriter();
//        out.println("<html><body>");
//        if (request.getParameter("xType") != null && request.getParameter("yType") != null && request.getParameter("RType") != null) {
//            if (getDouble(request, "yType") >= -5 && getDouble(request, "yType") <= 3) {
//                out.println("<h1>" + request.getParameter("xType") + "</h1>");
//                out.println("<h1>" + request.getParameter("yType") + "</h1>");
//                out.println("<h1>" + request.getParameter("RType") + "</h1>");
//                ServletContext servletContext = getServletContext();
//                RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher("/areaCheck");
//                requestDispatcher.forward(request, response);
//            } else {
//                out.println("<h1>" + request.getParameter("xType") + "</h1>");
//                out.println("<h1>" + request.getParameter("yType") + "</h1>");
//                out.println("<h1>" + request.getParameter("RType") + "</h1>");
//                out.println("<h1>" + "тильт" + "</h1>");
//            }
//        } else {
//            out.println("<h1>" + request.getParameter("xType") + "</h1>");
//            out.println("<h1>" + request.getParameter("yType") + "</h1>");
//            out.println("<h1>" + request.getParameter("RType") + "</h1>");
//            out.println("<h1>" + "2" + "</h1>");
//        }
//        out.println("</body></html>");

        try {
            if (request.getParameter("xType") != null && request.getParameter("yType") != null && request.getParameter("RType") != null) {
                if (getDouble(request, "yType") >= -5 && getDouble(request, "yType") <= 3) {
                    ServletContext servletContext = getServletContext();
                    RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher("/areaCheck");
                    requestDispatcher.forward(request, response);
                } else {
                    ServletContext servletContext = getServletContext();
                    RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher("/index.jsp");
                    requestDispatcher.forward(request, response);
                }
            } else {
                ServletContext servletContext = getServletContext();
                RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher("/index.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (Exception e) {
            sendError(response, e.toString());
        }
    }

    private void sendError(HttpServletResponse response, String errorMessage) throws IOException {
        /*var json = new Gson();
        Map<String, Object> jsonResponse = new HashMap<>() {{
            put("error", errorMessage);
            put("status", "UNPROCESSABLE_ENTITY");
        }};

        response.setContentType("application/json");
        response.getWriter().write(json.toJson(jsonResponse));*/

        response.setContentType("application/text");
        response.getWriter().write(errorMessage);
    }
}
