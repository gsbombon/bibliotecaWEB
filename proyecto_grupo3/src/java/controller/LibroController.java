
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Autor;
import model.Libro;
import model.LibroDAO;


@WebServlet(name = "LibroController", urlPatterns = {"/LibroController"})
public class LibroController extends HttpServlet {
    LibroDAO dao = new LibroDAO();
    Libro li = new Libro();
    Autor aut = new Autor();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LibroController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LibroController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        switch(accion){
            case "Listar Libros":
                List<Libro>datos=dao.listar();
                request.setAttribute("datos", datos);
                request.getRequestDispatcher("Libro/Libros.jsp").forward(request, response);
                break;
            case "Guardar":
                String titulo=request.getParameter("txtTitulo");
                String autor=request.getParameter("txtAutor");
                String editorial=request.getParameter("txtEditorial");
                String escrito=request.getParameter("txtEscrito");
                String edicion=request.getParameter("txtEdicion");
                String isbn=request.getParameter("txtIsbn");
                li.setTitulo(titulo);
                li.setEditorial(editorial);
                li.setAnioEscrito(Integer.parseInt(escrito));
                li.setAnioEdicion(Integer.parseInt(edicion));
                li.setIsbn(Integer.parseInt(isbn));
                aut.setNombre(autor);
                dao.agregar(li, aut);
                request.getRequestDispatcher("LibroController?accion=Listar Libros").forward(request, response);
                break;
                
            case "Detalle":
                String ide=request.getParameter("id");
                Libro li1 = dao.detalleId(ide);
                request.setAttribute("libro",li1);
                request.getRequestDispatcher("Libro/Detalle.jsp").forward(request, response);
                break;
                
            case "Editar":
                String ide1=request.getParameter("id");
                Libro li2 = dao.listarId(ide1);
                request.setAttribute("libro2",li2);
                request.getRequestDispatcher("Libro/Editar.jsp").forward(request, response);
                break;
                
            case "Actualizar":
                String id1=request.getParameter("txtId");
                String titulo1=request.getParameter("txtTitulo");
                String autor1=request.getParameter("txtAutor");
                String editorial1=request.getParameter("txtEditorial");
                String escrito1=request.getParameter("txtEscrito");
                String edicion1=request.getParameter("txtEdicion");
                String isbn1=request.getParameter("txtIsbn");
                System.out.println("id1: "+id1);
                li.setId(Integer.parseInt(id1));
                li.setTitulo(titulo1);
                li.setEditorial(editorial1);
                li.setAnioEscrito(Integer.parseInt(escrito1));
                li.setAnioEdicion(Integer.parseInt(edicion1));
                li.setIsbn(Integer.parseInt(isbn1));
                aut.setId(li.getId());
                aut.setNombre(autor1);

                dao.actualizar(li,aut);
                request.getRequestDispatcher("LibroController?accion=Listar Libros").forward(request, response);
                break;
                
            case "Eliminar":
                String id2 = request.getParameter("id");
                dao.delete(Integer.parseInt(id2));
                request.getRequestDispatcher("LibroController?accion=Listar Libros").forward(request, response);
                break;
                
            case "Libros":
                List<Libro>datos1=dao.listar();
                request.setAttribute("datos", datos1);
                request.getRequestDispatcher("Libro/LibroSocio.jsp").forward(request, response);
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
