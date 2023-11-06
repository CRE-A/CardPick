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
    public String myPage(Model m, Authentication auth, String msg) throws Exception {

        UserDto userDto = userDao.selectUserInfo(getId(auth));
        m.addAttribute("userDto", userDto);
        m.addAttribute("msg", msg);

        return "myPage";
    }


    @PostMapping("/changePwd")
    public String changePwd(Model m, UserDetailsDto userDetailsDto) throws Exception {

        // 유효성 검사
        if (!(isAthenticated(userDetailsDto))) {
            m.addAttribute("msg", "현재 패스워드를 다시 입력해 주세요");
            return "redirect:/user/main";
        }
        if (userDetailsDto.getPassword()==null || userDetailsDto.getPassword().equals("") || userDetailsDto.getPassword().length()<5){
            m.addAttribute("msg","변경 패스워드를 5자 이상 입력해 주세요");
            //            m.addAttribute("msg","변경 패스워드를 입력해 주세요");
            return "redirect:/user/main";
        }
//        if (userDetailsDto.getPassword().length()<5){
//            m.addAttribute("msg","변경 패스워드를 5자 이상 입력해 주세요");
//            return "redirect:/user/main";
//        }


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
    public void updateTmpPassword(String id, String TmpPassword) throws Exception {

        String encodedPassword = bCryptPasswordEncoder.encode(TmpPassword);
        UserDetailsDto userDetailsDto = new UserDetailsDto();
        userDetailsDto.setPwd(encodedPassword);
        userDetailsDto.setId(id);

        userDao.changePwd(userDetailsDto);
    }


    @PostMapping("/changeDptPhone")
    public String modifyProfile(Model m, UserDetailsDto userDetailsDto, Authentication auth) throws Exception {

        // 유효성 검사 (null check)
        if (userDetailsDto.getDpt()==null || userDetailsDto.getDpt().equals("")){
            m.addAttribute("msg","소속을 입력해 주세요");
            return "redirect:/user/main";
        }
        if (userDetailsDto.getPhone()==null || userDetailsDto.getPhone().equals("")){
            m.addAttribute("msg","전화번호를 입력해 주세요");
            return "redirect:/user/main";
        }


        // 유효성 검사  (너무 긴 string check)
        if (userDetailsDto.getDpt().length()>20){
            m.addAttribute("msg","소속 항목 허용 글자수를 초과했습니다.");
            return "redirect:/user/main";
        }
        if (userDetailsDto.getPhone().length()>20){
            m.addAttribute("msg","전화번호 항목 허용 글자수를 초과했습니다.");
            return "redirect:/user/main";
        }



        userDetailsDto.setId(getId(auth));
        int cnt = userDao.changeDptPhone(userDetailsDto);
        if (cnt == 1) {
            m.addAttribute("msg", "소속, 전화번호가 수정되었습니다.");
        } else {
            m.addAttribute("msg", "프로필 정보 수정에 실패했습니다.");
        }

        return "redirect:/user/main";
    }


    private String getId(Authentication auth) {
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        return userDetails.getUsername();
    }

    private boolean isAthenticated(UserDetailsDto userDetailsDto) throws Exception {

        String checkPwd = userDao.checkPwd(userDetailsDto.getUsername());
        String pwd = userDetailsDto.getCurrentPwd();
        return bCryptPasswordEncoder.matches(pwd, checkPwd);
    }

}
