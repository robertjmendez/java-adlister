package dao;

import java.sql.*;

import com.mysql.cj.jdbc.Driver;
import dao.Ads;
import models.Ad;

import javax.servlet.jsp.jstl.core.Config;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {

    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(config.getUrl(), config.getUser(), config.getPassword());
        } catch (SQLException e) {
            throw new RuntimeException("Could not connect to database",e);
        }
    }

    @Override
    public List<Ad> all() {
        List<Ad> ads = new ArrayList<>();
        String selectQuery = "SELECT * FROM ads";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(selectQuery)) {

            while (rs.next()) {
                Ad ad = new Ad(rs.getLong("id"), rs.getLong("user_id"), rs.getString("title"), rs.getString("description"));
                ads.add(ad);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
        return ads;
    }


    @Override
    public Long insert(Ad ad) {
        long result = 0;

        String queryStringAd = "INSERT INTO ads (user_id, title, description) VALUES (" + ad.getUserId() + ",'" +  ad.getTitle() + "','" + ad.getDescription() +"')";

        try {
            Statement stmt = connection.createStatement();
            result = stmt.executeUpdate(queryStringAd, Statement.RETURN_GENERATED_KEYS);
        }catch (Exception e){
            System.out.println(e);
        }
        return result;
    }

}

