/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 *
 * @author nosam
 */
public class Posts implements Serializable {
    private int postId, userId;
    private String title, postText, username, commentText;
    private LocalDateTime timeStamp;

    public Posts() {
    }
    
    // constructor for posts
    public Posts(String title, String postText, LocalDateTime timeStamp) {
        this.title = title;
        this.postText = postText;
        this.timeStamp = timeStamp;
    }
    
    // contructor for comments
    public Posts(int userId, int postId, String username, String commentText, LocalDateTime timeStamp) {
        this.userId = userId;
        this.postId = postId;
        this.username = username;
        this.commentText = commentText;
        this.timeStamp = timeStamp;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPostText() {
        return postText;
    }

    public void setPostText(String postText) {
        this.postText = postText;
    }

    public LocalDateTime getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(LocalDateTime timeStamp) {
        this.timeStamp = timeStamp;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }
    
    
}
