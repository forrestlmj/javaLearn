package source;

import com.sun.net.httpserver.HttpContext;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;
import org.apache.flink.api.common.state.ListState;
import org.apache.flink.api.common.state.ListStateDescriptor;
import org.apache.flink.api.common.state.MapStateDescriptor;
import org.apache.flink.api.common.state.StateTtlConfig;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.functions.source.RichSourceFunction;
import util.MyHandler;
import org.apache.flink.api.common.time.Time;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;

public class HttpSource2 extends RichSourceFunction<String>   {
    HttpServer server;
    ListState<String> FIFOQueryState;
    @Override
    public void open(Configuration parameters) throws Exception {
//        super.open(parameters);
        server = HttpServer.create(new InetSocketAddress(8000), 0);
        HttpContext context = server.createContext("/test", new Myhandler2());
        server.setExecutor(null); // creates a default executor
        server.start();
        StateTtlConfig queryStateConfig = StateTtlConfig
                .newBuilder(Time.seconds(2))
                .setUpdateType(StateTtlConfig.UpdateType.OnReadAndWrite)
                .setStateVisibility(StateTtlConfig.StateVisibility.ReturnExpiredIfNotCleanedUp)
                .build();

        ListStateDescriptor<String> queryStateDescriptor = new ListStateDescriptor<String>(
                "history", String.class
        );
        // enable过期时间策略
        queryStateDescriptor.enableTimeToLive(queryStateConfig) ;
        FIFOQueryState = getRuntimeContext().getListState(queryStateDescriptor);
    }
    class Myhandler2 implements HttpHandler{

        @Override
        public void handle(HttpExchange httpExchange) throws IOException {
//            OutputStream responseBody = httpExchange.getResponseBody();
            String s = "responseBody.toString()";
            System.out.println(s);
            try {
                FIFOQueryState.add(s);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    @Override
    public void run(SourceContext<String> ctx) throws Exception {

    }

    @Override
    public void cancel() {

    }
}
