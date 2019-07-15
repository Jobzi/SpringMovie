/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;



import Model.DAO.ActorPeliculaDAO;
import Model.POJO.ActorPelicula;
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
public class ActorPeliculaController {

    @RequestMapping(value = "/actorpelicula/index.htm",method=RequestMethod.GET)
    public String index(Model m){
        
           List<ActorPelicula> list = ActorPeliculaDAO.getlist();
           m.addAttribute("actor_pelicula",list);
        return "/actorpelicula/index"; 
    }


    
    @RequestMapping(value = "/actorpelicula/add.htm",method=RequestMethod.GET)
    public ModelAndView save()
    {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("actorpelicula/add");
        mav.addObject("actor_pelicula",new ActorPelicula());
        return mav;
    }
        
    @RequestMapping(value = "/actorpelicula/add.htm",method=RequestMethod.POST)
    public ModelAndView save
        (
                @ModelAttribute("actor_pelicula") ActorPelicula u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("actorpelicula/add");
            mav.addObject("actor_pelicula",new ActorPelicula());
            return mav;
        }else
        {
            ActorPeliculaDAO.Save(u);
            
         return new ModelAndView("redirect:/actorpelicula/index.htm");
        }
       
        
        
        
    }
        
    @RequestMapping(value = "/actorpelicula/edit.htm",method=RequestMethod.GET)
    public ModelAndView edit(HttpServletRequest request)
    {
        ModelAndView mav=new ModelAndView();
        int id=Integer.parseInt(request.getParameter("id"));
        ActorPelicula datos=ActorPeliculaDAO.getbyID(id);
        mav.setViewName("actorpelicula/edit");
        mav.addObject("actor_pelicula",datos);
        return mav;
    }
             
    @RequestMapping(value = "/actorpelicula/edit.htm",method=RequestMethod.POST)
    public ModelAndView edit
        (
                @ModelAttribute("actor_pelicula") ActorPelicula u,
                BindingResult result,
                SessionStatus status
        )
    {
       
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("actorpelicula/edit");
            mav.addObject("actor_pelicula",new ActorPelicula());
            return mav;
        }else
        {
          //  System.out.println("*************************************ID...."+id+"*************************");
            ActorPeliculaDAO.Save(u);
            
         return new ModelAndView("redirect:/actorpelicula/index.htm");
        }
       
        
        
        
    }
    
    @RequestMapping(value = "/actorpelicula/delete.htm",method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request) 
    {
        int id=Integer.parseInt(request.getParameter("id"));
        ActorPeliculaDAO.Delete(id);
        return new ModelAndView("redirect:/actorpelicula/index.htm");
    }
    
}
