package com.example.controller;

import com.example.model.Category;
import com.example.model.Post;
import com.example.repository.CategoryRepository;
import com.example.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import java.util.List;

@Controller
public class AdminController {
    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    PostRepository postRepository;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(ModelMap modelMap) {
        List<Post> postList = postRepository.findAll();
        modelMap.addAttribute("postList", postList);
        List<Category> categoryList = categoryRepository.findAll();
        modelMap.addAttribute("categoryList", categoryList);
        return "admin/admin";
    }

    @RequestMapping(value = "/admin/delete/post/{id}", method = RequestMethod.GET)
    public String deletePost(@PathVariable("id") int id) {
        postRepository.delete(id);
        postRepository.flush();
        return "redirect:/admin";

    }


}
