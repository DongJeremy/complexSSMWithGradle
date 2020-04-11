package org.cloud.ssm.service;

import org.cloud.ssm.entity.SysLog;
import org.cloud.ssm.utils.BaseService;

public interface ISysLogService extends BaseService<SysLog> {

    void clearLogs();

}
