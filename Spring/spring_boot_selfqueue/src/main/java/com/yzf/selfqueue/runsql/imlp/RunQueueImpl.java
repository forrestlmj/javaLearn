package com.yzf.selfqueue.runsql.imlp;

import com.yzf.selfqueue.model.ConnectionInfo;
import com.yzf.selfqueue.model.TaskResultSet;
import com.yzf.selfqueue.runsql.RunQueue;

import java.sql.*;
import java.util.ArrayList;

public class RunQueueImpl implements RunQueue {
    protected DriverManager driverManager;
    protected Connection connection;
    protected Statement statement;
    protected ConnectionInfo connectionInfo;
    protected Integer maxReturnRowNumbers;
    public RunQueueImpl(ConnectionInfo connectionInfo){
        this.connectionInfo = connectionInfo;
    }
    @Override
    public boolean open() throws SQLException, Exception {
        return true;
    }
    @Override
    public TaskResultSet run(String sql)  {
        TaskResultSet taskResultSet = new TaskResultSet();
        ResultSet resultSet = null;
        try {
            resultSet = statement.executeQuery(sql);
            taskResultSet.setSucceed(true);
            taskResultSet.setInfo("执行成功");
            ArrayList<Object> re = translate(resultSet);
            taskResultSet.setResultCount((long) re.size());

            taskResultSet.setContent(re);
        } catch (SQLException e) {
            taskResultSet.setSucceed(false);
            taskResultSet.setInfo(e.getMessage());
        }
        return taskResultSet;

    }
    @Override
    public ArrayList<Object> translate(ResultSet resultSet) throws SQLException {
        ArrayList<Object> arrayList = new ArrayList<>();
        ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
        resultSetMetaData.getColumnCount();
        ArrayList<String> fields = new ArrayList<>();
        for(int i = 1; i<resultSetMetaData.getColumnCount()+1; i++){
            fields.add(resultSetMetaData.getColumnName(i));
        }
        arrayList.add(fields);
        while (resultSet.next()){

            ArrayList<String> row = new ArrayList<>();
            for(int i = 1;i<fields.size()+1;i++){
                row.add(resultSet.getString(i));
            }
            arrayList.add(row);
        }
        resultSet.close();
        return arrayList;
    }
    @Override
    public boolean close(){
        try {
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
