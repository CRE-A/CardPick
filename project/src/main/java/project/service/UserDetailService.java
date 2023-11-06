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

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserDetailService implements UserDetailsService {

    private final UserDao userDao;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;


    // Authentication //
    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {

        UserDetailsDto userINFO = userDao.selectUserINFO(id);
        if (userINFO == null) {
            throw new UsernameNotFoundException("해당 사용자를 찾을 수 없습니다. : " + id);
        }
        checkExpirationDate(userINFO);            //  계정만료일 지난 계정인지 체크

        return userINFO;
   }




    private void checkExpirationDate(UserDetailsDto userInfo) {

        if(isRegisteredUser(userInfo)){                     // 회원가입 후 승인 대기중인 계정은, 빠져나감
            return ;
        }
            System.out.println("1");

        Date now = new Date();
        Date expirationDate = userInfo.getExpirationDate();

        if (now.after(expirationDate)) {                     // 계정만료일을 지났으면, 계정 정지
            Map<String, Object> map = new HashMap();
            map.put("enabled", 0);                           // (enabled =0) 으로 변경
            map.put("id", userInfo.getId());

            try {
                userDao.changeEnabled(map);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

    }

    private boolean isRegisteredUser(UserDetailsDto userINFO) {
        return userINFO.getEnabled()== -1;

    }


    // Registration // 회원이 입력한 pwd 를 암호화해서 db에 저장
    public int registerAccount(UserDetailsDto userDetailsDto) throws Exception {
        String encodedPassword = bCryptPasswordEncoder.encode(userDetailsDto.getPassword());
        userDetailsDto.setPwd(encodedPassword);
        return userDao.insert(userDetailsDto);
    }


}
