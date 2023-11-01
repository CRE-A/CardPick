package project.service;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import project.DTO.UserDetailsDto;
import project.DAO.UserDao;

@Service
@RequiredArgsConstructor
public class UserDetailService implements UserDetailsService {

    private final UserDao userDao;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;


    // Authentication //
    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {

        UserDetailsDto userDetailsDto = null;
        try {
            userDetailsDto = userDao.selectUserINFO(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if (userDetailsDto == null) {
            throw new UsernameNotFoundException("id" + id + " not found");
        }
        return userDetailsDto;
    }


    // Registration // 회원이 입력한 pwd 를 암호화해서 db에 저장
    public int registerAccount(UserDetailsDto userDetailsDto) throws Exception {
        String encodedPassword = bCryptPasswordEncoder.encode(userDetailsDto.getPassword());
        userDetailsDto.setPwd(encodedPassword);
        return userDao.insert(userDetailsDto);
    }


}
