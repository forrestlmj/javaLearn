package util;

import java.net.InetSocketAddress;

import com.sun.net.httpserver.HttpServer;

/**
 * https://stackoverflow.com/questions/3732109/simple-http-server-in-java-using-only-java-se-api
   打开浏览器：
 */
public class ServiceTest {

    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8000), 0);
        server.createContext("/test", new MyHandler());
        server.setExecutor(null); // creates a default executor
        server.start();
    }


}