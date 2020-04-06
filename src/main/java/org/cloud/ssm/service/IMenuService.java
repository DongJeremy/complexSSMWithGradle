package org.cloud.ssm.service;

import java.util.List;

import org.cloud.ssm.entity.Menu;
import org.cloud.ssm.utils.BaseService;

public interface IMenuService extends BaseService<Menu> {
    public List<Menu> getTreeData(int level);
}
