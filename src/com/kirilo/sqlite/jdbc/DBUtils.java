package com.kirilo.sqlite.jdbc;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBUtils {
    private static Connection connection;
    private static ResultSet resultSet;
    private static Statement statement;
    private static PreparedStatement preparedStatement;

    public static void openConnection(String path) {
        try {
            Driver driver = (Driver) Class.forName("org.sqlite.JDBC").newInstance();
            if (connection == null) {
                connection = DriverManager.getConnection("jdbc:sqlite:" + path);
            }

        } catch (InstantiationException | ClassNotFoundException | SQLException | IllegalAccessException e) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, path, e);
        }
    }

    public static List<DirObject> getResultList(String request) {
        Set<DirObject> dirObjects = new HashSet<>();
        try {
            if (statement == null) {
                statement = connection.createStatement();
            }

            resultSet = statement.executeQuery(request);

            while (resultSet.next()) {

                dirObjects.add(new DirObject(
                        resultSet.getInt("id"),
                        resultSet.getString("name_en"),
                        resultSet.getString("name_ua")
                ));
            }

        } catch (SQLException e) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, request, e);
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, "Can't close", e);
            }

        }
        return new ArrayList<>(
                dirObjects
        );
    }

    public static void closeConnection() {
        try {
            if (statement != null) {
                statement.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            Logger.getLogger(Start.class.getName()).log(Level.SEVERE, "Can't close", e);
        }
    }

    public static void showPreparedStatement() {
        try {
            preparedStatement = connection.prepareStatement("select * from dir_Make where name_en = ? or name_ua = ?");
            preparedStatement.setString(1, "FIAT");
            preparedStatement.setString(2, "Honda");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Logger.getLogger(DBUtils.class.getName()).log(Level.INFO, "{0}, {1}", new String[]{resultSet.getString("name_en"), resultSet.getString("name_ua")});
            }
            if (resultSet != null) {
                resultSet.close();
            }
        } catch (SQLException e) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, e);
        }

    }
}
