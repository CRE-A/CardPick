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

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final UserDao userDao;


    @GetMapping("/main")
    public String myPage(Model m, String msg) {

        List<UserDto> userDtoList = userDao.selectAll();  // 웹사이트 회원 정보 리스트
        m.addAttribute("userDtoList", userDtoList);
        return "adminPage";
    }


    @GetMapping("/search")
    public String search(Model m, String option, String keyword) {

        HashMap map = new HashMap();
        map.put("option", option);
        map.put("keyword", keyword);

        try {

            List<UserDto> SearchResultUserList = userDao.SearchResultUser(map);  // 검색 결과에 일치하는 회원 정보 리스트
            m.addAttribute("userDtoList", SearchResultUserList);

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "search error");
            return "adminPage";
        }

        return "adminPage";
    }

    ;

    @PostMapping("/accountManagement")
    public String accountManagement(Model m, UserDetailsDto u) {

        // 계정관리
        // 관리자가 회원 계정을 정지/재활성 할 수 있다.
        // enabled == -1 이면 계정삭제
        // enabled == 0 이면 계정정지
        // enabled == 1 이면 계정재활성

        if (isDeleteUser(u)) {
            deleteUser(m, u.getId());
        } else {
            stopOrRestoreUser(m, u);
        }

        List<UserDto> userDtoList = userDao.selectAll();  // 웹사이트 회원 정보 리스트
        m.addAttribute("userDtoList", userDtoList);
        return "adminPage";
    }


    private void stopOrRestoreUser(Model m, UserDetailsDto userDetailsDto) {

        int cnt = userDao.changeEnabled(userDetailsDto);
        if (cnt == 1) {
            m.addAttribute("msg", "계정상태가 변경되었습니다.");
        } else {
            m.addAttribute("msg", "계정상태 변경에 실패했습니다.");
        }
    }


    private void deleteUser(Model m, String id) {

        int cnt = userDao.deleteUserAccount(id);
        if (cnt == 1) {
            m.addAttribute("msg", "해당 계정을 영구적으로 삭제했습니다.");
        } else {
            m.addAttribute("msg", "계정 삭제에 실패했습니다.");
        }

        List<UserDto> userDtoList = userDao.selectAll();  // 웹사이트 회원 정보 리스트
        m.addAttribute("userDtoList", userDtoList);
    }


    private boolean isDeleteUser(UserDetailsDto u) {
        return u.getEnabled() == -1;
    }


}
