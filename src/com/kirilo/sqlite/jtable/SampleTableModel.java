package com.kirilo.sqlite.jtable;

import javax.swing.table.AbstractTableModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SampleTableModel extends AbstractTableModel {
    private Object[][] data;
    private String[] columnNames;
//    private Class[] columnTypes;

    public SampleTableModel(Connection connection, String tableName) throws SQLException {
//        super();
        getTableContents(connection, tableName);
    }

    private void getTableContents(Connection connection, String tableName) throws SQLException {
        TreeMap<String, Class> columnNameAndType = getColumnNameAndType(connection, tableName);
        columnNames = new String[columnNameAndType.size()];
        columnNameAndType.navigableKeySet().toArray(columnNames);
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from " + tableName);
        List rowList = new ArrayList<>();
        while (resultSet.next()) {
            List cellList = new ArrayList();
            columnNameAndType.forEach((s, aClass) -> {
                Object cellValue = null;
                try {
                    if (aClass == String.class) {
                        String string = resultSet.getString(s);
                        cellValue = string == null ? "" : string;
                        Logger.getLogger(SampleTableModel.class.getName()).log(Level.INFO, "{1}, {2}", new String[]{s, string});
                    } else if (aClass == Integer.class) {
                        cellValue = resultSet.getInt(s);
                    } else if (aClass == Float.class) {
                        cellValue = (float) (resultSet.getDouble(s));
                    } else if (aClass == Double.class) {
                        cellValue = resultSet.getDouble(s);
                    } else if (aClass == Date.class) {
                        cellValue = resultSet.getDate(s);
                    } else {
                        Logger.getLogger(SampleTableModel.class.getName()).log(Level.INFO, s);
                    }
                    cellList.add(cellValue);
                } catch (SQLException e) {
                    Logger.getLogger(SampleTableModel.class.getName()).log(Level.SEVERE, s, e);
                }
            });
            Object[] cells = cellList.toArray();
            rowList.add(cells);
        }
        data = new Object[rowList.size()][];
        for (int i = 0; i < data.length; i++) {
            data[i] = (Object[]) rowList.get(i);
        }
        if (resultSet != null) {
            resultSet.close();
        }
        if (statement != null) {
            statement.close();
        }
    }

    private TreeMap<String, Class> getColumnNameAndType(Connection connection, String tableName) throws SQLException {
        DatabaseMetaData metaData = connection.getMetaData();
        ResultSet resultSet = metaData.getColumns(null, null, tableName, null);
        TreeMap<String, Class> columnNamesTypes = new TreeMap<>();
        while (resultSet.next()) {
            Class clazz;
            switch (resultSet.getInt("DATA_TYPE")) {
                case Types.INTEGER:
                    clazz = Integer.class;
                    break;
                case Types.FLOAT:
                    clazz = Float.class;
                    break;
                case Types.DOUBLE:
                case Types.REAL:
                    clazz = Double.class;
                    break;
                case Types.DATE:
                case Types.TIME:
                case Types.TIMESTAMP:
                    clazz = Date.class;
                    break;
                default:
                    clazz = String.class;
                    break;
            }
            String column_name = resultSet.getString("COLUMN_NAME");
            columnNamesTypes.put(column_name, clazz);
        }

        return columnNamesTypes;
    }

    @Override
    public int getRowCount() {
        return data.length;
    }

    @Override
    public int getColumnCount() {
        if (data.length == 0) {
            return 0;
        } else {
            return data[0].length;
        }
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        return data[rowIndex][columnIndex];
    }

    @Override
    public String getColumnName(int column) {
        return columnNames[column];
    }
}
