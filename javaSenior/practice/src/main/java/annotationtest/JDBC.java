package annotationtest;

public class JDBC {
    @InjectValue("172.0.0.1")
    private String url;
    @InjectValue("3306")
    private int port;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

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
