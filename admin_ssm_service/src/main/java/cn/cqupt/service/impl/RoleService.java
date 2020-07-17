package cn.cqupt.service.impl;

import cn.cqupt.dao.IRoleDao;
import cn.cqupt.domain.Permission;
import cn.cqupt.domain.Role;
import cn.cqupt.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService implements IRoleService {
    @Autowired
    private IRoleDao dao;

    @Override
    public List<Role> findAll() throws Exception {
        return dao.findAll();
    }

    @Override
    public void save(Role role) throws Exception {
        dao.save(role);
    }

    @Override
    public Role findById(String id) {
        return dao.findById(id);
    }

    @Override
    public void deleteById(String roleId) {
        //删除role_permission和users_role
        dao.deleteFromRole_PermissionByRoleId(roleId);
        dao.deleteFromUsers_RoleByRoleId(roleId);
        dao.deleteFromRole(roleId);
    }

    @Override
    public List<Permission> findOtherPermission(String roleId) throws Exception {
        return dao.findOtherPermission(roleId);
    }

    @Override
    public void addPermissionToRole(String roleId, String[] ids) throws Exception {
        for(String id : ids){
            dao.addPermissionToRole(roleId,id);
        }
    }
}
