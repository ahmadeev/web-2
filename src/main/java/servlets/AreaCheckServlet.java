package servlets;

import utils.Point;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //принтер для теста
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + "meow" + "</h1>");
        out.println("</body></html>");
        out.close();

//        try {
//            int x = Integer.parseInt(request.getParameter("xType"));
//            double y = getDouble(request, "yType");
//            int r = Integer.parseInt(request.getParameter("RType"));
//            Point point = new Point(x, y, r);
//
//        } catch (Exception e) {
//
//        }
    }

    public static double getDouble(HttpServletRequest request, String inputParameter) {
        String parameter = request.getParameter(inputParameter);
        return Double.parseDouble(parameter.replace(",", "."));
    }
}
