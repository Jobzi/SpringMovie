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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


/**
 *
 * @author Jipson Murillo
 */
@Controller 
public class SexoController {

    @RequestMapping(value = "/sexo/index.htm",method=RequestMethod.GET)
    public String index(Model m){
        
           List<Sexo> list = SexoDAO.getlist();
           m.addAttribute("sexo",list);
        return "/sexo/index"; 
    }


    
    @RequestMapping(value = "/sexo/add.htm",method=RequestMethod.GET)
    public ModelAndView save()
    {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("sexo/add");
        mav.addObject("sexo",new Sexo());
        return mav;
    }
        
    @RequestMapping(value = "/sexo/add.htm",method=RequestMethod.POST)
    public ModelAndView save
        (
                @ModelAttribute("Sexo") Sexo u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("sexo/add");
            mav.addObject("Sexo",new Sexo());
            return mav;
        }else
        {
            SexoDAO.Save(u);
            
         return new ModelAndView("redirect:/sexo/index.htm");
        }
       
        
        
        
    }
        
    @RequestMapping(value = "/sexo/edit.htm",method=RequestMethod.GET)
    public ModelAndView edit(HttpServletRequest request)
    {
        ModelAndView mav=new ModelAndView();
        int id=Integer.parseInt(request.getParameter("id"));
        Sexo datos=SexoDAO.getbyID(id);
        mav.setViewName("sexo/edit");
        mav.addObject("sexo",datos);
        return mav;
    }
             
    @RequestMapping(value = "/sexo/edit.htm",method=RequestMethod.POST)
    public ModelAndView edit
        (
                @ModelAttribute("Sexo") Sexo u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("sexo/edit");
            mav.addObject("Sexo",new Sexo());
            return mav;
        }else
        {
          //  System.out.println("*************************************ID...."+id+"*************************");
            SexoDAO.Save(u);
            
         return new ModelAndView("redirect:/sexo/index.htm");
        }
       
        
        
        
    }
    
    @RequestMapping(value = "/sexo/delete.htm",method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request) 
    {
        int id=Integer.parseInt(request.getParameter("id"));
        SexoDAO.Delete(id);
        return new ModelAndView("redirect:/sexo/index.htm");
    }
    
}
