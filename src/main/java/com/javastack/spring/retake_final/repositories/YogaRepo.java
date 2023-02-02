package com.javastack.spring.retake_final.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.javastack.spring.retake_final.models.Yoga;
import com.javastack.spring.retake_final.models.User;

@Repository
public interface YogaRepo extends CrudRepository<Yoga, Long> {
	List<Yoga> findAll();
	Yoga findByIdIs(Long id);
	List<Yoga> findAllByUsers(User user);
	List<Yoga> findByUsersNotContains(User user);
}