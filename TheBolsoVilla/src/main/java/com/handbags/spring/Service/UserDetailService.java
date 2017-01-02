package com.handbags.spring.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.handbags.spring.Impl.UserDetailImpl;
import com.handbags.spring.model.UserDetail;

@Service
@Transactional
public class UserDetailService {

	@Autowired
	UserDetailImpl userDetailImpl;
	

	public void addUserDetail(UserDetail userDetail)
	{
		userDetailImpl.addUserDetail(userDetail);
		
	}
	
	
}
