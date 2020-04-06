package org.cloud.ssm.service;

import java.util.List;

import org.cloud.ssm.entity.Role;
import org.cloud.ssm.utils.BaseService;

public interface IRoleService extends BaseService<Role> {

    /**
     * 添加角色-权限之间关系
     * 
     * @param roleId
     * @param permissionIds
     */
    public void correlationPermissions(Long roleId, Long... permissionIds);

    /**
     * 移除角色-权限之间关系
     * 
     * @param roleId
     * @param permissionIds
     */
    public void uncorrelationPermissions(Long roleId, Long... permissionIds);

    public List<Role> getPagedRole(int pageNum, int pageSize);

    public void deleteRoles(Long roleid);// 删除该角色的所有权限关联

}
