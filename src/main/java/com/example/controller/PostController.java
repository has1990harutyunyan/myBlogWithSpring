package com.example.controller;

import com.example.model.Post;
import com.example.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

@Controller
public class PostController {
    @Autowired
    PostRepository postRepository;

    @RequestMapping(value = "/admin/add/post", method = RequestMethod.POST)
    public String addPost(@ModelAttribute("post") Post post, @RequestParam("image") MultipartFile image) throws IOException {
        File file = new File("E:\\myBlogWithSpring\\");
        if (!file.exists()) {
            file.mkdir();
        }
        String fileName = System.currentTimeMillis() + "_" + image.getOriginalFilename();

        File f = new File(file.getAbsolutePath() + "\\" + fileName);
        BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(f));
        out.write(image.getBytes());
        out.close();
        post.setCoverImage(fileName);
        postRepository.save(post);
        return "redirect:/admin";
    }


    @ResponseBody
    @RequestMapping(value = "/getImage", method = RequestMethod.GET)
    public byte[] getCoverImage(@RequestParam("imageName") String imageName) throws IOException {
        InputStream inputStream = new FileInputStream("E:\\myBlogWithSpring\\" + imageName);
        return org.apache.commons.io.IOUtils.toByteArray(inputStream);
    }
}
