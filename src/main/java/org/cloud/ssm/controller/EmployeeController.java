package org.cloud.ssm.controller;

import java.util.List;

import org.cloud.ssm.entity.Department;
import org.cloud.ssm.entity.Employee;
import org.cloud.ssm.entity.EmployeeVo;
import org.cloud.ssm.service.EmployeeService;
import org.cloud.ssm.utils.PageResultBean;
import org.cloud.ssm.utils.ResultBean;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService service;

	@GetMapping("/list")
	public @ResponseBody PageResultBean<Employee> listEmployee(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "department", required = false) String department,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "limit", defaultValue = "10") int limit) {
		List<Employee> emps = null;
		long count = 0;
		if ((department == null) && (username == null)) {
			emps = service.getAll(page, limit);
			count = service.getCount(new Employee());
		} else {
			emps = service.getAllByCondition(username, department, page, limit);
			count = service.getCountByCondition(username, department);
		}
		return new PageResultBean<Employee>(count, emps);
	}

	@PostMapping
	public @ResponseBody ResultBean addEmployee(@RequestBody EmployeeVo employeeVo) {
		Employee employee = new Employee();
		BeanUtils.copyProperties(employeeVo, employee);
		Department department = new Department(employeeVo.getDepartment());
		employee.setDepartment(department);
		service.save(employee);
		return ResultBean.success();
	}

	@DeleteMapping("/{id}")
	public @ResponseBody ResultBean deleteEmployee(@PathVariable Long id) {
		service.deleteById(id);
		return ResultBean.success();
	}

	@GetMapping("/get")
	public @ResponseBody Employee getEmployee(Employee employee) {
		return service.getById(employee.getId()).orElse(new Employee());
	}

	@PutMapping
	public @ResponseBody ResultBean updateEmployee(@RequestBody EmployeeVo employeeVo) {
		Employee employee = new Employee();
		BeanUtils.copyProperties(employeeVo, employee);
		Department department = new Department(employeeVo.getDepartment());
		employee.setDepartment(department);
		service.save(employee);
		return ResultBean.success();
	}

	@PostMapping("delete")
	@ResponseBody
	public ResultBean removeEmp(@RequestBody List<String> ids) {
		for (String id : ids) {
			service.deleteById(Long.parseLong(id));
		}
		return ResultBean.success();
	}

}
