package com.yzf.raphael.services.impl;

import com.yzf.raphael.comm.FpType;
import com.yzf.raphael.dao.ReceiptAnalysisDetailDao;
import com.yzf.raphael.model.ReceiptAnalysisDetail;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigInteger;
import java.util.List;

import static org.junit.Assert.*;
@SpringBootTest
@RunWith(SpringRunner.class)
public class DetailManagementInfoInputServiceTest {

    @Autowired
    private DetailManagementInfoInputService detailManagementInfoInputService;
    @Test
    public void getReceiptAnalysisDetail1() {
        List<ReceiptAnalysisDetailDao> r = detailManagementInfoInputService.getReceiptAnalysisDetail(new BigInteger("714800799734497280"),2019,2020, FpType.sum_amt.toString());
        System.out.println(r);
    }
    @Test
    public void getReceiptAnalysisDetail2() {
        List<ReceiptAnalysisDetailDao> r = detailManagementInfoInputService.getReceiptAnalysisDetail(new BigInteger("714800799734497280"),2018,2020, FpType.sum_amt.toString());
        System.out.println(r);

    }
    @Test
    public void getReceiptAnalysisDetail3() {
        List<ReceiptAnalysisDetailDao> r = detailManagementInfoInputService.getReceiptAnalysisDetail(new BigInteger("714800799734497280"),2021,2020, FpType.sum_amt.toString());
        System.out.println(r);

    }
    @Test
    public void getReceiptAnalysisDetail4() {
        List<ReceiptAnalysisDetailDao> sum_amt = detailManagementInfoInputService.getReceiptAnalysisDetail(new BigInteger("714800799734497280"),2019,2020, FpType.sum_amt.toString());
        System.out.println(sum_amt);
        List<ReceiptAnalysisDetailDao> red_amt = detailManagementInfoInputService.getReceiptAnalysisDetail(new BigInteger("714800799734497280"),2019,2020, FpType.red_amt.toString());
        System.out.println(red_amt);
        List<ReceiptAnalysisDetailDao> void_amt = detailManagementInfoInputService.getReceiptAnalysisDetail(new BigInteger("714800799734497280"),2019,2020, FpType.void_amt.toString());
        System.out.println(void_amt);
    }
}