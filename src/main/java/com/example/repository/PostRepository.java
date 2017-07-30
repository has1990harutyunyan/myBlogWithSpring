package com.example.repository;

import com.example.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {
    //    @Query("select p from Post p order by p.createdDate desc")
//    List<Post> getAllPosts();
    List<Post> findDistinctTop2ByOrderByCreatedDateDesc();

    List<Post> getAllByCategoryIdOrderByCreatedDateDesc(int categoryId);
//     List<Post> findByCategoryId(long categoryId);



}
