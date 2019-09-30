package com.kirilo.sqlite.jtable;

import javax.swing.*;
import javax.swing.table.TableRowSorter;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.logging.Level;
import java.util.logging.Logger;

import static com.kirilo.sqlite.jtable.SQLiteConnection.*;

public class JTableEditDB {

    private static final String CAR_ALL_INFO = "CarAllInfo";
    private static final String DIR_MODEL = "dir_Model";
    private static final String CAR = "Car";
    private static final String SALE = "Sale";

    public static void main(String[] args) {
//        Connection connection = SQLiteConnection.getConnection();
        try {
//            SampleTableModel model = new SampleTableModel(connection,"dir_Model");
            SampleTableModel model = new SampleTableModel(getConnection(), SALE);
            JTable table = new JTable(model);
            TableRowSorter<SampleTableModel> sorter = new TableRowSorter<>(model);
//            Comparator<Object> comparator = (o1, o2) -> (double) o1 > (double) o2 ? 1 : ((double)o1 == (double)o2) ? 0 : -1;
            Comparator<Object> comparingDouble = Comparator.comparingDouble(o -> (float) o);
            Comparator<Object> comparingInt = Comparator.comparingInt(value -> (int) value);
            sorter.setComparator(model.findColumn("id"), comparingInt);
            Integer[] ids = model.findColumns("_id");
            for (int i = 0; i < ids.length; i++) {
                sorter.setComparator(ids[i].intValue(), comparingInt);
            }
//            sorter.setComparator(10, comparingDouble);
            table.setRowSorter(sorter);
            table.setDefaultRenderer(Object.class, new SampleTableRenderer());
            JScrollPane scrollPane = new JScrollPane(table, ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED, ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED);

            JFrame frame = new JFrame("download data to JTable");
            frame.setSize(900, 400);
            frame.setLocationRelativeTo(null);
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            JPanel panel = new JPanel();
            JButton upload = new JButton("Upload to database");
            panel.add(upload);
            panel.add(scrollPane);
            frame.getContentPane().add(panel);
            frame.addWindowStateListener(new WindowAdapter(){
                @Override
                public void windowClosed(WindowEvent e) {
                    SQLiteConnection.closeConnection();
                }
            });

            upload.addActionListener(e -> {
                if (model.updateDB()) {
                    JOptionPane.showMessageDialog(null,"data update successful!");
                } else {
                    JOptionPane.showMessageDialog(null,"error during update!");
                }
            });

/*            table.getModel().addTableModelListener(e -> {
                TableModel tableModel = (TableModel) e.getSource();
            });*/

            frame.pack();
            frame.setVisible(true);
//            connection.close();
//            closeConnection();
        } catch (SQLException e) {
            Logger.getLogger(JTableEditDB.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
