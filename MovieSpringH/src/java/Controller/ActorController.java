/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Model.DAO.ActorDAO;
import Model.DAO.SexoDAO;
import Model.POJO.Actor;
import Model.POJO.Sexo;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
public class ActorController {

    @RequestMapping(value = "/actor/index.htm",method=RequestMethod.GET)
    public String index(Model m){
        
           List<Actor> list = ActorDAO.getlist();
           m.addAttribute("actor",list);
        return "/actor/index"; 
    }
    @RequestMapping(value = "/actor/add.htm",method=RequestMethod.GET)
    public ModelAndView save()
    {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("actor/add");
        mav.addObject("actor",new Actor());
        return mav;
    }
        
    @RequestMapping(value = "/actor/add.htm",method=RequestMethod.POST)
    public ModelAndView save
        (
                @ModelAttribute("actor") Actor u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("actor/add");
            mav.addObject("actor",new Actor());
            return mav;
        }else
        {
            ActorDAO.Save(u);
            
         return new ModelAndView("redirect:/actor/index.htm");
        }
       
        
        
        
    }
        
    @RequestMapping(value = "/actor/edit.htm",method=RequestMethod.GET)
    public ModelAndView edit(HttpServletRequest request)
    {
        ModelAndView mav=new ModelAndView();
        int id=Integer.parseInt(request.getParameter("id"));
        Actor datos=ActorDAO.getbyID(id);
        mav.setViewName("actor/edit");
        mav.addObject("actor",datos);
        return mav;
    }
          
    @RequestMapping(value = "/actor/edit.htm",method=RequestMethod.POST)
    public ModelAndView edit
        (
                @ModelAttribute("Actor") Actor u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("actor/edit");
            mav.addObject("actor",new Actor());
            return mav;
        }else
        {
            ActorDAO.Save(u);
            
         return new ModelAndView("redirect:/actor/index.htm");
        }
       
        
        
        
    }
    
    @RequestMapping(value = "/actor/delete.htm",method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request) 
    {
        int id=Integer.parseInt(request.getParameter("id"));
        ActorDAO.Delete(id);
        return new ModelAndView("redirect:/actor/index.htm");
    }
    
@RequestMapping(value = "/actor/reporteactor.htm",method=RequestMethod.GET)
    public String reportesocio(Model m){
        
           List<Actor> list = ActorDAO.getlist();
           m.addAttribute("actor",list);
        return "/actor/reporteactor"; 
    }
    
    @RequestMapping(value = "/actor/reporteactor.htm",method=RequestMethod.POST)
    public String reportesocio(Model m,@RequestParam("valor") String valor){
           List<Actor> list = ActorDAO.getReporteActor(valor);
           m.addAttribute("actor",list);
        return "/actor/index"; 
    }
    
}
