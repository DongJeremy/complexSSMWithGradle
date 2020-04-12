package org.cloud.ssm.controller.page;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.cloud.ssm.entity.Employee;
import org.cloud.ssm.service.IDepartmentService;
import org.cloud.ssm.service.IEmployeeService;
import org.cloud.ssm.sys.annotation.OperationLog;
import org.cloud.ssm.utils.ExcelUtils;
import org.cloud.ssm.utils.ResultBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/admin")
public class EmployeePageController {

    @Autowired
    private IEmployeeService employeeService;

    @Autowired
    private IDepartmentService departmentService;

    @OperationLog("获取用户列表")
    @GetMapping("/empView")
    public String empListView(ModelMap model) throws Exception {
        model.addAttribute("departmentList", departmentService.getAll());
        return "admin/emp/emp-list";
    }

    @GetMapping("/empChangeView/{id}")
    public String empUpdatePage(ModelMap model, @PathVariable("id") Long id) throws Exception {
        model.addAttribute("employee", employeeService.getById(id).orElse(new Employee()));
        model.addAttribute("departmentList", departmentService.getAll());
        return "admin/emp/emp-add";
    }

    @GetMapping("/empChangeView")
    public String empAddPage(ModelMap model) throws Exception {
        model.addAttribute("departmentList", departmentService.getAll());
        return "admin/emp/emp-add";
    }

    @GetMapping("/empView/excel/download")
    public void empViewDownload(HttpServletResponse response) throws IOException {
        String excelFileName = "employee";
        List<Employee> list = employeeService.getAll();
        ExcelUtils.exportToFile(list, excelFileName, response);
    }

    @PostMapping("/empImport")
    public @ResponseBody ResultBean importEmployee(HttpServletRequest request) throws IOException, Exception {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = multipartRequest.getFile("file");
        List<Employee> listObjects = ExcelUtils.importFromFile(file, Employee.class);
        long ret = employeeService.batchSaveEmployee(listObjects);
        if (ret == 1) {
            return ResultBean.success();
        }
        return ResultBean.error("import error");
    }
}
