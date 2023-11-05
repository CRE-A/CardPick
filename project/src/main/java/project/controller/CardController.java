package project.controller;

import jdk.jshell.Snippet;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.DAO.SelectedCardsDao;
import project.DTO.SelectedCardsDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/card")
@Slf4j
public class CardController {

    private final SelectedCardsDao selectedCardsDao;


    @GetMapping("/list")
    public String showCardList(Model m, String ind) {
        m.addAttribute("ind", ind);
        return "cardList";
    }


    @GetMapping("/select")
    public String selectCard(Authentication auth, Model m, String no) throws Exception {


        // 카드 9개 읽은 상태면, 뒤로가기
        if (selectedCardsDao.count(getId(auth)) >= 9) {


            String ind = getIndex(no);

            m.addAttribute("ind", ind);
            m.addAttribute("msg", "9장을 모두 골랐습니다. 카드 삭제 후 이용해 주세요");
            return "cardList";
        }

        // 읽은 카드는 DB(tbl_selectedCards)에 INSERT
        selectedCardsDao.insert(new SelectedCardsDto(getId(auth), no));
        m.addAttribute("No", no);
        return "card";
    }


    @GetMapping("/selectedCardList")
    public String showSelectedCardList(Authentication auth, Model m, String msg) throws Exception {

        System.out.println("card/selectedCardList");

        List<SelectedCardsDto> selectedCardsList = selectedCardsDao.select(getId(auth));
        m.addAttribute("selectedCardsList", selectedCardsList);
        m.addAttribute("msg", msg);

        return "selectedCardList";
    }


//    @GetMapping("/deleteAll")
//    public void deleteAllSelectedCards(Authentication auth, Model m, HttpServletRequest request, HttpServletResponse response) throws Exception {
//        log.debug("auth : {}", auth);
//        System.out.println("/deleteAll  /// ");
//
//        int cnt = 0;
//        try {
//            cnt = selectedCardsDao.deleteAll(getId(auth));
//            m.addAttribute("msg", "리스트가 삭제되었습니다");
//            System.out.println("cnt = " + cnt);
//
////            return "redirect:/card/selectedC?ardList";
//
//            String URI = request.getContextPath();
//            String prevPage = (String) request.getSession().getAttribute("prevPage");
//            if (prevPage != null) {
//                request.getSession().removeAttribute("prevPage");
//                URI = prevPage;
//            }
//
////            return "redirect:/";
//            response.sendRedirect(URI);
//
//        } catch (Exception e) {
//            System.out.println("error deleteAll");
//            e.printStackTrace();
//        }
//
//    }


    @GetMapping("/deleteAll")
    public String deleteAllSelectedCards(Authentication auth, Model m) throws Exception {
        log.debug("auth : {}", auth);
        System.out.println("/deleteAll  /// ");

        int cnt = 0;
        try {
            cnt = selectedCardsDao.deleteAll(getId(auth));
            m.addAttribute("msg", "리스트가 삭제되었습니다");
            System.out.println("cnt = " + cnt);

//            return "redirect:/card/selectedC?ardList";
            return "redirect:/";

        } catch (Exception e) {
            System.out.println("error deleteAll");
            m.addAttribute("msg", "리스트 삭제에 실패했습니다");

            return "redirect:/";
        }

    }


    @GetMapping("/deleteCard")
    public String deleteSelectedCard(Authentication auth, Model m, SelectedCardsDto selectedCardsDto) throws Exception {

        selectedCardsDto.setId(getId(auth));

        try {
            int cnt = selectedCardsDao.delete(selectedCardsDto);
            m.addAttribute("msg", "리스트가 삭제되었습니다");
            System.out.println("cnt = " + cnt);
            return "redirect:/card/selectedCardList";


        } catch (Exception e) {
            m.addAttribute("msg", "리스트 삭제에 실패했습니다");
            System.out.println("error delete");
            return "redirect:/card/selectedCardList";
        }

////
////        if (cnt < 0) {
////            rattr.addFlashAttribute("msg", "리스트 삭제에 실패했습니다");
////        } else {
////            rattr.addFlashAttribute("msg", "리스트가 삭제되었습니다");
////        }
//
//        return "redirect:/";
    }


    @GetMapping("/prevPage")
    public String goPrevPage(String no, Model m) {

        String ind = getIndex(no);

        m.addAttribute("ind", ind);
        return "cardList";

    }

    private String getId(Authentication auth) {
        UserDetails userDetails = (UserDetails) auth.getPrincipal();
        return userDetails.getUsername();
    }

    private String getIndex(String no) {
        String ind = "";

        if (no.length() == 4) {
            ind = no.substring(0, 2);
        } else {
            ind = no.substring(0, 1);
        }
        return ind;
    }

}
