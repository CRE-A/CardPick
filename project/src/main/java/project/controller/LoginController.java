package project.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/login")
public class LoginController {


    @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
    public String loginForm() {

        if (isAuthenticated()) {
            System.out.println("is already Authenticated  >>  'redirect:/'");
            return "redirect:/";
        }
        return "loginForm";
    }


    @PostMapping("/processing")
    public void login() {
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        System.out.println("logout complete");
        return "redirect:/login/login";
    }


    private boolean isAuthenticated() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || AnonymousAuthenticationToken.class.
                isAssignableFrom(authentication.getClass())) {
            return false;
        }
        return authentication.isAuthenticated();
    }


}

