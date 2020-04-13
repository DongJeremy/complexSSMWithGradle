package org.cloud.ssm.mapper;

import org.cloud.ssm.base.BaseMapper;
import org.cloud.ssm.entity.Permission;

public interface PermissionMapper extends BaseMapper<Permission> {
    void deletePermissionsById(Long permissionid);
}
