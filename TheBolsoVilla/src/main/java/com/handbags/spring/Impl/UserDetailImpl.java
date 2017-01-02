package com.handbags.spring.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.handbags.spring.DAO.UserDetailDAO;
import com.handbags.spring.model.Cart;
import com.handbags.spring.model.User;
import com.handbags.spring.model.UserDetail;
import com.handbags.spring.model.UserRole;

@Repository
public class UserDetailImpl implements UserDetailDAO{
	
	
	@Autowired
	SessionFactory sessionFactory;

	public UserDetailImpl(SessionFactory sessionFactory) {
		
		this.sessionFactory=sessionFactory;
	}
	
	
	 	public void addUserDetail(UserDetail userDetail) {
		

		Session session =sessionFactory.getCurrentSession();
		User user=new User();
		user.setUserId(userDetail.getUserId());
		user.setUsername(userDetail.getUsername());
		user.setPassword(userDetail.getPassword());
		user.setEnabled(true);
		session.saveOrUpdate(user);
		
		Cart cart=new Cart();
		cart.setCartId(userDetail.getCartId());
		cart.setUserId(user.getUserId());
        session.saveOrUpdate(cart);
		
        UserRole userRole=new UserRole();
        userRole.setUserId(user.getUserId());
        userRole.setRoleId(1);
        session.saveOrUpdate(userRole);
        
		userDetail.getBillingAddress().setUserDetail(userDetail);
		session.saveOrUpdate(userDetail.getBillingAddress());
		
		userDetail.getShippingAddress().setUserDetail(userDetail);
		session.saveOrUpdate(userDetail.getShippingAddress());
		
		userDetail.setUserId(user.getUserId());
		userDetail.setCartId(cart.getCartId());
		session.saveOrUpdate(userDetail);
		session.flush();
	}
	

}
