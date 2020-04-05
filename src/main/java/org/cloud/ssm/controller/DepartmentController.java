package org.cloud.ssm.controller;

import java.util.List;

import org.cloud.ssm.entity.Department;
import org.cloud.ssm.service.DepartmentService;
import org.cloud.ssm.utils.PageResultBean;
import org.cloud.ssm.utils.ResultBean;
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
@RequestMapping("/api/department")
public class DepartmentController {

	@Autowired
	private DepartmentService service;

	@GetMapping("/list")
	public @ResponseBody 
	PageResultBean<Department> listDepartment(
			@RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "limit", defaultValue = "10") int limit) {
		List<Department> depts = service.getAll(page, limit);
		long count = service.getCount(new Department());
		return new PageResultBean<Department>(count, depts);
	}

	@PostMapping
	public @ResponseBody ResultBean addDepartment(@RequestBody Department department) {
		service.save(department);
		return ResultBean.success();
	}

	@DeleteMapping("/{id}")
	public @ResponseBody ResultBean deleteDepartment(@PathVariable Long id) {
		service.deleteById(id);
		return ResultBean.success();
	}
	
	@GetMapping("/get")
	public @ResponseBody Department getDepartment(Department department) {
		return service.getById(department.getId()).orElse(new Department());
	}
	
	@PutMapping
	public @ResponseBody ResultBean updateDepartment(@RequestBody Department department) {
		service.save(department);
		return ResultBean.success();
	}
	
	@PostMapping("delete")
    @ResponseBody
    public ResultBean removeDepartment(@RequestBody List<String> ids) {
        for (String id : ids) {
        	service.deleteById(Long.parseLong(id));
        }
        return ResultBean.success();
    }
	
}
