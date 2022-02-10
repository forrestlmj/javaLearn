package source;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.api.functions.source.RichSourceFunction;

public class HttpSource  {
    public static void main(String[] args) throws Exception {
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
        DataStreamSource<String> source = env.addSource(new RichSourceFunction<String>() {

            @Override
            public void open(Configuration parameters) throws Exception {
                super.open(parameters);

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
