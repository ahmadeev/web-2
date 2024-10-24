package servlets;

import beans.*;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import static servlets.ControllerServlet.logger;

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
        logger.info("\n----------------------------PROCESSING REQUEST START (/areaCheck)----------------------------");

        ServletContext context = getServletContext();
        Results results = (Results) context.getAttribute("results");

        double x;
        double y;
        double R;

        try {
            x = Double.parseDouble(request.getParameter("xType").replace(",", "."));
            y = Double.parseDouble(request.getParameter("yType").replace(",", "."));
            R = Double.parseDouble(request.getParameter("RType").replace(",", "."));
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

        logger.info("\n----------------------------PROCESSING REQUEST END (/areaCheck)----------------------------");
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
