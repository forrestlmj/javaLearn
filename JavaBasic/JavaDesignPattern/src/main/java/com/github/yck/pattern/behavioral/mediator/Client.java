package com.github.yck.pattern.behavioral.mediator;

import com.github.yck.pattern.behavioral.mediator.home.HomeCenter;
import com.github.yck.pattern.behavioral.mediator.home.STATES;

public class Client {
    public static void main(String[] args) {
        HomeCenter h = new HomeCenter();
        h.getMessage(STATES.SHOULD_WAKE_UP);
    }
}
