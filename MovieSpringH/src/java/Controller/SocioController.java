/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DAO.SocioDAO;
import Model.POJO.Socio;

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
public class SocioController {
    int id;

    @RequestMapping(value = "/socio/index.htm", method = RequestMethod.GET)
    public String index(Model m) {

        List<Socio> list = SocioDAO.getlist();
        m.addAttribute("socio", list);
        return "/socio/index";
    }

    @RequestMapping(value = "/socio/add.htm", method = RequestMethod.GET)
    public ModelAndView save() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("socio/add");
        mav.addObject("socio", new Socio());
        return mav;
    }

    @RequestMapping(value = "/socio/add.htm", method = RequestMethod.POST)
    public ModelAndView save(
            @ModelAttribute("socio") Socio u,
            BindingResult result,
            SessionStatus status
    ) {

        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.setViewName("socio/add");
            mav.addObject("socio", new Socio());
            return mav;
        } else {
            SocioDAO.Save(u);

            return new ModelAndView("redirect:/socio/index.htm");
        }
    }

    @RequestMapping(value = "/socio/edit.htm", method = RequestMethod.GET)
    public ModelAndView edit(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        id = Integer.parseInt(request.getParameter("id"));
        //System.out.println("*************************************ID...." + id + "*************************");

        Socio datos = SocioDAO.getbyID(id);
        mav.setViewName("socio/edit");
        mav.addObject("socio", datos);
        return mav;
    }

    @RequestMapping(value = "/socio/edit.htm", method = RequestMethod.POST)
    public ModelAndView edit(
            @ModelAttribute("socio") Socio u,
            BindingResult result,
            SessionStatus status
    ) {

        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.setViewName("socio/edit");
            mav.addObject("socio", new Socio());
            return mav;
        } else {
            //System.out.println("*************************************ID...." + u.getSocId() + "*************************");
            u.setSocId(id);
            SocioDAO.Save(u);

            return new ModelAndView("redirect:/socio/index.htm");
        }

    }

    @RequestMapping(value = "/socio/delete.htm", method = RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        SocioDAO.Delete(id);
        return new ModelAndView("redirect:/socio/index.htm");
    }
 
@RequestMapping(value = "/socio/reportesocio.htm",method=RequestMethod.GET)
    public String reportesocio(Model m){
        
           List<Socio> list = SocioDAO.getlist();
           m.addAttribute("socio",list);
        return "/socio/reportesocio"; 
    }
    
    @RequestMapping(value = "/socio/reportesocio.htm",method=RequestMethod.POST)
    public String reportesocio(Model m,@RequestParam("valor") String valor){
           List<Socio> list = SocioDAO.getReporteNombre(valor);
           m.addAttribute("socio",list);
        return "/socio/index"; 
    }  
}
