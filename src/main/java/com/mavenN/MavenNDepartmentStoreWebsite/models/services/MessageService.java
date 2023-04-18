package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.Message;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.MessageRepository;

@Service
public class MessageService {
	
	@Autowired
	private MessageRepository messageRepository;
	
	public void addMessage(Message message) {
		messageRepository.save(message);
	}
	
	public Message findMessageById(Integer id) {
		Optional<Message> optionalMessage = messageRepository.findById(id);
		
		if(optionalMessage.isEmpty()) {
			return null;
		}
		
		return optionalMessage.get();
	}
	
	public void deleteMessageById(Integer id) {
		messageRepository.deleteById(id);
	}
	
	public Page<Message> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "added");
		Page<Message> page = messageRepository.findAll(pgb);
		return page;
	}
	
	@Transactional
	public Message updateById(Integer id, String newMsg) {
		Optional<Message> option = messageRepository.findById(id);
		
		if(option.isPresent()) {
			Message msg = option.get();
			msg.setText(newMsg);
			return msg;
		}
		return null;
	}
}
