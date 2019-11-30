package controller;

import dao.CourseDAO;
import dao.DBOperationDAO;
import vo.CourseVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "HomeController",urlPatterns = {"/home"})
public class HomeController extends HttpServlet {
    private void doProcess(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session==null){
            response.sendRedirect(request.getServletContext().getContextPath()+"/login");
            return;
        }else{
            if(session.getAttribute("token")==null){
                response.sendRedirect(request.getServletContext().getContextPath()+"/login");
                return;
            }else{
                request.getRequestDispatcher("/WEB-INF/jsp/course_create.jsp").forward(request,response);
            }
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request,response);
    }
}
