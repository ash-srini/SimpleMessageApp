package com.me.controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.me.pojo.Contact;
import com.me.pojo.Message;

import com.me.pojo.User;

@SuppressWarnings("deprecation")
@Controller
public class ApplicationController {
	
	VelocityEngine ve = new VelocityEngine();
	
	//ve.init();
	
	@RequestMapping(value="/showMessages.htm", method=RequestMethod.GET)
	public String showMessages(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Message message = new Message();
		model.addAttribute("message", message);
		
		
		
		HttpSession s = request.getSession();
		String uNAME = (String) s.getAttribute("uName");
		System.out.println("**********"+uNAME);
		//Connect to db hibernate
		Configuration cfg = new Configuration();
		SessionFactory sf = cfg.configure().buildSessionFactory();
		Session session = sf.openSession();
	
		//display all messages from db
		String hql = " FROM Message WHERE UserName=:uName";
		Query query = session.createQuery(hql);
		
		query.setString("uName", uNAME);
		ArrayList<Message> result = (ArrayList<Message>) query.list();
		
		System.out.println(result);
		request.setAttribute("result", result);
		return "showMessages"	;
	}
	@RequestMapping(value="/search.htm", method=RequestMethod.GET)	
	public String search(ModelMap model, HttpServletRequest request, HttpServletResponse response){
		//search code
		User user = new User();
		model.addAttribute("user", user);
		return "search";
	}
	//Search By ID
	@RequestMapping(value="/searchResult.htm", method=RequestMethod.POST)
	public String searchLogic(@ModelAttribute("user") User user, HttpServletRequest request, @RequestParam("searchtype") String searchtype){
		if(searchtype.equals("byid")){
		//Get entered member id from jsp
				String ipUserID = user.getUserID();
				
				//Hibernate
				Configuration cfg = new Configuration();
				SessionFactory sf = cfg.configure().buildSessionFactory();
				Session hibsession = sf.openSession();
				
				//Hibernate Query
				String hql = "FROM User user WHERE user.userID=:ipUserID";
				Query query =  hibsession.createQuery(hql);
				query.setString("ipUserID", ipUserID);
				User rsUser = (User) query.uniqueResult();
			
				
				if(!rsUser.equals(null)){
					request.setAttribute("rsUser", rsUser);
					return "searchResult";
				}else{
					return "search";
				}
		
		}else if(searchtype.equals("byusername")){
			//Get entered member id from jsp
			String ipUserName = user.getUsername();
			
			//Hibernate
			Configuration cfg = new Configuration();
			SessionFactory sf = cfg.configure().buildSessionFactory();
			Session hibsession = sf.openSession();
			
			//Hibernate Query
			String hql = "FROM User user WHERE user.username=:ipUserName";
			Query query =  hibsession.createQuery(hql);
			query.setString("ipUserName", ipUserName);
			User rsUser = (User) query.uniqueResult();
			//System.out.println("Username result"+rsUser.getUsername());
			
			
			if(!rsUser.equals(null)){
				request.setAttribute("rsUser", rsUser);
				return "searchResult";
			}else{
				return "search";
			}
		}else if(searchtype.equals("quick")){
			
			String gender = user.getGender();
			String age = user.getAge();
			String country = user.getCountry();
			String city = user.getCity();
			

			//Hibernate
			Configuration cfg = new Configuration();
			SessionFactory sf = cfg.configure().buildSessionFactory();
			Session hibsession = sf.openSession();
			

			//Hibernate Query
			String hql = "FROM User user WHERE user.gender=:gender and user.age=:age and user.country:=country and user.city=:city ";
			Query query = hibsession.createQuery(hql);
			query.setString("gender", gender);
			query.setString("age", age);
			query.setString("country", country);
			query.setString("city", city);
			User rsUser = (User) query.uniqueResult();
			
			
			if(!rsUser.equals(null)){
				request.setAttribute("rsUser", rsUser);
				return "searchResult";
			}else{
				return "search";
			}
			
		}
		else{
			return "search";
		}
	}
	
	@RequestMapping(value="/reply.htm", method=RequestMethod.GET)
	public String messageReply(ModelMap model, @RequestParam String to, HttpServletRequest request, HttpServletResponse response){
		//url rewriting to send the to field to the reply.jsp page
		Message message = new Message()	;
		model.addAttribute("message", message);
		request.setAttribute("to", to);
		return "reply";
	}
	
	@RequestMapping(value="/replySuccess.htm", method=RequestMethod.POST)
	public String replySuccessPage(@ModelAttribute("message") Message message, HttpServletRequest request, HttpServletResponse response){
		//Add message to db 
		System.out.println(message.getMessage());
		System.out.println(message.getFromUser());
		DateFormat dateFormat = new SimpleDateFormat("mm/dd/yy");
		Date date = new Date();
		String d = dateFormat.format(date).toString();
		message.setMessageDate(d);
		//Hibernate
		Configuration cfg = new Configuration();
		SessionFactory sf = cfg.configure().buildSessionFactory();
		Session hibsession = sf.openSession();
		
		String hql = "SELECT max(messageID) FROM Message";
		Query query = hibsession.createQuery(hql);
		String m = (String) query.uniqueResult();
		Integer id = Integer.parseInt(m);
		id++;
		message.setMessageID(id.toString());
		System.out.println(id);
		if(!message.getMessage().equals(null)){
			
		Transaction tx = hibsession.beginTransaction();
		hibsession.save(message);
		tx.commit();
	
		return "replySuccess";
		}
		else{
			System.out.println("error");
			return "reply";
		}
	
		
	}
	
	@RequestMapping(value="/addContact.htm", method = RequestMethod.POST)
	public String addContact(Model model, @RequestParam("username") String userName, HttpServletRequest request, HttpServletResponse response){
		
		Contact contact = new Contact();
		model.addAttribute(contact);
		//Hibernate to add contacts
		
		System.out.println("username*****"+userName);
		Configuration cfg = new Configuration();
		SessionFactory sf = cfg.configure().buildSessionFactory();
		Session hibsession = sf.openSession();
		
		/*
		String hql = "From Contact contact WHERE contact.userName=:userName";
		Query query = hibsession.createQuery(hql);
		query.setString("uname", uname);
		String s = (String) query.uniqueResult();
		System.out.println("contact :"+s);
		*/
		return "addContact";
	}
	@RequestMapping(value="/viewContacts.htm", method = RequestMethod.GET)
	public String viewContacts(Model model, HttpServletRequest request, HttpServletResponse response){
		
		Contact contact = new Contact();
		model.addAttribute(contact);
		HttpSession s = request.getSession();
		String uNAME = (String) s.getAttribute("uName");
		System.out.println("**********"+uNAME);
		//Hibernate
		Configuration cfg = new Configuration();
		SessionFactory sf = cfg.configure().buildSessionFactory();
		Session hibsession = sf.openSession();
		
		String hql = "From Contact contact WHERE contact.userName=:uName";
		Query query = hibsession.createQuery(hql);
		query.setString("uName", uNAME);
		ArrayList<Contact> result = (ArrayList<Contact>) query.list();
		
		request.setAttribute("result", result);
		System.out.println(result); 
		return "viewContacts";
	}
	
	@RequestMapping(value="/changePassword.htm", method=RequestMethod.GET)
	public String changePassword(Model model){
		User user = new User();
		model.addAttribute("user", user);
		return "changePassword";
	}
	
	@RequestMapping(value="/pwordChangeConfirmation.htm", method=RequestMethod.POST)
	public String pwordChangeConfirmation(@ModelAttribute("user") User user, @RequestParam("newpword") String newpword, @RequestParam("confirmpword") String confirmpword, HttpServletRequest request, HttpServletResponse response) throws Exception{
		//Velocity engine init
		ve.init();
		VelocityContext vc = new VelocityContext();
		
		//check if old password is correct
		Boolean token = false;
		String username = (String) request.getSession().getAttribute("uName");
		System.out.println(username);
		user.getPassword();
		
		//Hibernate
		Configuration cfg = new Configuration();
		SessionFactory sf = cfg.configure().buildSessionFactory();
		Session hibsession = sf.openSession();
		
		String hql = "FROM User user WHERE user.username =:username";
		Query query = hibsession.createQuery(hql);
		query.setString("username", username);
		User rsUser = (User) query.uniqueResult();
		
		if(user.getPassword().equals(rsUser.getPassword())){
			if(newpword.equals(confirmpword)){
			
				String update = "UPDATE User set password=:newpword WHERE username =:username";
				Query q = hibsession.createQuery(update);
				q.setString("newpword", newpword);
				q.setString("username", username);
				int i = q.executeUpdate();
				System.out.println("Rows affetctd \t"+i);
				token = true;
				vc.put("noerror", "pass");
			}
			else{
				request.setAttribute("error", "notmatching");
				vc.put("error", "notmatching");
			}
		}
		else{
			request.setAttribute("error", "oldincorrect");
		}
		//Display if password has changed or not
		if(token == true){
		return "pwordChangeConfirmation";
		}
		else
		{
			return "changePassword";
		}
		
	}
}


