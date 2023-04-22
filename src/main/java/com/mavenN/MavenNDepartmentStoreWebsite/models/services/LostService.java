package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.LostAndFound;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.LostRepository;

@Service
public class LostService {

	@Autowired
	private LostRepository lostRepository;
	
	public void addLost(LostAndFound lost) {
		lostRepository.save(lost);
	}
	
	public LostAndFound findLostById(Integer id) {
		Optional<LostAndFound> option = lostRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	public Page<LostAndFound> findLostByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "founddate");
		Page<LostAndFound> page = lostRepository.findAll(pgb);
		return page;
	}
	
	
	@Transactional
	public LostAndFound updateLostById(Integer id,LostAndFound newLost) {
		Optional<LostAndFound> option = lostRepository.findById(id);
		
		if(option.isPresent()) {
			LostAndFound lost = option.get();
			lost.setFounddate(newLost.getFounddate());
			lost.setItem(newLost.getItem());
			lost.setPlace(newLost.getPlace());
			lost.setState(newLost.getState());
			return lost;
		}
		return null;
	}
	
	public void deleteLostById(Integer id) {
		lostRepository.deleteById(id);
	}
	
	public List<LostAndFound> findAllLost(){
		List<LostAndFound> findAllLost=lostRepository.findAll();
		return findAllLost;
	}
	
	
	
}
