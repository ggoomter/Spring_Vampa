package com.vam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.UserDTO;
import com.vam.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
    private UserService uService;
	
    
    
    /* 회원가입 화면 */
    @GetMapping("/join")
    // => @RequestMapping(value="enroll", method=RequestMethod.GET)
    public void viewJoin() {
        log.info("게시판 등록 페이지 진입");
    }
    
    /* 회원가입 처리 */
    @PostMapping("/join")
    public String joinAction(UserDTO user, RedirectAttributes rttr) {
        log.info("UserDTO : " + user);
        uService.join(user);
        rttr.addFlashAttribute("result", "enrol success");
        return "redirect:/user/login";
    }
    
    /* 로그인 화면 */
    @GetMapping("/login")
    public void viewLogin() {
        log.info("로그인 페이지 진입");
    }
    
    /* 로그인 처리 */
    @PostMapping("/login")
    public String loginAction(UserDTO user, RedirectAttributes rttr) {
        log.info("UserDTO : " + user);
        uService.login(user);
        rttr.addFlashAttribute("result", "enrol success");
        return "redirect:/";
    }
    


}
