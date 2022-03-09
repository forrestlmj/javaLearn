package source;

import com.sun.net.httpserver.HttpServer;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.api.functions.source.RichSourceFunction;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import util.MyHandler;

import java.net.InetSocketAddress;

public class HttpSource  {
    public static void main(String[] args) throws Exception {
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
        DataStreamSource<String> source = env.addSource(new RichSourceFunction<String>() {
            HttpServer server = HttpServer.create(new InetSocketAddress(8000), 0);

            @Override
            public void open(Configuration parameters) throws Exception {
//                super.open(parameters);
                server.createContext("/test", new MyHandler());
                server.setExecutor(null); // creates a default executor
                server.start();
            }


            @Override
            public void run(SourceContext<String> sourceContext) throws Exception {

            }

            @Override
            public void cancel() {

            }
        });
        source.print();
        env.execute();
    }
}
