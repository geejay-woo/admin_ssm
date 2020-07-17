package cn.cqupt.service;

import cn.cqupt.domain.Permission;

import java.util.List;

public interface IPermissionService {
    public List<Permission> findAll()throws Exception;

    void save(Permission permission) throws Exception;

    Permission findById(String permissionId)throws Exception;

    void deleteById(String id)throws Exception;
}
