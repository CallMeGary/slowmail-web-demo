package com.slowmail.demo.jobs;

import java.util.Date;
import java.util.List;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.SchedulerException;
import org.springframework.context.ApplicationContext;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.slowmail.demo.models.Mail;
import com.slowmail.demo.repositories.MailRepository;

public class EmailSendingJob extends QuartzJobBean {

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		try {
			ApplicationContext appContext = (ApplicationContext) context.getScheduler().getContext().get("applicationContext");
			MailRepository repository = (MailRepository) appContext.getBean("mailRepository");
			JavaMailSenderImpl mailSender = (JavaMailSenderImpl)appContext.getBean("mailSender");
			
			List<Mail> mailsToSend = repository.findScheduledMailsForToday();
			
			for (Mail mail : mailsToSend) {
				SimpleMailMessage smm = new SimpleMailMessage();

				smm.setFrom(mailSender.getUsername());
				smm.setTo(mail.getSendTo());
				smm.setSubject("来自 " + mail.getSendFrom() + " 的慢邮邮件");
				smm.setText(mail.getMessage());
				mailSender.send(smm);
				
				mail.setSent(true);
				mail.setSentOn(new Date());
				repository.save(mail);
			}
			
		} catch (SchedulerException e) {
			throw new JobExecutionException(e);
		}
	}

	public static void main(String args[]) {
		try {
			JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
			
			mailSender.setHost("mail.babyugo.com");
			mailSender.setUsername("service@babyugo.com");
			mailSender.setPassword("Auwxte00");
			
			SimpleMailMessage smm = new SimpleMailMessage();
			smm.setSentDate(new Date(12345678L));
			smm.setFrom(mailSender.getUsername());
			smm.setTo("121864176@qq.com");
			smm.setSubject("来自 冠林 的慢邮邮件");
			smm.setText("这是一封测试邮件而已哦，亲！");

			mailSender.send(smm);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
