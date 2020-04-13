package org.cloud.ssm.service;

import org.cloud.ssm.base.BaseService;
import org.cloud.ssm.entity.SysLog;

public interface ISysLogService extends BaseService<SysLog> {

    void clearLogs();

}
