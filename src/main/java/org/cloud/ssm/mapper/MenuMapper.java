package org.cloud.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.cloud.ssm.entity.Menu;
import org.cloud.ssm.utils.BaseMapper;

public interface MenuMapper extends BaseMapper<Menu> {
    List<Menu> getMenuList(@Param("level") int level);
}
