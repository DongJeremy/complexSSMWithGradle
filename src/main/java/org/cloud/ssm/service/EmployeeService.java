package org.cloud.ssm.service;

import java.util.List;

import org.cloud.ssm.entity.Employee;
import org.cloud.ssm.utils.BaseService;

public interface EmployeeService extends BaseService<Employee> {
	List<Employee> getAllByCondition(String username, String deptName, int pageNum, int pageSize);

    Long getCountByCondition(String username, String deptName);
}
