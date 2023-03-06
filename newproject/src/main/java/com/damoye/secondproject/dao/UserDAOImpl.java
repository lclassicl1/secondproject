package com.damoye.secondproject.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.damoye.secondproject.model.User;



@Repository
public class UserDAOImpl implements UserDAO {

	private JdbcTemplate template;
	
	@Autowired 
    public void setDataSource(DataSource dataSource) {
        this.template = new JdbcTemplate(dataSource); 
    }
	
	@Override
	public User getMemberById(String id) {
		
		String sql = "select no, id, password, name, zipcode, address, detailaddress, pricynum, email, phonenum, gender, grade, regdate FROM user where id=?";
		
		// queryForObject(String sql, RowMapper<T> rowMapper, Object...args)
		return template.queryForObject(
										sql, 
										new MemberRowMapper(), 
										id
									  ); 
	}
	
	@Override
	public void signUpUser(User user) {

		String sql = "insert into user(no, id, password, name, zipcode, address, detailaddress, pricynum, email, phonenum, gender, grade, regdate) "+
					  "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, now())";

		template.update(
						 sql,
						 user.getNo(),
						 user.getId(),
						 user.getPassword(),
						 user.getName(),
						 user.getZipcode(),
						 user.getAddress(),
						 user.getDetailaddress(),
						 user.getPricynum(),
						 user.getEmail(),
						 user.getPhonenum(),
						 user.getGender()
				        );
	}

	@Override
	public User findId(String name, String email, String phonenum) {
		String sql="select id from user where name=? and email=? and phonenum=?";
		
		RowMapper<User> mapper = new BeanPropertyRowMapper<User>(User.class);
		User user = this.template.queryForObject(sql, mapper, name, email, phonenum);
		return user;
	}
	
	@Override
	public void updatePw(User user) {
		String sql = "update user set password=? where id=? and name=? and email=?";
		try {
			 template.update(sql, user.getPassword(), user.getId(), user.getName(), user.getEmail());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void modifyUserInfo(User user){
		String sql="update user set password=?, email=?, phonenum=?, zipcode=?, address=?, detailaddress=? where id=?";
		try {
			template.update(sql, user.getPassword(), user.getEmail(), user.getPhonenum(), user.getZipcode(), user.getAddress(), user.getDetailaddress(), user.getId());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<User> getAllMemberList() {
		String sql = "SELECT id, passwd, name, gender, regdate " + 
					 "FROM simplemember";
	
		List<User> memberList = template.query(
												  sql,
												  new MemberRowMapper()
												);
		
		return memberList;
										
	}

}
