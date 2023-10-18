package project.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


// 이하 HOME 에 대한 모든 내용
@Controller
@RequiredArgsConstructor
public class HomeController {



    @RequestMapping("/")
    public String home() {
        return "home";
    }


    @RequestMapping("/referer")
    public void goBackToReferer(HttpServletRequest req, HttpServletResponse response) throws IOException {
        String referer = req.getHeader("Referer");
        response.sendRedirect(referer);
    }


}

