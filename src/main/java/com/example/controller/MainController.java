package com.example.controller;

import com.example.model.Category;
import com.example.model.Post;
import com.example.model.User;
import com.example.repository.CategoryRepository;
import com.example.repository.PostRepository;
import com.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MainController {


    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    PostRepository postRepository;
    @Autowired
    UserRepository userRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "redirect:home";
    }


    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String showCategoryAndPost(ModelMap modelMap) {
        List<Post> postList = postRepository.findDistinctTop2ByOrderByCreatedDateDesc();
        modelMap.addAttribute("postList", postList);
        List<Category> categoryList = categoryRepository.findAll();
        modelMap.addAttribute("categoryList", categoryList);
        return "admin/home";

    }

    @RequestMapping(value = "/home/category/{id}", method = RequestMethod.GET)
    public String showPostsById(@PathVariable("id") int id, ModelMap modelMap) {
        List<Post> postListByCategoryId = postRepository.getAllByCategoryIdOrderByCreatedDateDesc(id);
        modelMap.addAttribute("postList", postListByCategoryId);
        List<Category> categoryList = categoryRepository.findAll();
        modelMap.addAttribute("categoryList", categoryList);
        return "admin/home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "admin/login";

    }

//    @RequestMapping(value = "/login/admin", method = RequestMethod.GET)
//    @ResponseBody
//    public String loginAdmin(@RequestParam("username") String username, @RequestParam("password") String password) {
//        User user = userRepository.findByUsernameAndPassword(username, password);
//        if (user != null)
//            return "redirect:/admin";
//        else
//            return "redirect:/login";
//    }

}