package enumtest;

public enum Status {
    RUNNING("RUNNING","Thread is running."),
    READY("READY","Thread is ready."),
    STOP("STOP","Thread is stop."),
    BROKEN("BROKEN","Thread is broken."),
    TERMINATED("TERMINATED","Thread is terminated.")
    ;

    private String name;

    public String getName() {
        return name;
    }

    public String getDesc() {
        return desc;
    }

    private String desc;

    Status(String name, String desc) {
        this.name = name;
        this.desc = desc;
    }
}
