package com.github.yck.pattern.behavioral.statefulbehaivor.mediator.home;

import com.github.yck.pattern.behavioral.statefulbehaivor.mediator.home.HomeCenter;
import com.github.yck.pattern.behavioral.statefulbehaivor.mediator.home.STATES;

public class Client {
    public static void main(String[] args) {
        HomeCenter h = new HomeCenter();
        h.getMessage(STATES.SHOULD_WAKE_UP);
    }
}
