package com.damoye.secondproject.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.damoye.secondproject.model.User;


public class MemberRowMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		User user = new User();
		
		user.setNo(rs.getInt("no"));
		user.setId(rs.getString("id"));
		user.setPassword(rs.getString("password"));
		user.setName(rs.getString("name"));
		user.setZipcode(rs.getInt("zipcode"));
		user.setAddress(rs.getString("address"));
		user.setDetailaddress(rs.getString("detailaddress"));
		user.setPricynum(rs.getString("pricynum"));
		user.setEmail(rs.getString("email"));
		user.setPhonenum(rs.getString("phoneNum"));
		user.setGender(rs.getString("gender")); 
		user.setRegdate(rs.getString("regdate"));
		
		return user;
	}
}
