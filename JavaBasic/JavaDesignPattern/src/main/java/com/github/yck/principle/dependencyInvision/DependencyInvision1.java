package com.github.yck.principle.dependencyInvision;

public class DependencyInvision1 {
    public static void main(String[] args) {
        Person p = new Person();
        p.getMessageFromEmail(new Email());
        p.getMessageFromWechat(new Wechat());
    }
}
class Email{
    String getInfo(){return "This message is from email.";}
}
class Wechat{
    String getInfo(){return "This message is from wechat";}
}
class Person{
    void getMessageFromEmail(Email e){e.getInfo();}
    void getMessageFromWechat(Wechat e){e.getInfo();}
}