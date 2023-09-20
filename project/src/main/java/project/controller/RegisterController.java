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
import project.service.UserDetailService;

import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/register")
public class RegisterController {

    private final UserDetailService userDetailService;
    private final UserDao userDao;


    @GetMapping("/addUser")
    public String registerForm() {return "registerForm";
    }

    @PostMapping("/addUser")
    public String register(UserDetailsDto userDetailsDto, Model m) {

        int cnt = userDetailService.registerAccount(userDetailsDto);
        if(cnt!=1){
            m.addAttribute("msg","회원가입에 실패하였습니다. 다시 시도해 주세요");
            return "registerForm";
        }else{
            m.addAttribute("msg","회원가입이 완료되었습니다.");
        }

        return "loginForm";
    }



    private boolean duplicateCheck(UserDetailsDto userDetailsDto) {

        UserDetailsDto userDto = userDao.select(userDetailsDto.getUsername());
        System.out.println("DuplicateCheck // user = " + userDto);
        return userDto==null||userDto.getUsername().equals("");
    }


    @PostMapping("/checkID")
    public String checkID(UserDetailsDto userDetailsDto, Model m) {

        int cnt = userDao.count(userDetailsDto.getUsername());
        if (cnt == 0) {
            m.addAttribute("msg", "사용 가능한 ID 입니다.");
        } else {
            m.addAttribute("msg", "이미 사용중인 ID 입니다.");
        }

        m.addAttribute("userDetailsDto",userDetailsDto);
        m.addAttribute("id",userDetailsDto.getUsername());
        return "registerForm";
    }


//        System.out.println("id = " + id);
//        if (id != null) {
//            try {
//                UserDetailsDto user = userDao.select(id);
//                chk = user == null ? false : true;
//                return chk;
//            } catch (Exception e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//        }
//
//        return chk;
//    }







    @GetMapping("/findPwd")
    public String findPwd() {
        return "findPwdForm";
    }




//    @PostMapping("/findPwd")
//    public void findPwd2()  {

//        if (!duplicateCheck(userDetailsDto)) {
//            String msg = URLEncoder.encode("duplicated id", "utf-8");
//
//            return "redirect:/register/add?msg=" + msg;
//        }
//
//        log.info("RegisterController, 방금 여기 지나감   //  userDetailsDto = " + userDetailsDto);
//        userDetailService.registerAccount(userDetailsDto);
//        System.out.println("Register complete");
//
//        return "redirect:/login/login";
//    }



//
//    @PostMapping("/CheckID")
//    public String
//


//
//    @PostMapping("/checkID")
//    @ResponseBody
//    public Boolean checkID(String id) {
//        boolean chk = true;
//
//        System.out.println("id = " + id);
//        if (id != null) {
//            try {
//                UserDetailsDto user = userDao.select(id);
//                chk = user == null ? false : true;
//                return chk;
//            } catch (Exception e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//        }
//
//        return chk;
//    }









}
