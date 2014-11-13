package com.slowmail.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.slowmail.demo.models.Mail;

@Service("mailRepository")
public interface MailRepository extends JpaRepository<Mail, Long> {
	
	@Query("select m from Mail m where m.sent = false")
	public List<Mail> findAllPending();

	@Query("select m from Mail m where m.scheduledOn < now() and m.sent = false")
	public List<Mail> findScheduledMailsForToday();
	
	@Query("select m from Mail m where m.sent = true")
	public List<Mail> findAllSent();
}
