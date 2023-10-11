package project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import project.DTO.UserDetailsDto;
import project.DAO.UserDao;
import project.DTO.UserDto;
import project.service.UserDetailService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;
import java.net.URLEncoder;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/register")
public class RegisterController {

    private final UserDetailService userDetailService;
    private final UserDao userDao;
    private final MailController mailController;


    @GetMapping("/addUser")
    public String registerForm() {
        return "registerForm";
    }


    @PostMapping("/addUser")
    public String register(UserDetailsDto userDetailsDto, Model m) {

        int cnt = userDetailService.registerAccount(userDetailsDto);
        if (cnt != 1) {
            m.addAttribute("msg", "회원가입에 실패하였습니다. 다시 시도해 주세요");
            return "registerForm";
        } else {
            m.addAttribute("msg", "회원가입이 완료되었습니다.");
        }

        return "loginForm";
    }


    @PostMapping("/checkID")
    public String checkID(UserDto userDto, Model m) {

        int cnt = userDao.count(userDto.getId());
        if (cnt == 0) {
            m.addAttribute("msg", "사용 가능한 ID 입니다.");
            m.addAttribute("chk", "true");
        } else {
            m.addAttribute("msg", "이미 사용중인 ID 입니다.");
        }

        m.addAttribute("userDto", userDto);
        return "registerForm";
    }


    @GetMapping("/findPwd")
    public String findPwd() {
        return "findPwdForm";
    }


    @PostMapping("/findPwd")
    public String findPwd(UserDetailsDto userDetailsDto, Model m, HttpServletRequest req) {

        int cnt = userDao.validation(userDetailsDto);
        if (cnt != 1) {
            m.addAttribute("msg", "아이디 혹은 이메일이 유효하지 않습니다.");
            return "findPwdForm";
        } else {
            try{
                mailController.mailSending(userDetailsDto.getId(), userDetailsDto.getEmail());
                m.addAttribute("msg", "지정된 이메일로 발송했습니다");
            } catch (Exception e){
                m.addAttribute("msg","메일 발송에 실패하였습니다.");
            }
        }
        return "loginForm";
    }


    private boolean duplicateCheck(UserDetailsDto userDetailsDto) {

        UserDetailsDto userDto = userDao.select(userDetailsDto.getUsername());
        System.out.println("DuplicateCheck // user = " + userDto);
        return userDto == null || userDto.getUsername().equals("");
    }

}
