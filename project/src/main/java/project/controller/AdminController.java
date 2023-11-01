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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.DAO.UserDao;
import project.DTO.PageHandler;
import project.DTO.SearchCondition;
import project.DTO.UserDetailsDto;
import project.DTO.UserDto;
import project.service.UserDetailService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final UserDao userDao;


    @GetMapping("/main")
    public String myPage(Model m, SearchCondition sc, String msg, RedirectAttributes rattr) throws Exception {

        System.out.println("admin/main /// sc = " + sc);

        try {
            int totalCnt = userDao.SearchResultCnt(sc);
            PageHandler pageHandler = new PageHandler(sc,totalCnt);
            m.addAttribute("ph", pageHandler);
            // 페이징에 대한 data

            List<UserDto> SearchResultUserList = userDao.SearchResultUser(sc);
            m.addAttribute("userDtoList", SearchResultUserList);
            // 검색 조건에 해당하는 user 대한 data

        } catch (Exception e) {
            e.printStackTrace();
//            m.addAttribute("msg","검색어와 일치하는 결과가 없습니다");
            return "adminPage";

        }

//        rattr.addFlashAttribute("msg", msg);
        m.addAttribute("msg",msg);
        return "adminPage";

    }




    @GetMapping("/search")
    public String search(Model m, SearchCondition sc) {

        System.out.println("admin/search /// sc = " + sc);

        try {
            int totalCnt = userDao.SearchResultCnt(sc);
            PageHandler pageHandler = new PageHandler(sc,totalCnt);
            m.addAttribute("ph", pageHandler);
            // 페이징에 대한 data

            List<UserDto> SearchResultUserList = userDao.SearchResultUser(sc);
            m.addAttribute("userDtoList", SearchResultUserList);
            // 검색 조건에 해당하는 user 대한 data


        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg","검색어와 일치하는 결과가 없습니다");
            return "redirect:/admin/main";

        }

        return "adminPage";
    };



    @PostMapping("/accountManagement")
    public String accountManagement(Model m,  UserDto userDto) throws Exception {

        // enabled num, expiration date 를 user_tbl에 update
        Integer enabledNum = getEnabledNum(userDto);
        userDto.setEnabled(enabledNum);
        userDao.updateExpDateAndEnabled(userDto);

            return "redirect:/admin/main";
    }

    private Integer getEnabledNum(UserDto u) {

        // 가입일(regdate)과 계정활성일(expirationDate)를 비교해 enabled number을 부여한다.
        // 계정활성일 이 오늘 보다 후에 있을 경우, enabled = 1  --> 계정 활성
        // 계정활성일 이 오늘 보다 전에 있을 경우, enabled = 0  --> 계정 정지
        // (가입직후)                           enabled = -1 --> 승인 대기


        Date now = new Date();
        Date expirationDate = u.getExpirationDate();

        if(now.before(expirationDate)) return 1;
        if(now.after(expirationDate)) return 0;

        return -1;
    }


}
