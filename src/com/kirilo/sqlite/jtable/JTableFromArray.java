package com.kirilo.sqlite.jtable;

import javax.swing.*;
import java.awt.*;

public class JTableFromArray {
    private static Object[] columnNames = {"First Name", "Middle Name", "Last Name"};
    private static Object[][] rowData = {
            {"Jon", "Andrew", "Brown"},
            {"Ann", "Clair", "Brook"},
            {"Ronnie", "D.", "Anderson"},
            {"Frank", "Finn", "Hill"},
            {"Robert", "M.", "Furlan"},
            {"Betty", "Grace", "Johnson"},
            {"Broncho", "Billy", "Anderson"},
            {"William", "Lemuel", "Boyd"},
            {"John", "Drew", "Barrymore"},
            {"Lauren", "Shuler", "Donner"},
            {"Susan", "Ann", "Chang"}
    };

    public static void main(String[] args) {
        JFrame frame = new JFrame("Data from array example");
        frame.getContentPane().setLayout(new FlowLayout());
        frame.setSize(400, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JTable table = new JTable(rowData, columnNames);
        JScrollPane scrollPane = new JScrollPane(table);
        table.setPreferredScrollableViewportSize(new Dimension(400, 150));
        frame.getContentPane().add(scrollPane);
        frame.setVisible(true);
    }


}
