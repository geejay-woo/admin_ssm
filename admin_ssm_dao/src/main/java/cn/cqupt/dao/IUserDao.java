package cn.cqupt.dao;

import cn.cqupt.domain.Role;
import cn.cqupt.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IUserDao {
    @Select("select * from users where username=#{username}")
    @Results({
            @Result(id = false, property = "roles", column = "id", javaType = java.util.List.class, many = @Many(select = "cn.cqupt.dao.IRoleDao.findByUserid"))
    }
    )
    public UserInfo findByUsername(String username) throws Exception;

    @Select("select * from users")
    List<UserInfo> findAll();

    @Select("select * from users where id = #{id}")
    @Results({
            @Result(column = "id", property = "roles",javaType = java.util.List.class,many = @Many(select = "cn.cqupt.dao.IRoleDao.findByUserid")),
            @Result(id = true, column = "id", property = "id")
    }
    )
    UserInfo findById(String id);

    @Insert("insert into users(username,password,email,phonenum,status) values(#{username},#{password},#{email},#{phoneNum},#{status})")
    void save(UserInfo userInfo);

    @Select("select * from role where id not in(select roleId from users_role where userId = #{id})")
    List<Role> findOtherRole(String id);

    @Insert("insert into users_role(userId,roleId) values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId") String userId,@Param("roleId") String roleId) throws Exception;
}

