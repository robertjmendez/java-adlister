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
        String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
        long insertedID = 0;
        try (PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());

            int updateCount = stmt.executeUpdate();

            if (updateCount == 0) {
                throw new SQLException("Creating ad failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    insertedID = generatedKeys.getLong(1);
                } else {
                    throw new SQLException("Creating ad failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
        return insertedID;
    }

}

