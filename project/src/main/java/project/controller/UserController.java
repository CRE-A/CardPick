package project.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import project.DAO.UserDao;
import project.DTO.UserDetailsDto;
import project.DTO.UserDto;
import project.service.UserDetailService;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

    private final UserDao userDao;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;


    @GetMapping("/main")
    public String myPage(Model m, Authentication auth, String msg) {

        UserDto userDto = userDao.selectUserInfo(getId(auth));
        m.addAttribute("userDto", userDto);
        m.addAttribute("msg", msg);

        return "myPage";
    }


    @PostMapping("/changePwd")
    public String changePwd(Model m, UserDetailsDto userDetailsDto) {

        //유효성 검사
        if (!(isAthenticated(userDetailsDto))) {
            m.addAttribute("msg", "현재 비밀번호를 다시 입력해 주세요.");
            return "redirect:/user/main";
        }


        String encodedPassword = bCryptPasswordEncoder.encode(userDetailsDto.getPassword());
        userDetailsDto.setPwd(encodedPassword);
        int cnt = userDao.changePwd(userDetailsDto);
        if (cnt == 1) {
            m.addAttribute("msg", "비밀번호가 변경되었습니다.");
        } else {
            m.addAttribute("msg", "비밀번호 변경에 실패했습니다.");
        }

        return "redirect:/user/main";
    }



    @PostMapping("/updatePWD")
    public void updateTmpPassword(String id, String TmpPassword) {

        String encodedPassword = bCryptPasswordEncoder.encode(TmpPassword);
        UserDetailsDto userDetailsDto = new UserDetailsDto();
        userDetailsDto.setPwd(encodedPassword);
        userDetailsDto.setId(id);

        int cnt = userDao.changePwd(userDetailsDto);
    }


    @PostMapping("/changeDptPhone")
    public String modifyProfile(Model m, UserDetailsDto userDetailsDto, Authentication auth) {

        userDetailsDto.setId(getId(auth));
        int cnt = userDao.changeDptPhone(userDetailsDto);
        if (cnt == 1) {
            m.addAttribute("msg", "프로필 정보가 수정되었습니다.");
        } else {
            m.addAttribute("msg", "프로필 수정에 실패했습니다.");
        }

        return "redirect:/user/main";
    }


    private String getId(Authentication auth) {
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        return userDetails.getUsername();
    }

    private boolean isAthenticated(UserDetailsDto userDetailsDto) {

        String checkPwd = userDao.checkPwd(userDetailsDto.getUsername());
        String pwd = userDetailsDto.getCurrentPwd();
        return bCryptPasswordEncoder.matches(pwd, checkPwd);
    }

}
