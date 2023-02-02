package com.javastack.spring.retake_final.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.javastack.spring.retake_final.models.Yoga;
import com.javastack.spring.retake_final.models.User;
import com.javastack.spring.retake_final.repositories.YogaRepo;

@Service
public class YogaService {
	private final YogaRepo yogaRepo;
	
	public YogaService(YogaRepo yogaRepo) {
		this.yogaRepo = yogaRepo;
	}
	
	public List<Yoga> allProjects(){
		return yogaRepo.findAll();
	}
	
	public Yoga updateProject(Yoga yoga) {
		return yogaRepo.save(yoga);
	}
	
	public List<Yoga> getAssignedProjects(User user){
		return yogaRepo.findAllByUsers(user);
	}
	
	public List<Yoga> getUnassignedProjects(User user){
		return yogaRepo.findByUsersNotContains(user);
	}
	
	public Yoga addProject(Yoga yoga) {
		return yogaRepo.save(yoga);
	}
	
	public void deleteProject(Yoga yoga) {
		yogaRepo.delete(yoga);
	}
	
	public Yoga findById(Long id) {
		Optional<Yoga> optionalYoga = yogaRepo.findById(id);
		if(optionalYoga.isPresent()) {
			return optionalYoga.get();
		}else {
			return null;
		}
	}
	
}