package com.yzf.di.util;

import com.yzf.di.entity.FdsMysqlDataDict;
import com.yzf.di.entity.FdsMysqlSource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JDBCUtil{
    private static final String URL = "jdbc:mysql://%s/?user=%s&password=%s";
    private static final String SQL = "select t.TABLE_SCHEMA,t.TABLE_NAME,t.TABLE_COMMENT,t.TABLE_ROWS,c.COLUMN_NAME,c.COLUMN_COMMENT,\n" +
            "       c.DATA_TYPE,c.COLUMN_TYPE from information_schema.TABLES t\n" +
            "left join information_schema.COLUMNS c on c.TABLE_SCHEMA = t.TABLE_SCHEMA\n" +
            "and c.TABLE_NAME = t.TABLE_NAME\n" +
            "where t.TABLE_SCHEMA not in ('information_schema','mysql','performance_schema','sys','retl','BASE TABLE')\n" +
            "and t.TABLE_TYPE = 'BASE TABLE';";

    public List<FdsMysqlDataDict> fetch(FdsMysqlSource fdsMysqlSource){
        List<FdsMysqlDataDict> daos = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            String url = String.format(URL, fdsMysqlSource.getIp(), fdsMysqlSource.getUsername(), fdsMysqlSource.getPassword());
            con = DriverManager.getConnection(url);
            stmt = con.createStatement();
            if (stmt.execute(SQL) ){
                rs = stmt.getResultSet();
                while (rs.next()){
                    FdsMysqlDataDict dao = new FdsMysqlDataDict();
                    dao.setInstance(fdsMysqlSource.getInstance());
                    dao.setMysqlSourceId(fdsMysqlSource.getId());
                    dao.setTableSchema(rs.getString("TABLE_SCHEMA"));
                    dao.setTableName(rs.getString("TABLE_NAME"));
                    dao.setTableComment(rs.getString("TABLE_COMMENT"));
                    dao.setTableRows(rs.getLong("TABLE_ROWS"));
                    dao.setColumnName(rs.getString("COLUMN_NAME"));
                    dao.setColumnComment(rs.getString("COLUMN_COMMENT"));
                    dao.setDataType(rs.getString("DATA_TYPE"));
                    dao.setColumnType(rs.getString("COLUMN_TYPE"));

                    daos.add(dao);
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { } // ignore

                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) { } // ignore

                stmt = null;
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException sqlEx) { } // ignore

                con = null;
            }
            return daos;
        }
    }
}
