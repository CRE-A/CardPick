package project.DAO;

import project.DTO.UserDetailsDto;
import project.DTO.UserDto;

public interface UserDao {
    int insert(UserDetailsDto userDetailsDto);

    UserDetailsDto select(String id);
    UserDto selectUserInfo(String id);

    int update(UserDetailsDto userDetailsDto);

    int changeDptPhone(UserDetailsDto userDetailsDto);

    int delete(String user_email);

    int deleteAll();

    int count(String id);

    UserDetailsDto selectUserINFO(String id);

    int changePwd(UserDetailsDto userDetailsDto);

    String checkPwd(String id);

    int validation(UserDetailsDto userDetailsDto);
}
