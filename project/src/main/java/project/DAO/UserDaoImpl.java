package project.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.DTO.UserDetailsDto;
import project.DTO.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "project.DAO.UserMapper.";


    @Override
    public UserDetailsDto select(String id) {
        return session.selectOne(namespace + "select", id);
    }

    @Override
    public UserDto selectUserInfo(String id) {
        return session.selectOne(namespace + "selectUserInfo", id);
    }


    @Override
    public int insert(UserDetailsDto userDetailsDto) {
        return session.insert(namespace + "insert", userDetailsDto);
    }

    @Override
    public int update(UserDetailsDto userDetailsDto) {
        return session.update(namespace + "update", userDetailsDto);
    }

    @Override
    public int changePwd(UserDetailsDto userDetailsDto) {
        return session.update(namespace + "changePwd", userDetailsDto);
    }

    @Override
    public String checkPwd(String id) {
        return session.selectOne(namespace + "checkPwd", id);
    }

    @Override
    public int validation(UserDetailsDto userDetailsDto) {
        return session.selectOne(namespace + "validation", userDetailsDto);
    }

    @Override
    public int changeDptPhone(UserDetailsDto userDetailsDto) {
        return session.update(namespace + "changeDptPhone", userDetailsDto);
    }

    @Override
    public int delete(String user_email) {
        return session.delete(namespace + "delete", user_email);
    }

    @Override
    public int deleteAll() {
        return session.delete(namespace + "deleteAll");
    }

    @Override
    public int count(String id) {
        return session.selectOne(namespace + "count", id);
    }


    //spring-security login-process
    @Override
    public UserDetailsDto selectUserINFO(String id) {
        return session.selectOne(namespace + "selectUserINFO", id);
    }


}
