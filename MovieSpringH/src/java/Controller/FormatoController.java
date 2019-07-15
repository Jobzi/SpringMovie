/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Model.DAO.FormatoDAO;

import Model.POJO.Actor;
import Model.POJO.Formato;
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
public class FormatoController {

    @RequestMapping(value = "/formato/index.htm",method=RequestMethod.GET)
    public String index(Model m){
        
           List<Formato> list = FormatoDAO.getlist();
           m.addAttribute("formato",list);
        return "/formato/index"; 
    }


    
    @RequestMapping(value = "/formato/add.htm",method=RequestMethod.GET)
    public ModelAndView save()
    {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("formato/add");
        mav.addObject("formato",new Formato());
        return mav;
    }
        
    @RequestMapping(value = "/formato/add.htm",method=RequestMethod.POST)
    public ModelAndView save
        (
                @ModelAttribute("formato") Formato u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("formato/add");
            mav.addObject("formato",new Formato());
            return mav;
        }else
        {
            FormatoDAO.Save(u);
            
         return new ModelAndView("redirect:/formato/index.htm");
        }
       
        
        
        
    }
        
    @RequestMapping(value = "/formato/edit.htm",method=RequestMethod.GET)
    public ModelAndView edit(HttpServletRequest request)
    {
        ModelAndView mav=new ModelAndView();
        int id=Integer.parseInt(request.getParameter("id"));
        Formato datos=FormatoDAO.getbyID(id);
        mav.setViewName("formato/edit");
        mav.addObject("formato",datos);
        return mav;
    }
             
    @RequestMapping(value = "/formato/edit.htm",method=RequestMethod.POST)
    public ModelAndView edit
        (
                @ModelAttribute("formato") Formato u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("formato/edit");
            mav.addObject("formato",new Formato());
            return mav;
        }else
        {
          //  System.out.println("*************************************ID...."+id+"*************************");
            FormatoDAO.Save(u);
            
         return new ModelAndView("redirect:/formato/index.htm");
        }
       
        
        
        
    }
    
    @RequestMapping(value = "/formato/delete.htm",method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request) 
    {
        int id=Integer.parseInt(request.getParameter("id"));
        FormatoDAO.Delete(id);
        return new ModelAndView("redirect:/formato/index.htm");
    }
    
}
