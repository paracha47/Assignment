package com.java.controller;

import com.java.model.project;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
public class springController {

    private int p_total_cost = 0;
    private int p_duration = 0;
    private int i= 1;
    private HashMap<Integer,project> map = new HashMap<Integer, project>();

    @RequestMapping(value = "/index" , method = RequestMethod.GET)
    public ModelAndView project(Model model) {

        if (!map.isEmpty()){
            getTotalCost();
            model.addAttribute("mapList",map);
            model.addAttribute("total_cost",p_total_cost);
            model.addAttribute("total_duration",p_duration);
        }
        return new ModelAndView("index", "project", new project());
    }

    @RequestMapping(value = "/addProject", method = RequestMethod.POST)
    public ModelAndView addStudent(@ModelAttribute("project")project project, ModelMap model) {
        map.put(i,project);
        getTotalCost();
        model.addAttribute("mapList",map);
        model.addAttribute("total_cost",p_total_cost);
        model.addAttribute("total_duration",p_duration);
        i++;
        return new ModelAndView("index");
    }

    @RequestMapping("/editProject/{id}")
    public ModelAndView editProject(Model model, @PathVariable("id") int id){

        if (map.containsKey(id))
        {

            project p = map.get(id);
            System.out.println(" project module name "+p.getM_Name()+" cost "+p.getM_cost());
            model.addAttribute("pro",p);
            model.addAttribute("id",id);

            return new ModelAndView("editPage","project",p);
        }
        return new ModelAndView("editPage","project",new project());
    }

    @RequestMapping("/updateModule/{id}")
    public ModelAndView updateModule(Model model, @PathVariable("id") int id,@ModelAttribute("project") project project){

        if (map.containsKey(id))
        {
            map.put(id,project);
            model.addAttribute("mapList",map);
            getTotalCost();
            model.addAttribute("total_cost",p_total_cost);
            model.addAttribute("total_duration",p_duration);

        }
        return new ModelAndView("index");
    }

    @RequestMapping("/{id}")
    public ModelAndView deleteModule(Model model, @PathVariable("id") int id){

        System.out.println(" delete module id : "+id);
        if (map.containsKey(id)){
            map.remove(id);
            getTotalCost();
        }
        return new ModelAndView("redirect:index");
    }

    public void getTotalCost(){
        p_total_cost = 0;
        p_duration = 0;
        if (!map.isEmpty()) {
            for (Map.Entry<Integer, project> m : map.entrySet()) {
                p_total_cost += Integer.parseInt(m.getValue().getM_cost());
                p_duration += Integer.parseInt(m.getValue().getM_duration());
            }
        }
    }
}
