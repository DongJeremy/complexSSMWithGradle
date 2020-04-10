package org.cloud.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import org.cloud.ssm.entity.Department;
import org.cloud.ssm.entity.Employee;
import org.cloud.ssm.service.IDepartmentService;
import org.cloud.ssm.service.IEmployeeService;
import org.cloud.ssm.sys.annotation.OperationLog;
import org.cloud.ssm.sys.info.Server;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private IEmployeeService employeeService;

    @Autowired
    private IDepartmentService departmentService;

    @OperationLog("访问我的桌面")
    @GetMapping("/welcome")
    public String welcome(ModelMap model) {
        model.addAttribute("userCount", 2);
        model.addAttribute("roleCount", 2);
        model.addAttribute("menuCount", 12);
        model.addAttribute("loginLogCount", 51);
        model.addAttribute("sysLogCount", 478);
        model.addAttribute("userOnlineCount", 2);
        return "admin/welcome";
    }

    @OperationLog("查看近七日登录统计图")
    @GetMapping("/weekLoginCount")
    @ResponseBody
    public List<Integer> recentlyWeekLoginCount() {
        List<Integer> recentlyWeekLoginCount = new ArrayList<Integer>();
        recentlyWeekLoginCount.add(10);
        recentlyWeekLoginCount.add(4);
        recentlyWeekLoginCount.add(6);
        recentlyWeekLoginCount.add(9);
        recentlyWeekLoginCount.add(20);
        recentlyWeekLoginCount.add(1);
        recentlyWeekLoginCount.add(13);
        return recentlyWeekLoginCount;
    }

    @OperationLog("查看系统信息")
    @GetMapping("/systemInfo")
    public String serverInfo(ModelMap model) throws Exception {
        Server server = new Server();
        server.copyTo();
        model.addAttribute("server", server);
        return "admin/system/sysinfo-list";
    }

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

    @GetMapping("/deptView")
    public String deptListView(ModelMap model) throws Exception {
        return "admin/dept/dept-list";
    }

    @GetMapping("/deptChangeView/{id}")
    public String deptUpdatePage(ModelMap model, @PathVariable("id") Long id) throws Exception {
        model.addAttribute("department", departmentService.getById(id).orElse(new Department()));
        return "admin/dept/dept-add";
    }

    @GetMapping("/deptChangeView")
    public String deptAddPage(ModelMap model) throws Exception {
        return "admin/dept/dept-add";
    }

    @GetMapping("/userOnline")
    public String userOnline(ModelMap model) throws Exception {
        return "admin/user/user-online-list";
    }

    @GetMapping("/syslog")
    public String syslog(ModelMap model) throws Exception {
        return "admin/system/syslog-list";
    }

    @GetMapping("/userView")
    public String userView(ModelMap model) throws Exception {
        return "admin/user/user-list";
    }
    
    @GetMapping("/temp")
    public String temp(ModelMap model) throws Exception {
        return "admin/temp";
    }

    @GetMapping("/user/{id}/reset")
    public String resetPassword(@PathVariable("id") Integer id, ModelMap model) {
        model.addAttribute("id", id);
        return "admin/user/user-reset";
    }
}
