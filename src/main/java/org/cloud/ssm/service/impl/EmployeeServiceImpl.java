package org.cloud.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.cloud.ssm.entity.Employee;
import org.cloud.ssm.mapper.EmployeeMapper;
import org.cloud.ssm.service.EmployeeService;
import org.cloud.ssm.utils.BaseServiceImpl;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

@Service
public class EmployeeServiceImpl extends BaseServiceImpl<EmployeeMapper, Employee> implements EmployeeService {

	@Resource
    private EmployeeMapper employeeMapper;
	
	@Override
	public List<Employee> getAllByCondition(String username, String deptName, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
        return employeeMapper.selectAllByCondition(username, deptName);
	}

	@Override
	public Long getCountByCondition(String username, String deptName) {
		return employeeMapper.selectCountByCondition(username, deptName);
	}

}
