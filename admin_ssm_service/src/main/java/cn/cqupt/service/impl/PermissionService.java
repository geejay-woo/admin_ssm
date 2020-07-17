package cn.cqupt.service.impl;

import cn.cqupt.dao.IPermissionDao;
import cn.cqupt.domain.Permission;
import cn.cqupt.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PermissionService implements IPermissionService {
    @Autowired
    private IPermissionDao dao;

    @Override
    public List<Permission> findAll() throws Exception {
        return dao.findAll();
    }

    @Override
    public void save(Permission permission) throws Exception {
        dao.save(permission);
    }

    @Override
    public Permission findById(String permissionId) throws Exception {
        return dao.findById(permissionId);
    }

    @Override
    public void deleteById(String id) throws Exception {
        dao.deleteRole_PermissionByPId(id);
        dao.deleteById(id);
    }
}
