package project.DAO;

import project.DTO.UserDetailsDto;
import project.DTO.UserDto;

import java.util.List;

public interface UserDao {

    UserDetailsDto select(String id);

    UserDto selectUserInfo(String id);

    List<UserDto> selectAll();

    int insert(UserDetailsDto userDetailsDto);

    int update(UserDetailsDto userDetailsDto);

    int changeDptPhone(UserDetailsDto userDetailsDto);

    int changeEnabled(UserDetailsDto userDetailsDto);


    int deleteUserAccount(String id);

    int deleteAll();

    int count(String id);

    UserDetailsDto selectUserINFO(String id);

    int changePwd(UserDetailsDto userDetailsDto);

    String checkPwd(String id);

    int validation(UserDetailsDto userDetailsDto);
}
