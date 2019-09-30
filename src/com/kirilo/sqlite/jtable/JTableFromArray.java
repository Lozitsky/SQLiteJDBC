package com.kirilo.sqlite.jtable;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.io.IOException;
import java.net.URI;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JTableFromArray {
    private static Object[] columnNames = {"First Name", "Middle Name", "Last Name", "Mail"};
    private static Object[][] rowData = {
            {"Jon", "Andrew", "Brown", "jon_brown@gmail.com"},
            {"Ann", "Clair", "Brook", "ann_brook@gmail.com"},
            {"Ronnie", "D.", "Anderson", "ronnie_anderson@gmail.com"},
            {"Frank", "Finn", "Hill", "frank_hill@gmail.com"},
            {"Robert", "M.", "Furlan", "robert_furlan@gmail.com"},
            {"Betty", "Grace", "Johnson", "betty_johnson@gmail.com"},
            {"Broncho", "Billy", "Anderson", "broncho_anderson@gmail.com"},
            {"William", "Lemuel", "Boyd", "william_boyd@gmail.com"},
            {"John", "Drew", "Barrymore", "john_barrymore@gmail.com"},
            {"Lauren", "Shuler", "Donner", "lauren_donner@gmail.com"},
            {"Susan", "Ann", "Chang", "susan_chang@gmail.com"}
    };

    public static void main(String[] args) {
        JFrame frame = new JFrame("Data from array example");
        frame.getContentPane().setLayout(new FlowLayout());
        frame.setSize(400, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        JTable table = new JTable(rowData, columnNames);
        table.setDefaultRenderer(Object.class, new SampleTableRenderer());
        table.addMouseListener(new MouseAdapter(){
            @Override
            public void mouseClicked(MouseEvent e) {
                if (e.getClickCount() == 1) {
                    JTable table = (JTable) e.getSource();
                    String string = table.getValueAt(table.getSelectedRow(), table.getSelectedColumn()).toString();
                    if (string.contains("@")) {
                        try {
                            Desktop.getDesktop().mail(URI.create("mailto:"+string+"?SUBJECT=Mail%20for%20job&body=mail%20text"));
                        } catch (IOException ex) {
                            Logger.getLogger(JTableFromArray.class.getName()).log(Level.SEVERE, string, e);
                        }
                    }
                }
            }
        });

        table.addMouseMotionListener(new MouseMotionAdapter(){
            @Override
            public void mouseMoved(MouseEvent e) {
                JTable table = (JTable) e.getSource();
                if (table.columnAtPoint(e.getPoint()) == 3) {
                    table.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
                } else {
                    table.setCursor(Cursor.getDefaultCursor());
                }
            }
        });
        JScrollPane scrollPane = new JScrollPane(table);
        table.setPreferredScrollableViewportSize(new Dimension(400, 150));
        frame.getContentPane().add(scrollPane);
        frame.setVisible(true);
    }


}
