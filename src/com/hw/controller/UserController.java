package com.hw.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hw.frame.Biz;
import com.hw.vo.User;

@Controller
public class UserController {
      
   @Resource(name="userBiz")
   Biz<User,String> biz;
   
   @RequestMapping("/userlist.do")
   public String list(Model m) {
      // Database에서 데이터를 가지고 온다.
      List<User> list = null;
      list = biz.get();
      m.addAttribute("userlist", list);
      m.addAttribute("center", "user/list");
      return "main";
   }
   @RequestMapping("/useradd.do")
   public String add(Model m) { //u로 받고 m로보냄
      m.addAttribute("center", "user/add");
      return "main";
   }
   @RequestMapping("/useraddimpl.do")
   public String addimpl(Model m,User u) {
      System.out.println("addimpl:"+m);
      biz.register(u);
      m.addAttribute("center", "user/addok");
      return "main";
   }
   @RequestMapping("/userinfo.do")
   public String info(Model m, String id) {
      User user = null;
      user = biz.get(id);
      m.addAttribute("userinfo", user);
      m.addAttribute("center", "user/info");
      return "main";
   }
   @RequestMapping("/userdel.do")
   public String del(Model m, User u) {
      biz.remove(u.getId());
      m.addAttribute("center", "user/del");
      return "main";
   }
   @RequestMapping("/usermod.do")
   public String mod(Model m, User u) {
      System.out.println(u);
      biz.modify(u);
      m.addAttribute("center", "user/mod");
      return "main";
   }
}


