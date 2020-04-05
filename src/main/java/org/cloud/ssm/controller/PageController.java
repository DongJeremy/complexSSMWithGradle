package org.cloud.ssm.controller;

import org.cloud.ssm.entity.Department;
import org.cloud.ssm.entity.Employee;
import org.cloud.ssm.service.DepartmentService;
import org.cloud.ssm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class PageController {

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
    private DepartmentService departmentService;

	@GetMapping("/employeeList")
	public String employeeList(ModelMap model) {
		model.addAttribute("departmentList", departmentService.getAll());
		return "employeeList";
	}

	@GetMapping("/employeeChange")
	public String employeeAddChange(ModelMap model) {
		model.addAttribute("departmentList", departmentService.getAll());
		return "employeeChange";
	}

	@GetMapping("/employeeChange/{id}")
	public String employeeUpdateChange(ModelMap model, @PathVariable("id") Long id) {
		model.addAttribute("employee", employeeService.getById(id).orElse(new Employee()));
		model.addAttribute("departmentList", departmentService.getAll());
		return "employeeChange";
	}

	@GetMapping("/departmentList")
	public String deptListView(ModelMap model) throws Exception {
		return "departmentList";
	}
	
	@GetMapping("/departmentChange/{id}")
    public String deptUpdatePage(ModelMap model, @PathVariable("id") Long id) throws Exception {
        model.addAttribute("department", departmentService.getById(id).orElse(new Department()));
        return "departmentChange";
    }

    @GetMapping("/departmentChange")
    public String deptAddPage(ModelMap model) throws Exception {
        return "departmentChange";
    }
    
    @GetMapping("/lotteryDraw")
    public String lotteryDraw(ModelMap model) throws Exception {
        return "lotteryDraw";
    }
}
