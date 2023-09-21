package project.DTO;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

@SuppressWarnings("serial")
public class UserDetailsDto implements UserDetails {

    private String id;
    private String pwd;
    private String name;
    private String email;
    private String dpt;
    private String phone;
    private Date regdate;
    private String authority;
    private Integer enabled;
    private String currentPwd;


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
        authList.add(new SimpleGrantedAuthority(authority));
        return authList;
    }

    @Override
    public String getPassword() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    //usertName = id
    @Override
    public String getUsername() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
        return enabled == 1 ? true : false;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDpt() {
        return dpt;
    }

    public void setDpt(String dpt) {
        this.dpt = dpt;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCurrentPwd() {
        return currentPwd;
    }

    public void setCurrentPwd(String currentPwd) {
        this.currentPwd = currentPwd;
    }

    public String getId() {
        return id;
    }

    public String getPwd() {
        return pwd;
    }

    @Override
    public String toString() {
        return "UserDetailsDto{" +
                "id='" + id + '\'' +
                ", pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", dpt='" + dpt + '\'' +
                ", phone='" + phone + '\'' +
                ", regdate=" + regdate +
                ", authority='" + authority + '\'' +
                ", enabled=" + enabled +
                ", currentPwd='" + currentPwd + '\'' +
                '}';
    }
}
