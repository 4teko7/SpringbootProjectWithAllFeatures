package com.teko.commercial.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.teko.commercial.Entities.User;
import com.teko.commercial.services.UserDetailsServiceImp;
import com.teko.commercial.validator.UserValidator;


//import com.teko7.entities.TodoEntity;
//import com.teko7.entities.User;
//import com.teko7.userService.DatabaseuserService;
//import com.teko7.validator.validator;

@RequestMapping("/users")
@Controller
public class UserController {

	@Autowired
	private UserDetailsServiceImp userService;

	@Autowired
	private UserValidator validator;
	
	@GetMapping("/users")
	public String getAllUsers(Model theModel) {
		List<User> users = userService.findAll();
		theModel.addAttribute("users",users);
		return "users";
	}
	
	@GetMapping("/registration")
	public String registerUser(Model theModel) {
		theModel.addAttribute("user",new User());
		return "registration";
	}
	
	@PostMapping("registration")
	public String registerUser(@ModelAttribute("user") User user, BindingResult bindingResult) {
		validator.validate(user, bindingResult);
		System.out.println("bindingResult : " + bindingResult);
		if (bindingResult.hasErrors()) {
            return "registration";
        }
		userService.save(user);
		
		return "redirect:/users/users";
	}
	
	@GetMapping("/login")
	public String loginUser(Model theModel, String error, String logout) {
		if (error != null)
            theModel.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            theModel.addAttribute("message", "You have been logged out successfully.");
//		theModel.addAttribute("user",new User());
		return "login";
	}
	
	@PostMapping("/login")
	public String loginUser(@ModelAttribute("user") User user) {
//		userService.save(user);
//		System.out.println("USER : " + user);
		return "redirect:/users/users";
	}
	
	@RequestMapping(value="adduser", method = RequestMethod.GET)
	public String showFormForAddUser(Model theModel) {
		
		User user = new User();
		theModel.addAttribute("user",user);
		return "addUserForm";
	}
	
	@RequestMapping(value="adduser", method = RequestMethod.POST)
	public String addTodo(@ModelAttribute("user") User user) {
		userService.save(user);
		return "redirect:/users/users";
	}
	
	@RequestMapping(value="deleteuser", method = RequestMethod.GET)
	public String deleteUser(@RequestParam("id") int theId) {
		userService.deleteUser(theId);
		return "redirect:/users/users";
	}
	
	@RequestMapping(value="updateuser", method = RequestMethod.GET)
	public String updateUser(@RequestParam("id") int theId,Model theModel) {
		User user = userService.findById(theId);
		theModel.addAttribute("user",user);
		return "addUserForm";
	}
	
	
	
	
}