/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Model.DAO.AlquilerDAO;
import Model.POJO.Alquiler;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class AlquilerController {

    @RequestMapping(value = "/alquiler/index.htm",method=RequestMethod.GET)
    public String index(Model m){
        
           List<Alquiler> list = AlquilerDAO.getlist();
           m.addAttribute("alquiler",list);
        return "/alquiler/index"; 
    }


    
    @RequestMapping(value = "/alquiler/add.htm",method=RequestMethod.GET)
    public ModelAndView save()
    {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("alquiler/add");
        mav.addObject("alquiler",new Alquiler());
        return mav;
    }
        
    @RequestMapping(value = "/alquiler/add.htm",method=RequestMethod.POST)
    public ModelAndView save
        (
                @ModelAttribute("alquiler") Alquiler u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            if(!(u.getAlqFechaEntrega()==null)){
            ModelAndView mav=new ModelAndView();
            mav.setViewName("alquiler/add");

            mav.addObject("alquiler",new Alquiler());
            return mav;
                
            }
            else{
                        AlquilerDAO.Save(u);
            
            return new ModelAndView("redirect:/alquiler/index.htm");
            }
            
        }else
        {
            AlquilerDAO.Save(u);
            
            return new ModelAndView("redirect:/alquiler/index.htm");
        }
       
    }
        
    @RequestMapping(value = "/alquiler/edit.htm",method=RequestMethod.GET)
    public ModelAndView edit(HttpServletRequest request)
    {
        ModelAndView mav=new ModelAndView();
        int id=Integer.parseInt(request.getParameter("id"));
        
        Alquiler datos=AlquilerDAO.getbyID(id);
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        try {
            datos.setAlqFechaDesde(format.parse(datos.getAlqFechaDesde().toString()));
            System.out.println("******"+datos.getAlqFechaDesde().toString());
        } catch (ParseException ex) {
            System.out.println(ex.getMessage());
        }
        mav.setViewName("alquiler/edit");
        mav.addObject("alquiler",datos);
        return mav;
    }
             
    @RequestMapping(value = "/alquiler/edit.htm",method=RequestMethod.POST)
    public ModelAndView edit
        (
                @ModelAttribute("alquiler") Alquiler u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("alquiler/edit");
            mav.addObject("alquiler",new Alquiler());
            return mav;
        }else
        {
          //  System.out.println("*************************************ID...."+id+"*************************");
            AlquilerDAO.Save(u);
            
         return new ModelAndView("redirect:/alquiler/index.htm");
        }
       
        
        
        
    }
    
    @RequestMapping(value = "/alquiler/delete.htm",method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request) 
    {
        int id=Integer.parseInt(request.getParameter("id"));
        AlquilerDAO.Delete(id);
        return new ModelAndView("redirect:/alquiler/index.htm");
    }
    
}
