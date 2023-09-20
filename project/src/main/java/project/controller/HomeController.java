package project.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


// 이하 HOME 에 대한 모든 내용
    @Controller
    public class HomeController {


        @RequestMapping ("/")
        public String home(){
            return "home";
        }


        @RequestMapping("/referer")
        public void gobackToReferer(HttpServletRequest req, HttpServletResponse response) throws IOException {
            String referer = req.getHeader("Referer");
            response.sendRedirect(referer);
        };
    };



























//    @RequestMapping("/main.do")
//    public String mainController(Authentication auth, Model m, String ind, String no, String code) {
//
//        // if index >> cardList
//        // else selectCard >> card
//        // else selectedCard >> selectedCard
//        // else  home >> home
//
//        UserDetails userDetails = (UserDetails)auth.getPrincipal();
//        String id = userDetails.getUsername();
//
//        System.out.println("/main 의 id = " + id);
////        System.out.println("m = " + m);
////        System.out.println("ind = " + ind);
////        System.out.println("no = " + no);
////        System.out.println("code = " + code);
//
//        if (ind != null) {
//            m.addAttribute("ind",ind);
//            System.out.println("1");
//            return "forward:/card/list";
//        }
//
//        if (no != null) {
//            m.addAttribute("no",no);
//            System.out.println("2");
//
//            return "forward:/card/select?id="+id;
//        }
//
//        if(code.equals("scl")){
//            System.out.println("3");
//
//            return "forward:/card/selectedCardsList?id="+id;
//        }
//
//        if(code.equals("del")){
//            System.out.println("4");
//
//            return "forward:/card/deleteAll?id="+id;
//        }
//
//        System.out.println("home 직전");
//        return "home";
//    }
