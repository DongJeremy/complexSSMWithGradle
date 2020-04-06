package org.cloud.ssm.mapper;

import org.cloud.ssm.entity.Permission;
import org.cloud.ssm.utils.BaseMapper;

public interface PermissionMapper extends BaseMapper<Permission> {
    void deletePermissionsById(Long permissionid);
}
