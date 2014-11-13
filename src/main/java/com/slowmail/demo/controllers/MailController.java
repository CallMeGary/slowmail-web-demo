package com.slowmail.demo.controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.slowmail.demo.models.Mail;
import com.slowmail.demo.repositories.MailRepository;

@Controller
public class MailController {

	@Autowired
	private MailRepository mailRepository;
	
    @RequestMapping(value = "/all")
    @ResponseBody
    public List<Mail> viewAll() {
        return mailRepository.findAll();
    }
    
    @RequestMapping(value = "/allPending")
    @ResponseBody
    public List<Mail> viewPending() {
        return mailRepository.findAllPending();
    }
	
    @RequestMapping(value = "/allSent")
    @ResponseBody
    public List<Mail> allSent() {
        return mailRepository.findAllSent();
    }
    
    @RequestMapping(value = "/create")
    public ModelAndView forCreate() {
        ModelAndView mv = new ModelAndView("createMail");
        mv.addObject("mail", new Mail());
        return mv;
    }
    
    @RequestMapping(value = "/createAction", method = RequestMethod.POST)
    @ResponseBody
    public Mail create(@RequestBody Mail mail) {
    	mail.setCreatedOn(new Date());
    	mail.setSent(false);
    	
    	mailRepository.saveAndFlush(mail);
    	
    	return mail;
    }
}
