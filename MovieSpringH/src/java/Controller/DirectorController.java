/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Model.DAO.ActorDAO;
import Model.DAO.DirectorDAO;
import Model.POJO.Director;

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
public class DirectorController {

    @RequestMapping(value = "/director/index.htm",method=RequestMethod.GET)
    public String index(Model m){
        
           List< Director> list = DirectorDAO.getlist();
           m.addAttribute("director",list);
        return "/director/index"; 
    }


    
    @RequestMapping(value = "/director/add.htm",method=RequestMethod.GET)
    public ModelAndView save()
    {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("director/add");
        mav.addObject("director",new Director());
        return mav;
    }
        
    @RequestMapping(value = "/director/add.htm",method=RequestMethod.POST)
    public ModelAndView save
        (
                @ModelAttribute("director") Director u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("director/add");
            mav.addObject("director",new Director());
            return mav;
        }else
        {
            DirectorDAO.Save(u);
            
         return new ModelAndView("redirect:/director/index.htm");
        }
       
        
        
        
    }
        
    @RequestMapping(value = "/director/edit.htm",method=RequestMethod.GET)
    public ModelAndView edit(HttpServletRequest request)
    {
        ModelAndView mav=new ModelAndView();
        int id=Integer.parseInt(request.getParameter("id"));
        Director datos=DirectorDAO.getbyID(id);
        mav.setViewName("director/edit");
        mav.addObject("director",datos);
        return mav;
    }
             
    @RequestMapping(value = "/director/edit.htm",method=RequestMethod.POST)
    public ModelAndView edit
        (
                @ModelAttribute("director") Director u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("director/edit");
            mav.addObject("director",new Director());
            return mav;
        }else
        {
          //  System.out.println("*************************************ID...."+id+"*************************");
            DirectorDAO.Save(u);
            
         return new ModelAndView("redirect:/director/index.htm");
        }
       
        
        
        
    }
    
    @RequestMapping(value = "/director/delete.htm",method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request) 
    {
        int id=Integer.parseInt(request.getParameter("id"));
        DirectorDAO.Delete(id);
        return new ModelAndView("redirect:/director/index.htm");
    }
    
}
