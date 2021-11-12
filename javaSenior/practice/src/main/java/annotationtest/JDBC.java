package annotationtest;

public class JDBC {
    @InjectValue("172.0.0.1")
    private String url;
    @InjectValue("3306")
    private int port;
    @InjectValue("root")
    private String userName;
    @InjectValue("123456")
    private String password;

    @Override
    public String toString() {
        return "JDBC{" +
                "url='" + url + '\'' +
                ", port=" + port +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
