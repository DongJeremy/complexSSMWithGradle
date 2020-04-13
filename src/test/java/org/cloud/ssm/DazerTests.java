package org.cloud.ssm;

import org.cloud.ssm.entity.Employee;
import org.cloud.ssm.entity.vo.EmployeeVO;
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
		EmployeeVO employeeVO = new EmployeeVO(10L, "david", "jilin", 12, 2L, 1222, "138123432");
		Employee e = mapper.map(employeeVO, Employee.class);
		System.out.println(e.getDepartment().getId());
	}

}
