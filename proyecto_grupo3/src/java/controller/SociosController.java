package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Socio;
import model.SocioDAO;

@WebServlet(name = "SociosController", urlPatterns = {"/SociosController"})
public class SociosController extends HttpServlet {

    SocioDAO dao=new SocioDAO();
    Socio s=new Socio();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {    
        
        String accion = request.getParameter("accion");
        switch (accion) {
            case "Nuevo":
                request.getRequestDispatcher("/Socio/agregar.jsp").forward(request, response);
                break;
            case "Listar":
                List<Socio> datos = dao.listar();
                request.setAttribute("datos", datos);
                request.getRequestDispatcher("/Socio/Socio.jsp").forward(request, response);
                break;
            case "Inicio":
                request.getRequestDispatcher("Socio.jsp").forward(request, response);
                break;
            case "Eliminar":
                String idE = request.getParameter("id");
                dao.delete(idE);
                request.getRequestDispatcher("Controlador?accion=Listar").forward(request, response);
                break;
            case "Guardar":
                String id = request.getParameter("txtId");
                String cedula = request.getParameter("txtCedula");
                String nombre = request.getParameter("txtNombre");
                String apellido = request.getParameter("txtApellido");
                String telefono = request.getParameter("txtTelefono");
                String usuario = request.getParameter("txtUsuario");
                String pass = request.getParameter("txtPass");
                s.setId(id);
                s.setCedula(cedula);
                s.setNombre(nombre);
                s.setApellido(apellido);
                s.setTelefono(telefono);
                s.setUsuario(usuario);
                s.setPass(pass);
                dao.agregar(s);
                request.getRequestDispatcher("/Socio/Socio.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
