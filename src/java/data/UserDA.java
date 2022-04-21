/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

import business.Posts;
import business.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author joebe
 */
public class UserDA {

    private static final Logger LOG = Logger.getLogger(UserDA.class.getName());

    public static void insert(User user) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "INSERT INTO `user` (`email`, `username`, `password`, `birthday`)"
                + " VALUES (?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            //set all ? placeholders
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setDate(4, Date.valueOf(user.getBirthday()));
            ps.executeUpdate();
        } catch (SQLException e) {
            //Log the exception and then throw it up to the servlet
            LOG.log(Level.SEVERE, "*** Insert has failed", e);
            throw e;
        } finally {
            //Finally always happens, regardless of try/catch
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** insert null pointer??", e);
                throw e;
            }
        }
    }

    public static LinkedHashMap<Integer, User> selectAll() throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM user";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            User user = null;

            LinkedHashMap<Integer, User> users = new LinkedHashMap();

            while (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                LocalDate birthday = rs.getDate("birthday").toLocalDate();

                user = new User(username, email, password, birthday);
                users.put(id, user);
            }
            return users;
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** select all sql", e);
            throw e;
        } finally {
            try {
                rs.close();
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** select all null pointer??", e);
                throw e;
            }

        }
    }

    public static void update(String email, String password, int id) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "UPDATE `user`"
                + " SET `email` = ?, `password` = ?"
                + " WHERE `user`.`id` = ?";
        try {
            ps = connection.prepareStatement(query);
            //set all ? placeholders
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            //Log the exception and then throw it up to the servlet
            LOG.log(Level.SEVERE, "*** update has failed", e);
            throw e;
        } finally {
            //Finally always happens, regardless of try/catch
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** update null pointer??", e);
                throw e;
            }
        }
    }

    public static Boolean userNameExists(String username) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "SELECT username FROM user"
                + " WHERE username = ?";
        try {
            ps = connection.prepareStatement(query);
            //set all ? placeholders
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            return rs.next();
        } catch (SQLException e) {
            //Log the exception and then throw it up to the servlet
            LOG.log(Level.SEVERE, "*** select username has failed", e);
            throw e;
        } finally {
            //Finally always happens, regardless of try/catch
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** username null pointer??", e);
                throw e;
            }
        }
    }

    public static Boolean emailExists(String email) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "SELECT `email` FROM `user`"
                + " WHERE `user`.`email` = ?";
        try {
            ps = connection.prepareStatement(query);
            //set all ? placeholders
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            return rs.next();
        } catch (SQLException e) {
            //Log the exception and then throw it up to the servlet
            LOG.log(Level.SEVERE, "*** select username has failed", e);
            throw e;
        } finally {
            //Finally always happens, regardless of try/catch
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** username null pointer??", e);
                throw e;
            }
        }
    }

    public static String getUserPassword(String username) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "SELECT `password` FROM `user`"
                + " WHERE `user`.`username` = ?";
        try {
            ps = connection.prepareStatement(query);
            //set all ? placeholders
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            String password = null;
            if (rs.next()) {
                password = rs.getString("password");
            }
            return password;
        } catch (SQLException e) {
            //Log the exception and then throw it up to the servlet
            LOG.log(Level.SEVERE, "*** select username has failed", e);
            throw e;
        } finally {
            //Finally always happens, regardless of try/catch
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** username null pointer??", e);
                throw e;
            }
        }
    }
    
    public static User getUserByUsername(String userName) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "SELECT * FROM `user`"
                + " WHERE `user`.`username` = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            User user = null;
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                LocalDate birthday = rs.getDate("birthday").toLocalDate();

                user = new User(username, email, password, id, birthday);
            }
            return user;
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** select user by username sql", e);
            throw e;
        } finally {
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** select all null pointer??", e);
                throw e;
            }

        }
    }

    public static int getUserId(String username) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "SELECT `id` FROM `user`"
                + " WHERE `user`.`username` = ?";
        try {
            ps = connection.prepareStatement(query);
            //set all ? placeholders
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            int id = 0;
            if (rs.next()) {
                id = rs.getInt("id");
            }
            return id;
        } catch (SQLException e) {
            //Log the exception and then throw it up to the servlet
            LOG.log(Level.SEVERE, "*** select id has failed", e);
            throw e;
        } finally {
            //Finally always happens, regardless of try/catch
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** id null pointer??", e);
                throw e;
            }
        }
    }
    
    public static void insertPost(int userId, String title, String postText, LocalDateTime timeStamp) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "INSERT INTO `posts` (`userId`, `title`, `postText`, `timeStamp`)"
                + " VALUES (?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            //set all ? placeholders
            ps.setInt(1, userId);
            ps.setString(2, title);
            ps.setString(3, postText);
            ps.setTimestamp(4, Timestamp.valueOf(timeStamp));
            ps.executeUpdate();
        } catch (SQLException e) {
            //Log the exception and then throw it up to the servlet
            LOG.log(Level.SEVERE, "*** Post insert has failed", e);
            throw e;
        } finally {
            //Finally always happens, regardless of try/catch
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** insert null pointer??", e);
                throw e;
            }
        }
    }
    
    public static LinkedHashMap<Integer, Posts> getUserPosts(int userId) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        
        Posts post = null;
        LinkedHashMap<Integer, Posts> posts = new LinkedHashMap();

        
        String query
                = "SELECT * FROM `posts`"
                + " WHERE `userId` = ?"
                + " ORDER BY `timeStamp` DESC"
                + " LIMIT 5";
        try {
            ps = connection.prepareStatement(query);
            //set all ? placeholders
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                //id = rs.getInt("id");  
                String title = rs.getString("title");
                String postText = rs.getString("postText");
                LocalDateTime timeStamp = rs.getTimestamp("timeStamp").toLocalDateTime();
                int postId = rs.getInt("postId");

                post = new Posts(title, postText, timeStamp);
                posts.put(postId, post);
            }
            return posts;
        } catch (SQLException e) {
            //Log the exception and then throw it up to the servlet
            LOG.log(Level.SEVERE, "*** select id has failed", e);
            throw e;
        } finally {
            //Finally always happens, regardless of try/catch
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** id null pointer??", e);
                throw e;
            }
        }
    }
}
