package project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {

    @RequestMapping(value="/error/error")
    public String showErrorPage() {
        return "error/error";
    }


    @RequestMapping(value = "/pageAccessDenied", method={RequestMethod.GET, RequestMethod.POST})
    public String pageAccessDenied(){
        return "pageAccessDenied";
    }



}
