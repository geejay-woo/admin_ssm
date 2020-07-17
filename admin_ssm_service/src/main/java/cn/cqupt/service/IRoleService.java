package cn.cqupt.service;

import cn.cqupt.domain.Permission;
import cn.cqupt.domain.Role;

import java.util.List;

public interface IRoleService {
    List<Role> findAll() throws Exception;

    void save(Role role) throws Exception;

    Role findById(String id);

    void deleteById(String id);

    List<Permission> findOtherPermission(String roleId)throws Exception;

    void addPermissionToRole(String roleId, String[] ids)throws Exception;
}
