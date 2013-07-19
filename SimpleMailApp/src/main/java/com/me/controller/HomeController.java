package com.me.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.me.pojo.User;

/**
 * Handles requests for the application home page.
 */

@SuppressWarnings("deprecation")
@Controller
public class HomeController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String showForm(ModelMap model, HttpServletRequest request, HttpServletResponse response){
		
		User user = new User();
		model.addAttribute("user", user);
		Cookie[] c= request.getCookies();
		System.out.println(c);
		Boolean token = false;
		if(!c.equals(null)){
			for(int i=0; i<c.length; i++){
				if(c[i].getName().equals("username")){
					System.out.println(c[i].getValue());
					//login directly
					token = true;
				}
				else{
					token = false;
				}
			}
		}
		if(token == true){
			System.out.println("success");
			return "success";
			
		}else{
			System.out.println("login");
			return "login";
		}
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/home.htm", method = RequestMethod.POST)
	public String processForm(@ModelAttribute("user") User user, @RequestParam("remember") String remember, HttpServletRequest request, HttpServletResponse response){
		
		//username password validation
		//user entered values
		String useripun = user.getUsername();
		String userippword = user.getPassword();
		Boolean b = false;
		System.out.println("username : " +useripun);
		System.out.println("password : " + user.getPassword());
		//get the username from database
		System.out.println(remember);
		Configuration cfg = new Configuration();
		SessionFactory sf = cfg.configure().buildSessionFactory();
		Session session = sf.openSession();
		
		String hql = "SELECT user.username FROM User user";
		Query query = session.createQuery(hql);
		
		List<String> result = query.list();
		System.out.println(result);
		
	for(String s: result){
		if(s.equals(useripun)){
			
			String hql1 = " SELECT user.password FROM User user WHERE user.username=:useripun";
			Query query1 = session.createQuery(hql1);
			query1.setString("useripun", useripun);
			String rs = (String) query1.uniqueResult();
			
			//check the userpassword in the db and the user entered value
			if(rs.equals(userippword)){
				//on success
					System.out.println("Successful Login");
					b = true;
					//check for remember me
					if(remember.equals("on")){
						
						Cookie rememberUN = new Cookie("username", useripun);
						Cookie rememberPW = new Cookie("password", userippword);
						response.addCookie(rememberUN);
						response.addCookie(rememberPW);
						HttpSession servletSession = request.getSession();
						servletSession.setAttribute("uName", useripun);
					}
			}
			//on faliure
			else{
				b = false;
			}
		}
		
		
	}
		
		if(b == true){
			return "success";
		}
		else{
			return "login";
		}
		
	}
	
	
	
}
