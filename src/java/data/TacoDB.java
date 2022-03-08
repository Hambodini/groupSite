package data;

import business.TacoOrder;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import java.sql.*;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;


public class TacoDB {

    private static final Logger LOG = Logger.getLogger(TacoDB.class.getName());
    

    public static void insert(TacoOrder order) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "INSERT INTO tacoorders (orderID, name, num, date) "
                + "VALUES (?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, order.getOrderID());
            ps.setString(2, order.getName());
            ps.setInt(3, order.getNum());
            ps.setDate(4, Date.valueOf(order.getDate()));
            
            ps.executeUpdate();
        } catch (SQLException e) {
            LOG.log(Level.SEVERE, "*** insert sql", e);
            throw e;
            
        } finally {
            try {
                ps.close();
                pool.freeConnection(connection);
            } catch (Exception e) {
                LOG.log(Level.SEVERE, "*** insert null pointer??", e);
                throw e;
            }

           
        }
    }

    public static LinkedHashMap<Integer, TacoOrder> selectAll() throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM tacoorders";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            TacoOrder to = null;
            LinkedHashMap<Integer, TacoOrder> orders = new LinkedHashMap();

            while (rs.next()) {
                
                int id = rs.getInt("orderID");
                String name = rs.getString("name");
                int num = rs.getInt("num");
                LocalDate date = rs.getDate("date").toLocalDate();
                
                to = new TacoOrder(id, num, name, date);
                orders.put(id, to);
            }
            return orders;
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
}
