package servlets;

import beans.*;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

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

        ServletContext context = getServletContext();
        Results results = (Results) context.getAttribute("results");

        double x;
        double y;
        double R;

        try {
            x = getDouble(request, "xType");
            y = getDouble(request, "yType");
            R = getDouble(request, "RType");
        } catch (NumberFormatException e) {
            throw new RuntimeException("Wrong type arguments!");
        }

        Hit hit = new Hit();
        hit.setResult(isHit(x, y, R));

        double scale = Math.pow(10, 2);

        x = Math.ceil(x * scale) / scale;
        y = Math.ceil(y * scale) / scale;

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

    private boolean isHit(double x, double y, double r) {
        //Top-right
        if (x > 0 && y >= 0) {
            return (x * x + y * y) <= (r / 2) * (r / 2);
        }
        //Top-left
        if (x <= 0 && y >= 0) {
            return (y <= r) && (x >= (-r) / 2);
        }
        //Bottom-left
        if (x <= 0 && y <= 0) {
            return (y >= -x - r / 2);
        }
        //Bottom-right
        return false;
    }
}
