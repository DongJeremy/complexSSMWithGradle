package org.cloud.ssm.mapper;

import org.cloud.ssm.entity.SysLog;
import org.cloud.ssm.utils.BaseMapper;

public interface SysLogMapper extends BaseMapper<SysLog> {

    void clearLogs();

}
