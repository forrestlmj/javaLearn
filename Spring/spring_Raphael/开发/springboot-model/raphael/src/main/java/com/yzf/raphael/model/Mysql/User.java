package com.yzf.raphael.model.Mysql;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/10/20 3:59 PM
 */

@Data
@ApiModel(value = "用户")
public class User implements UserDetails {
    @ApiModelProperty(value = "用户id",hidden = true)
    private Long id;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    @ApiModelProperty(value = "用户名",example = "yangchengkai@yunzhangfang.com", required = true)
    private String username;

    @ApiModelProperty(value = "用户密码",example = "123456", required = true)
    private String password;
    @ApiModelProperty(value = "权限列表",hidden = true)
    private List<Role> roles;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
//        for (Role role : roles) {
        authorities.add( new SimpleGrantedAuthority("normal") );
        return authorities;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
