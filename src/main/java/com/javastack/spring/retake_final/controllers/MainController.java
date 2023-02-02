package com.javastack.spring.retake_final.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javastack.spring.retake_final.models.LoginUser;
import com.javastack.spring.retake_final.models.Yoga;
import com.javastack.spring.retake_final.models.User;
import com.javastack.spring.retake_final.services.YogaService;
import com.javastack.spring.retake_final.services.UserService;

@Controller
public class MainController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private YogaService yogaService;
	
	@GetMapping("/")
	public String index(Model model) {
	    model.addAttribute("newUser", new User());
	    model.addAttribute("newLogin", new LoginUser());
	    return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, 
			BindingResult result, Model model, HttpSession session) {

	    User user = userService.register(newUser, result);
	     
	    if(result.hasErrors()) {
	        model.addAttribute("newLogin", new LoginUser());
	        return "index.jsp";
	    }
	    session.setAttribute("userId", user.getId());
	 
	    return "redirect:/dashboard";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
			BindingResult result, Model model, HttpSession session) {
	     
		User user = userService.login(newLogin, result);
	 
	    if(result.hasErrors() || user==null) {
	        model.addAttribute("newUser", new User());
	        return "index.jsp";
	    }
	     
	    session.setAttribute("userId", user.getId());
	 
	    return "redirect:/dashboard";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
	 
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.findById(userId);
		
		model.addAttribute("user", user);
		model.addAttribute("unassignedProjects", yogaService.getUnassignedProjects(user));
		model.addAttribute("assignedProjects", yogaService.getAssignedProjects(user));
		 
		return "dashboard.jsp";
	}
	

	
	@GetMapping("/projects/{id}")
	public String viewProject(@PathVariable("id") Long id, HttpSession session, Model model) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		Yoga yoga = yogaService.findById(id);
		model.addAttribute("yoga", yoga);
		return "view.jsp";
	}
	
	@GetMapping("/projects/edit/{id}")
	public String openEditProject(@PathVariable("id") Long id, HttpSession session, Model model) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		Yoga yoga = yogaService.findById(id);
		model.addAttribute("yoga", yoga);
		return "edit.jsp";
	}
	
	@PostMapping("/projects/edit/{id}")
	public String editProject(
			@PathVariable("id") Long id, 
			@Valid @ModelAttribute("yoga") Yoga yoga, 
			BindingResult result, 
			HttpSession session) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		
		User user = userService.findById(userId);
		
		if(result.hasErrors()) {
			return "edit.jsp";
		}else {
			Yoga thisYoga = yogaService.findById(id);
			yoga.setUsers(thisYoga.getUsers());
			yoga.setLead(user);
			yogaService.updateProject(yoga);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping("/projects/delete/{id}")
	public String deleteProject(@PathVariable("id") Long id, HttpSession session) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		Yoga yoga = yogaService.findById(id);
		yogaService.deleteProject(yoga);
		
		return "redirect:/dashboard";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userId", null); 
	    return "redirect:/";
	}
	
	@GetMapping("/projects/new")
	public String newProject(@ModelAttribute("yoga") Yoga yoga, HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		
		model.addAttribute("userId", userId);
		return "new.jsp";
	}
	
	@PostMapping("/projects/new")
	public String addNewProject(@Valid @ModelAttribute("yoga") Yoga yoga, BindingResult result, HttpSession session) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		if(result.hasErrors()) {
			return "new.jsp";
		}else {
			yogaService.addProject(yoga);
			
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findById(userId);
			user.getYogas().add(yoga);
			userService.updateUser(user);
			return "redirect:/dashboard";
		}
	}
	
}
