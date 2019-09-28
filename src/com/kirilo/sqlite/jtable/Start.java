package com.kirilo.sqlite.jtable;

import javax.swing.*;
import java.sql.Connection;
import java.sql.SQLException;

public class Start {
    public static void main(String[] args) {
        Connection connection = SQLiteConnection.getConnection();
        try {
//            SampleTableModel dir_model = new SampleTableModel(connection,"dir_Model");
            SampleTableModel dir_model = new SampleTableModel(connection,"CarAllInfo");
            JTable table = new JTable(dir_model);
            table.setDefaultRenderer(Object.class, new SampleTableRenderer());
            JScrollPane scrollPane = new JScrollPane(table, ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED, ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED);

            JFrame frame = new JFrame("LCarAllInfooad data to JTable");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.getContentPane().add(scrollPane);
            frame.pack();
            frame.setVisible(true);
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
