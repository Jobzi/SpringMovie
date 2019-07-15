/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Model.DAO.GeneroDAO;
import Model.POJO.Actor;
import Model.POJO.Genero;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


/**
 *
 * @author Jipson Murillo
 */
@Controller 
public class GeneroController {

    @RequestMapping(value = "/genero/index.htm",method=RequestMethod.GET)
    public String index(Model m){
        
           List<Genero> list = GeneroDAO.getlist();
           m.addAttribute("genero",list);
        return "/genero/index"; 
    }


    
    @RequestMapping(value = "/genero/add.htm",method=RequestMethod.GET)
    public ModelAndView save()
    {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("genero/add");
        mav.addObject("genero",new Genero());
        return mav;
    }
        
    @RequestMapping(value = "/genero/add.htm",method=RequestMethod.POST)
    public ModelAndView save
        (
                @ModelAttribute("genero") Genero u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("genero/add");
            mav.addObject("genero",new Genero());
            return mav;
        }else
        {
            GeneroDAO.Save(u);
            
         return new ModelAndView("redirect:/genero/index.htm");
        }
       
        
        
        
    }
        
    @RequestMapping(value = "/genero/edit.htm",method=RequestMethod.GET)
    public ModelAndView edit(HttpServletRequest request)
    {
        ModelAndView mav=new ModelAndView();
        int id=Integer.parseInt(request.getParameter("id"));
        Genero datos=GeneroDAO.getbyID(id);
        mav.setViewName("genero/edit");
        mav.addObject("genero",datos);
        return mav;
    }
             
    @RequestMapping(value = "/genero/edit.htm",method=RequestMethod.POST)
    public ModelAndView edit
        (
                @ModelAttribute("genero") Genero u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("genero/edit");
            mav.addObject("genero",new Genero());
            return mav;
        }else
        {
          //  System.out.println("*************************************ID...."+id+"*************************");
            GeneroDAO.Save(u);
            
         return new ModelAndView("redirect:/genero/index.htm");
        }
       
        
        
        
    }
    
    @RequestMapping(value = "/genero/delete.htm",method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request) 
    {
        int id=Integer.parseInt(request.getParameter("id"));
        GeneroDAO.Delete(id);
        return new ModelAndView("redirect:/genero/index.htm");
    }
    
}
