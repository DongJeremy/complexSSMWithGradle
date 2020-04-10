package org.cloud.ssm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.cloud.ssm.entity.User;
import org.cloud.ssm.service.IUserService;
import org.cloud.ssm.sys.annotation.OperationLog;
import org.cloud.ssm.utils.PageResultBean;
import org.cloud.ssm.utils.ResultBean;
import org.cloud.ssm.vo.UserOnline;
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
@RequestMapping("/api/user")
public class UserController {

    @Resource
    private IUserService userService;

    @OperationLog("获取在线用户列表")
    @GetMapping("/onlinelist")
    @ResponseBody
    public PageResultBean<UserOnline> listUsers(@RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "limit", defaultValue = "10") int limit) {
        List<UserOnline> userOnlines = userService.getOnlineUsers(page, limit);
        long count = userService.getOnlineUserCount();
        return new PageResultBean<UserOnline>(count, userOnlines);
    }

    @PostMapping("/kickout")
    @ResponseBody
    public ResultBean forceLogout(String sessionId) {
        userService.forceLogout(sessionId);
        return ResultBean.success();
    }
    
    @OperationLog("获取用户列表")
    @GetMapping("/list")
    @ResponseBody
    public PageResultBean<User> listUser(@RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "limit", defaultValue = "10") int limit) {
        List<User> emps = userService.getAll(page, limit);
        long count = userService.getCount(new User());
        return new PageResultBean<User>(count, emps);
    }

    @OperationLog("添加用户")
    @PostMapping
    @ResponseBody
    public ResultBean addUser(@RequestBody User user) {
        return ResultBean.success(userService.save(user));
    }

    @OperationLog("编辑用户")
    @PutMapping
    @ResponseBody
    public ResultBean updateUser(@RequestBody User user) {
        userService.save(user);
        return ResultBean.success();
    }

    @OperationLog("刪除用户")
    @DeleteMapping("/{id}")
    @ResponseBody
    public ResultBean deleteUser(@PathVariable Long id) {
        userService.deleteById(id);
        return ResultBean.success();
    }

    @OperationLog("删除账号")
    @PostMapping("/{id}/disable")
    @ResponseBody
    public ResultBean disable(@PathVariable("id") Long id) {
        return ResultBean.success(userService.disableUserByID(id));
    }

    @OperationLog("激活账号")
    @PostMapping("/{id}/enable")
    @ResponseBody
    public ResultBean enable(@PathVariable("id") Long id) {
        return ResultBean.success(userService.enableUserByID(id));
    }

    @OperationLog("重置密码")
    @PostMapping("/{id}/reset")
    @ResponseBody
    public ResultBean resetPassword(@PathVariable("id") Long id, String password0, String password1) {
        boolean resetPass = userService.updatePasswordByUserId(id, password0, password1);
        if (!resetPass) {
            return ResultBean.error("原密码错误，重置密码失败");
        }
        return ResultBean.success();
    }
}
