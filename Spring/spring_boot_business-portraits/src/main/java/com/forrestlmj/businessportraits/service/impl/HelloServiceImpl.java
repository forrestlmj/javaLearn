package com.forrestlmj.businessportraits.service.impl;

import com.forrestlmj.businessportraits.service.HelloService;
import org.springframework.stereotype.Service;

@Service
public class HelloServiceImpl implements HelloService {
    @Override
    public String sayHi() {
        return "Hi,This is Business Portraits.";
    }
}
