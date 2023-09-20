package project.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.DAO.UserDao;
import project.DTO.UserDetailsDto;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

    private final UserDao userDao;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;


    @GetMapping("/main")
    public String myPage(Model m, Authentication auth, String msg) {

        UserDetailsDto userDetailsDto = userDao.select(getId(auth));
        m.addAttribute("userDetailsDto", userDetailsDto);
        m.addAttribute("id", getId(auth));
        m.addAttribute("msg", msg);
        return "myPage";
    }


    @PostMapping("/changePwd")
    public String changePwd(Model m, UserDetailsDto userDetailsDto, Authentication auth) {

        String encodedPassword = bCryptPasswordEncoder.encode(userDetailsDto.getPassword());
        userDetailsDto.setPwd(encodedPassword);
        userDetailsDto.setId(getId(auth));

        System.out.println("userDetailsDto = " + userDetailsDto);

        int cnt = userDao.changePwd(userDetailsDto);
        if (cnt == 1) {
            m.addAttribute("msg", "비밀번호가 변경되었습니다.");
        } else {
            m.addAttribute("msg", "비밀번호 변경에 실패했습니다.");
        }

        System.out.println("modify password succeeded");
        return "redirect:/user/main";
    }


    @PostMapping("/changeDptPhone")
    public String modifyProfile(Model m, UserDetailsDto userDetailsDto, Authentication auth) {

        System.out.println("/changeDptPhone");

        userDetailsDto.setId(getId(auth));
        int cnt = userDao.changeDptPhone(userDetailsDto);
        if (cnt == 1) {
            m.addAttribute("msg", "프로필 정보가 수정되었습니다.");
        } else {
            m.addAttribute("msg", "프로필 수정에 실패했습니다.");
        }

        System.out.println("modify profile succeeded");
        return "redirect:/user/main";
    }


    private String getId(Authentication auth) {
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        return userDetails.getUsername();
    }

}
