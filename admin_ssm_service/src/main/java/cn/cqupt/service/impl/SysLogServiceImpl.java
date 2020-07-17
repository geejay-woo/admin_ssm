package cn.cqupt.service.impl;

import cn.cqupt.dao.ISysLogDao;
import cn.cqupt.domain.SysLog;
import cn.cqupt.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements ISysLogService {

    @Autowired
    private ISysLogDao dao;

    @Override
    public void save(SysLog sysLog) throws Exception {
        dao.save(sysLog);
    }

    @Override
    public List<SysLog> findAll() throws Exception {
        return dao.findAll();
    }
}
