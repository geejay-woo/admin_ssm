package cn.cqupt.dao;

import cn.cqupt.domain.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IPermissionDao {
    @Select("select * from permission where id in (select permissionid from role_permission where roleid=#{roleid})")
    public List<Permission> findRoleId(String roleId) throws Exception;

    @Select("select * from permission")
    List<Permission> findAll();

    @Insert("insert into permission(permissionName,url) values(#{permissionName},#{url})")
    void save(Permission permission);

    @Select(("select * from permission where id = #{permissionId}"))
    Permission findById(String permissionId)throws Exception;

    @Delete("delete from permission where id = #{id}")
    void deleteById(String id);

    @Delete("delete from role_permission where permissionId = #{id}")
    void deleteRole_PermissionByPId(String id);
}
