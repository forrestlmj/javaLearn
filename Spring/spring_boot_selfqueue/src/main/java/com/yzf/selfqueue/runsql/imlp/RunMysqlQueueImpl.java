package com.yzf.selfqueue.runsql.imlp;

import com.yzf.selfqueue.model.ConnectionInfo;
import com.yzf.selfqueue.model.TaskResultSet;
import com.yzf.selfqueue.runsql.RunQueue;

import java.sql.*;
import java.util.ArrayList;

public class RunMysqlQueueImpl extends RunQueueImpl {

    public RunMysqlQueueImpl(ConnectionInfo connectionInfo){
        super(connectionInfo);
        this.connectionInfo = connectionInfo;
    }
    @Override
    public boolean open() throws SQLException,Exception {
        connection = driverManager.getConnection(
                    String.format("jdbc:mysql://%s:%s/%s?setUnicode=true&characterEncoding=utf8&useSSL=false",
                            connectionInfo.getHost(),
                            connectionInfo.getPort().toString(),
                            connectionInfo.getDatabase()),
                    connectionInfo.getUser(),
                    connectionInfo.getPassword());
        statement = connection.createStatement();
        return true;
    }

}
