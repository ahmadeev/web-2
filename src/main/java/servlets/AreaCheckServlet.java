package servlets;

import beans.*;
import utils.Point;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

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
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        out.println("<html><body>");
//        out.println("<h1>" + "meow" + "</h1>");
//        out.println("<p>x: " + request.getParameter("xType") + ", y: " + request.getParameter("yType") + ", R:  " + request.getParameter("RType") + "</p>");
//        out.println("</body></html>");
//        out.println("<a href=\"index.jsp\">back to main page</a>");
//        out.close();


        ServletContext context = getServletContext();
        Results results = (Results) context.getAttribute("results");

        double x;
        double y;
        int R;

        try {
            x = getDouble(request, "xType");
            y = getDouble(request, "yType");
            R = Integer.parseInt(request.getParameter("RType"));
        } catch (NumberFormatException e) {
            throw new RuntimeException("Wrong type arguments!");
        }

        Hit hit = new Hit();
        hit.setResult(isHit(x, y, R));

        double scale = Math.pow(10, 2);

        x = Math.ceil(x * scale) / scale;
        y = Math.ceil(y * scale) / scale;

//        double scale = Math.pow(10, 2);
//        x = x / scale + Math.ceil(x * scale % 10);
//        y = y / scale + Math.ceil(y * scale % 10);

        hit.setX(x);
        hit.setY(y);
        hit.setR(R);

        results.getResults().add(hit);
        context.setAttribute("results", results);
        request.setAttribute("result", hit);
        request.setAttribute("results", context.getAttribute("results"));
        context.getRequestDispatcher("/result.jsp").forward(request, response);

    }

    public static double getDouble(HttpServletRequest request, String inputParameter) {
        String parameter = request.getParameter(inputParameter);
        return Double.parseDouble(parameter.replace(",", "."));
    }

    private boolean isHit(double x, double y, int r) {
        //Top-right
        if (x >= 0 && y >= 0) {
            return (x * x + y * y) <= (r / 2) * (r / 2);
        }
        //Top-left
        if (x < 0 && y >= 0) {
            return (y <= r) && (x >= (-r) / 2);
        }
        //Bottom-left
        if (x <= 0 && y < 0) {
            return (y >= -x - r / 2);
        }
        //Bottom-right
        return false;
    }
}
