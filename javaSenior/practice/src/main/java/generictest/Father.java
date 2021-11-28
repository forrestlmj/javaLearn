package generictest;

public class Father <T>{
    public T getInfo() {
        return info;
    }

    public Father(T info) {
        this.info = info;
    }

    @Override
    public String toString() {
        return "Father{" +
                "info=" + info +
                '}';
    }

    public void setInfo(T info) {
        this.info = info;
    }

    private T info;

}
