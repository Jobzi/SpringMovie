/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Manager.FileManager;
import Model.DAO.DropDownDAO;
import Model.DAO.PeliculaDAO;
import Model.DAO.SocioDAO;
import Model.POJO.Pelicula;
import Model.POJO.Socio;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Vector;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

/**
 *
 * @author Jipson Murillo
 */
@Controller 

public class FileController {
      
    @RequestMapping(value = "/manager/index.htm", method = RequestMethod.GET)
    public String index(Model m) {

         Vector list = DropDownDAO.getViewDataPeliculas();
         m.addAttribute("peliculas",list.get(0));
         m.addAttribute("valores",list.get(0));
        return "/file/index";
    }
    
     @RequestMapping(value = "/file/download.htm", method = RequestMethod.GET)
     public void downloadPDFResource( HttpServletRequest request,
                                     HttpServletResponse response
                                     )
    {   
        String fName=request.getParameter("tag");
        String dataDirectory = request.getServletContext().getRealPath("/WEB-INF/jsp/file/");              
        String imagedir = request.getServletContext().getRealPath("/resources/images/logo1.png");
        System.out.println("imag"+imagedir);
        FileManager fm =new FileManager(dataDirectory,fName,imagedir,"REPORTE "+fName.toUpperCase());
        fm.createPdfFile();
        
        
        Path file = Paths.get(dataDirectory, fName+".pdf");

        if (Files.exists(file))
        {
            response.setContentType("application/pdf");
            response.addHeader("Content-Disposition", "attachment; filename="+fm.getDocname());
            try
            {
                Files.copy(file, response.getOutputStream());
                response.getOutputStream().flush();
                        System.out.println("******************DESCARGA EXITOSA****************");
            }
            catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
