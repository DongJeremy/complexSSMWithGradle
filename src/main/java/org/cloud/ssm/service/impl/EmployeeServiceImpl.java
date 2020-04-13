package org.cloud.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.cloud.ssm.base.BaseServiceImpl;
import org.cloud.ssm.entity.Employee;
import org.cloud.ssm.mapper.EmployeeMapper;
import org.cloud.ssm.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

@Service
public class EmployeeServiceImpl extends BaseServiceImpl<EmployeeMapper, Employee> implements IEmployeeService {

    private static final Logger logger = LogManager.getLogger(EmployeeServiceImpl.class);

    @Resource
    private EmployeeMapper employeeMapper;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public List<Employee> getAllByCondition(String username, String deptName, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return employeeMapper.selectAllByCondition(username, deptName);
    }

    @Override
    public Long getCountByCondition(String username, String deptName) {
        return employeeMapper.selectCountByCondition(username, deptName);
    }

    @Override
    public Long batchSaveEmployee(List<Employee> list) {
        SqlSession batchSqlSession = null;
        try {
            long beginTime = System.currentTimeMillis();
            batchSqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
            int batchCount = 500;
            for (int index = 0; index < list.size(); index++) {
                Employee employee = list.get(index);
                batchSqlSession.getMapper(EmployeeMapper.class).insert(employee);
                if (index != 0 && index % batchCount == 0) {
                    batchSqlSession.commit();
                }
            }
            batchSqlSession.commit();
            long endTime = System.currentTimeMillis();
            logger.info("插入完成， 耗时 " + (endTime - beginTime) + " 毫秒！");
        } finally {
            if (batchSqlSession != null) {
                batchSqlSession.close();
            }
        }
        return 1L;
    }


}
