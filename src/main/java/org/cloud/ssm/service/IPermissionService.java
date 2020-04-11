package org.cloud.ssm.service;

import java.util.List;

import org.cloud.ssm.entity.Permission;
import org.cloud.ssm.utils.BaseService;

public interface IPermissionService extends BaseService<Permission> {
    List<Permission> getPagePermissions(int pagenum, int pagesize);
}
