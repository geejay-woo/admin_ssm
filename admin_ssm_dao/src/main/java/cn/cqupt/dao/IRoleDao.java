package cn.cqupt.dao;

import cn.cqupt.domain.Permission;
import cn.cqupt.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IRoleDao {
    @Select("select * from role where id in (select roleid from users_role where userid = #{userid})")
    @Results({
            @Result(column = "id",property = "permissions",javaType = java.util.List.class,many = @Many(select = "cn.cqupt.dao.IPermissionDao.findRoleId"))
    })
    public List<Role> findByUserid(String userid);

    @Select("select * from role")
    List<Role> findAll();

    @Insert("insert into role(rolename,roledesc) values(#{roleName},#{roleDesc})")
    void save(Role role);

    @Select("select * from role where id = #{id}")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "id",property = "permissions",javaType = java.util.List.class, many = @Many(select = "cn.cqupt.dao.IPermissionDao.findRoleId"))
    })
    Role findById(String id);

    @Delete("delete from role_permission where roleId=#{roleId}")
    void deleteFromRole_PermissionByRoleId(String roleId);

    @Delete("delete from users_role where roleId=#{roleId}")
    void deleteFromUsers_RoleByRoleId(String roleId);

    @Delete("delete from role where id=#{roleId}")
    void deleteFromRole(String roleId);

    @Select("select * from permission where id not in(select permissionid from role_permission where roleId=#{roleId})")
    List<Permission> findOtherPermission(String roleId)throws Exception;

    @Insert("insert into role_permission(roleId,permissionId) values(#{roleId},#{id})")
    void addPermissionToRole(@Param("roleId") String roleId,@Param("id") String id);
}
