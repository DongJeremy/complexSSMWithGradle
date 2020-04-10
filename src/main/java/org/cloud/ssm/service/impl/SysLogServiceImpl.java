package org.cloud.ssm.service.impl;

import javax.annotation.Resource;

import org.cloud.ssm.entity.SysLog;
import org.cloud.ssm.mapper.SysLogMapper;
import org.cloud.ssm.service.ISysLogService;
import org.cloud.ssm.utils.BaseServiceImpl;
import org.springframework.stereotype.Service;

@Service("sysLogService")
public class SysLogServiceImpl extends BaseServiceImpl<SysLogMapper, SysLog> implements ISysLogService {

    @Resource
    private SysLogMapper sysLogMapper;

    @Override
    public void clearLogs() {
        sysLogMapper.clearLogs();
    }

}
