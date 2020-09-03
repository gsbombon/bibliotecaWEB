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
    Socio s =new Socio();
    
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
                request.getRequestDispatcher("agregar.jsp").forward(request, response);
                break;
            case "Listar":
                List<Socio> datos = dao.listar();
                request.setAttribute("datos", datos);
                request.getRequestDispatcher("Socio.jsp").forward(request, response);
                break;
            case "Inicio":
                request.getRequestDispatcher("Socio.jsp").forward(request, response);
                break;
            case "Eliminar":
                String idE = request.getParameter("id");
                dao.delete(idE);
                request.getRequestDispatcher("SociosController?accion=Listar").forward(request, response);
                break;
            case "Guardar":
                String cedula = request.getParameter("txtCedula");
                String nombre = request.getParameter("txtNombre");
                String apellido = request.getParameter("txtApellido");
                String telefono = request.getParameter("txtTelefono");
                String usuario = request.getParameter("txtUsuario");
                String pass = request.getParameter("txtPass");
                
                s.setCedula(cedula);
                s.setNombre(nombre);
                s.setApellido(apellido);
                s.setTelefono(telefono);
                s.setUsuario(usuario);
                s.setPass(pass);
                dao.agregar(s);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "Editar":
                String idP = request.getParameter("id");
                Socio soc = dao.listarSocio(idP);
                request.setAttribute("socio", soc);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "Actualizar":
                String idN = request.getParameter("txtId");
                String cedulaN = request.getParameter("txtCedula");
                String nombreN = request.getParameter("txtNombre");
                String apellidoN = request.getParameter("txtApellido");
                String telefonoN = request.getParameter("txtTelefono");
                String usuarioN = request.getParameter("txtUsuario");
                s.setId(Integer.parseInt(idN));
                s.setCedula(cedulaN);
                s.setNombre(nombreN);
                s.setApellido(apellidoN);
                s.setTelefono(telefonoN);
                s.setUsuario(usuarioN);
                dao.Actualizar(s);
                request.getRequestDispatcher("Socio.jsp").forward(request, response);
                break;
            case "Detalles":
                String idDet = request.getParameter("id");
                Socio socDet = dao.listarSocio(idDet);
                request.setAttribute("socio", socDet);
                request.getRequestDispatcher("detalles.jsp").forward(request, response);
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
