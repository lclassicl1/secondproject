package com.damoye.secondproject.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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

	public void signUpUser(User user) {

		String sql = "insert into user(no, id, password, name, zipcode, address, detailaddress, pricynum, email, phonenum, gender, grade, regdate) "+
					  "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";

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
						 user.getGender(),
						 1
				        );
	}

	
	@Override
	public List<User> getAllMemberList() {
		
		String sql = "SELECT id, passwd, name, gender, regdate " + 
					 "FROM simplemember";
	
		// queryForObject(String sql, RowMapper<T> rowMapper, Object...args)
		List<User> memberList = template.query(
												  sql,
												  new MemberRowMapper()
												);
		
		return memberList;
										
	}

}
