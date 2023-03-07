package com.yzf.selfqueue.runsql;

import com.yzf.selfqueue.model.ConnectionInfo;
import com.yzf.selfqueue.model.TaskResultSet;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public interface RunQueue {
    public boolean open() throws SQLException, Exception;
    public TaskResultSet run(String sql);
    ArrayList<Object> translate(ResultSet resultSet) throws SQLException;
    public boolean close();
}
