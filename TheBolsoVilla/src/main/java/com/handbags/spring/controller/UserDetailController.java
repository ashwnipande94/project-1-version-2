package com.handbags.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.handbags.spring.Service.UserDetailService;
import com.handbags.spring.model.BillingAddress;
import com.handbags.spring.model.ShippingAddress;
import com.handbags.spring.model.UserDetail;

@Controller
public class UserDetailController {
	
	@Autowired
	UserDetailService userDetailService;
	
	@RequestMapping(value="/loginpage")
	public String LoginPage(Model model){
		
		return "LoginPage";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/loginpage?logout";
	}

	
	@RequestMapping("/registration")
	public String getRegistrationPage(Model model) {
		UserDetail userDetail= new UserDetail();
		BillingAddress billingAddress=new BillingAddress();
		ShippingAddress shippingAddress=new ShippingAddress();
		userDetail.setShippingAddress(shippingAddress);
		userDetail.setBillingAddress(billingAddress);
		model.addAttribute("userDetail", userDetail);
		return "Registration";
	}
	
	@RequestMapping("/addUserDetail")
	public String addUserDetail (@ModelAttribute("userDetail")UserDetail userDetail) {
		userDetailService.addUserDetail(userDetail);
		return "redirect:/registration";
	}
	
	

}
