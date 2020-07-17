package cn.cqupt.service;

import cn.cqupt.domain.SysLog;

import java.util.List;

public interface ISysLogService {
    void save(SysLog sysLog)throws Exception;

    List<SysLog> findAll()throws Exception;

}
