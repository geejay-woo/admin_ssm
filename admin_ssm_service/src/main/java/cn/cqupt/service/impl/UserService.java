package cn.cqupt.service.impl;

import cn.cqupt.dao.IUserDao;
import cn.cqupt.domain.Role;
import cn.cqupt.domain.UserInfo;
import cn.cqupt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service("userService")
@Transactional
public class UserService implements IUserService {

    @Autowired
    private IUserDao dao;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = dao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        User user = new User(userInfo.getUsername(), userInfo.getPassword(), userInfo.getStatus() == 0 ? false : true,
                true, true, true, getAuthentication(userInfo.getRoles()));
        return user;
    }

    private Collection<? extends GrantedAuthority> getAuthentication(List<Role> roles) {
        List<SimpleGrantedAuthority> list =  new ArrayList<>();
        for(Role role : roles)
            list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        return list;
    }

    @Override
    public List<UserInfo> findAll() throws Exception{
        return dao.findAll();
    }

    @Override
    public void save(UserInfo userInfo) throws Exception {
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        dao.save(userInfo);
    }

    @Override
    public UserInfo findById(String id) throws Exception {
        return dao.findById(id);
    }

    @Override
    public List<Role> findOtherRole(String id) throws Exception {
        return dao.findOtherRole(id);
    }

    @Override
    public void addRoleToUser(String userId, String[] roleIds)throws Exception {
        for(String roleId : roleIds){
            dao.addRoleToUser(userId,roleId);
        }
    }
}
