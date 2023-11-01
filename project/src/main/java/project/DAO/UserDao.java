package project.DAO;

import project.DTO.SearchCondition;
import project.DTO.UserDetailsDto;
import project.DTO.UserDto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface UserDao {

    List<UserDto> SearchResultUser(SearchCondition sc) throws Exception;

    UserDetailsDto select(String id) throws Exception;

    UserDto selectUserInfo(String id) throws Exception;

    List<UserDto> selectAll() throws Exception;

    int insert(UserDetailsDto userDetailsDto) throws Exception;

    int update(UserDetailsDto userDetailsDto) throws Exception;

    int changeDptPhone(UserDetailsDto userDetailsDto) throws Exception;

    int changeEnabled(Map map) throws Exception;


    int deleteUserAccount(String id) throws Exception;

    int deleteAll() throws Exception;

    int count(String id) throws Exception;

    UserDetailsDto selectUserINFO(String id) throws Exception;

    int updateExpDateAndEnabled(UserDto userDto) throws Exception;

    int changePwd(UserDetailsDto userDetailsDto) throws Exception;

    String checkPwd(String id) throws Exception;

    int validation(UserDetailsDto userDetailsDto) throws Exception;

    int SearchResultCnt(SearchCondition sc) throws Exception;
}
