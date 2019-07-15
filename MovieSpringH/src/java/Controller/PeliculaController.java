/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;



import Manager.FileManager;
import Model.DAO.PeliculaDAO;
import Model.POJO.Pelicula;
import Model.POJO.Director;
import Model.POJO.Formato;
import Model.POJO.Genero;
import java.io.IOException;
import java.net.URISyntaxException;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


/**
 *
 * @author Jipson Murillo
 */
@Controller 
public class PeliculaController {

    @RequestMapping(value = "/pelicula/index.htm",method=RequestMethod.GET)
    public String index(Model m){
        
           List<Pelicula> list = PeliculaDAO.getlist();
           m.addAttribute("pelicula",list);
        return "/pelicula/index"; 
    }


    
    @RequestMapping(value = "/pelicula/add.htm",method=RequestMethod.GET)
    public ModelAndView save()
    {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("pelicula/add");
        mav.addObject("pelicula",new Pelicula());
        return mav;
    }
        
    @RequestMapping(value = "/pelicula/add.htm",method=RequestMethod.POST)
    public ModelAndView save
        (
                @ModelAttribute("Pelicula") Pelicula u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            System.out.println(".............DATOS INCORRECTOS...........");
            System.out.println(result.toString());

            
            ModelAndView mav=new ModelAndView();
            mav.setViewName("pelicula/add");
            mav.addObject("pelicula",new Pelicula());
            return mav;
        }else
        {
            PeliculaDAO.Save(u);
            
         return new ModelAndView("redirect:/pelicula/index.htm");
        }
       
        
        
        
    }
        
    @RequestMapping(value = "/pelicula/edit.htm",method=RequestMethod.GET)
    public ModelAndView edit(HttpServletRequest request)
    {
        ModelAndView mav=new ModelAndView();
        int id=Integer.parseInt(request.getParameter("id"));
        Pelicula datos=PeliculaDAO.getbyID(id);
        mav.setViewName("pelicula/edit");
        mav.addObject("pelicula",datos);

        
        return mav;
    }
             
    @RequestMapping(value = "/pelicula/edit.htm",method=RequestMethod.POST)
     public ModelAndView edit
        (
                @ModelAttribute("Pelicula") Pelicula u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            System.out.println(".............DATOS INCORRECTOS...........");
            System.out.println(result.toString());

            
            ModelAndView mav=new ModelAndView();
            mav.setViewName("pelicula/edit");
            mav.addObject("pelicula",new Pelicula());
            return mav;
        }else
        {
            PeliculaDAO.Update(u);
            
         return new ModelAndView("redirect:/pelicula/index.htm");
        }
       
        
        
        
    }
        
    
    @RequestMapping(value = "/pelicula/delete.htm",method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request) 
    {
        int id=Integer.parseInt(request.getParameter("id"));
        PeliculaDAO.Delete(id);
        return new ModelAndView("redirect:/pelicula/index.htm");
    }
    
     @RequestMapping(value = "/pelicula/reportevalor.htm",method=RequestMethod.GET)
    public String reportevalor(Model m){
        
           List<Pelicula> list = PeliculaDAO.getlist();
           m.addAttribute("pelicula",list);
        return "/pelicula/reportevalor"; 
    }
    
    @RequestMapping(value = "/pelicula/reportevalor.htm",method=RequestMethod.POST)
    public String reportevalor(Model m,@RequestParam("valor") double valor){
           List<Pelicula> list = PeliculaDAO.getReporteValor(valor);
           m.addAttribute("pelicula",list);
        return "/pelicula/index"; 
    }
    
    
    
 }
