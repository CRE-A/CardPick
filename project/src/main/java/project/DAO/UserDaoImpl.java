package project.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.DTO.SearchCondition;
import project.DTO.UserDetailsDto;
import project.DTO.UserDto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "project.DAO.UserMapper.";


    @Override
    public List<UserDto> SearchResultUser(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "SearchResultUser", sc);
    }

    @Override
    public int SearchResultCnt(SearchCondition sc)  throws Exception {
        System.out.println("/userDaoImpl   /// searchResultCnt");
        return session.selectOne(namespace + "searchResultCnt", sc);
    }

    @Override
    public UserDetailsDto select(String id)throws Exception {
        return session.selectOne(namespace + "select", id);
    }

    @Override
    public UserDto selectUserInfo(String id)throws Exception {
        return session.selectOne(namespace + "selectUserInfo", id);
    }

    @Override
    public List<UserDto> selectAll() throws Exception{
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public int insert(UserDetailsDto userDetailsDto) throws Exception{
        return session.insert(namespace + "insert", userDetailsDto);
    }

    @Override
    public int update(UserDetailsDto userDetailsDto)throws Exception {
        return session.update(namespace + "update", userDetailsDto);
    }

    @Override
    public int updateExpDateAndEnabled(UserDto userDto) throws Exception{
        return session.update(namespace + "updateExpDateAndEnabled", userDto);
    }

    @Override
    public int changePwd(UserDetailsDto userDetailsDto) throws Exception{
        return session.update(namespace + "changePwd", userDetailsDto);
    }

    @Override
    public String checkPwd(String id)throws Exception {
        return session.selectOne(namespace + "checkPwd", id);
    }

    @Override
    public int validation(UserDetailsDto userDetailsDto) throws Exception{
        return session.selectOne(namespace + "validation", userDetailsDto);
    }


    @Override
    public int changeDptPhone(UserDetailsDto userDetailsDto) throws Exception{
        return session.update(namespace + "changeDptPhone", userDetailsDto);
    }

    @Override
    public int changeEnabled(UserDetailsDto userDetailsDto) throws Exception{
        Map<String, Object> map = new HashMap();
//        map.put("enabled", (Integer) userDetailsDto.getEnabled());
        map.put("enabled", 1);
        map.put("id", userDetailsDto.getId());
        return session.update(namespace + "changeEnabled", map);
    }

    @Override
    public int deleteUserAccount(String id)throws Exception {
        return session.delete(namespace + "delete", id);
    }

    @Override
    public int deleteAll()throws Exception {
        return session.delete(namespace + "deleteAll");
    }

    @Override
    public int count(String id)throws Exception {
        return session.selectOne(namespace + "count", id);
    }


    //spring-security login-process
    @Override
    public UserDetailsDto selectUserINFO(String id)throws Exception {
        return session.selectOne(namespace + "selectUserINFO", id);
    }


}
