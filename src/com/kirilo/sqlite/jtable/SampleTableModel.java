package com.kirilo.sqlite.jtable;

import javax.swing.table.AbstractTableModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SampleTableModel extends AbstractTableModel {
    private static Connection connection;
    private Object[][] data;
    private String[] columnNames;
    private String tableName;
    //    private Class[] columnTypes;

    public SampleTableModel(Connection connection, String tableName) throws SQLException {
//        super();
        this.connection = connection;
        this.tableName = tableName;
        getTableContents();
    }

    public String getTableName() {
        return tableName;
    }

    private void getTableContents() throws SQLException {
        TreeMap<String, Class> columnNameAndType = getColumnNameAndType();
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

    private TreeMap<String, Class> getColumnNameAndType() throws SQLException {
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

    public boolean updateDB() {
        List<String> list = new ArrayList<>();
        for (int i = 0; i < data.length; i++) {
            Object[] objects = data[i];
            StringBuilder exec = new StringBuilder("update " + tableName + " set ");
            int id = 0;
            for (int j = 0; j < objects.length - 1; j++) {
                if (columnNames[j].equals("id")) {
                    id = (int) objects[j];
                    continue;
                }


                exec.append(columnNames[j]);
                exec.append("='");
                if (!isNotCorrectDescription(objects, exec, j)) {
                    exec.append(objects[j]);
                }
                exec.append("', ");
            }
            exec.append(columnNames[objects.length - 1]);
            exec.append("='");
            exec.append(objects[objects.length - 1]);
            exec.append("' where id=");
            exec.append(id);
            exec.append(";");

            list.add(exec.toString());
        }

        Statement statement = null;
        try {
            statement = connection.createStatement();

            for (String sql : list) {
                try {
                    statement.executeUpdate(sql);

                } catch (SQLException e) {
                    Logger.getLogger(SampleTableModel.class.getName()).log(Level.SEVERE, "Can't execute update!", e);
                    return false;
                } finally {
                    Logger.getLogger(SampleTableModel.class.getName()).log(Level.INFO, sql);
                    if (statement != null) {
                        statement.close();
                    }
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(SampleTableModel.class.getName()).log(Level.SEVERE, "Can't create statement!", e);
            return false;
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(SampleTableModel.class.getName()).log(Level.SEVERE, "Can't close statement!", e);
            }
        }
        return true;
    }

    private boolean isNotCorrectDescription(Object[] objects, StringBuilder exec, int j) {
        if (columnNames[j].equals("description")) {
            String description = (String) objects[j];
            if (description.contains("'")) {
                String[] strings = description.split("'");
                for (int i = 0; i < strings.length - 1; i++) {
                    exec.append(strings[i]);
                    exec.append("''");
                }
                exec.append(strings[strings.length - 1]);
                return true;
            }
        }
        return false;
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
    public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
        data[rowIndex][columnIndex] = aValue;
        fireTableCellUpdated(rowIndex, columnIndex);
    }

    @Override
    public String getColumnName(int column) {
        return columnNames[column];
    }

    @Override
    public boolean isCellEditable(int rowIndex, int columnIndex) {
        if (columnIndex == findColumn("id")) {
            return super.isCellEditable(rowIndex, columnIndex);
        }
        return true;
    }

    //    @Override
    public Integer[] findColumns(String expression) {
        ArrayList<Integer> list = new ArrayList<>();
        for (int i = 0; i < getColumnCount(); i++) {
            String columnName = getColumnName(i);
            if (columnName.contains(expression)) {
                list.add(i);
            }
        }
        return list.toArray(new Integer[list.size()]);
    }
}
