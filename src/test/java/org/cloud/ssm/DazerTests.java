package org.cloud.ssm;

import org.cloud.ssm.model.User;
import org.cloud.ssm.model.UserVO;
import org.dozer.Mapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/applicationContext.xml"})
public class DazerTests {
	
	@Autowired
    Mapper mapper;
	
	@Test
	public void test() {
		User u = new User();
		u.setId(2);
		u.setName("test");
		u.setPassword("password");
		UserVO v = mapper.map(u, UserVO.class);
		System.out.println(v);
	}

}
