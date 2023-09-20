package project.DAO;

import project.DTO.UserDetailsDto;

public interface UserDao {
    int insert(UserDetailsDto userDetailsDto);

    UserDetailsDto select(String id);

    int update(UserDetailsDto userDetailsDto);

    int changeDptPhone(UserDetailsDto userDetailsDto);

    int delete(String user_email);

    int deleteAll();

    int count(String id);

    UserDetailsDto selectUserINFO(String id);

    int changePwd(UserDetailsDto userDetailsDto);

    int validation(UserDetailsDto userDetailsDto);
}
