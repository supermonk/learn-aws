package com.patrickgrimard;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.scheduling.concurrent.ConcurrentTaskExecutor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by XTL on 8/14/2014.
 */

@RestController
public class WidgetController {

    static Random r = new Random();

    @Autowired
    private AttestationInterceptorConf conf;
     
    @RequestMapping(value = "/api", method = RequestMethod.GET, produces = {
            MediaType.APPLICATION_JSON_VALUE}, consumes = MediaType.APPLICATION_JSON_VALUE)
    public Widget index() {
        
        
//        Random random = new Random();
//
//        for (int i = 0; i < 2; i++) {
//            Integer number = random.nextInt(10);
//            FactorialCalculator calculator = new FactorialCalculator(number);
//        }
        System.out.println(conf.getAttestationUrl());
        return new Widget(conf.getAttestationUrl(), 0, 0);
    }

    @RequestMapping(value = "/api2", method = RequestMethod.POST, produces = {
            MediaType.APPLICATION_JSON_VALUE}, consumes = MediaType.APPLICATION_JSON_VALUE)
    public Widget index2() {
        return new Widget(null, 0, 0);
    }

    static ConcurrentTaskExecutor executor =
            new ConcurrentTaskExecutor(Executors.newFixedThreadPool(3));

    @RequestMapping(value = "/api3", method = RequestMethod.GET, produces = {
            MediaType.APPLICATION_JSON_VALUE}, consumes = MediaType.APPLICATION_JSON_VALUE)
    public Widget index3() {
        List<Future<Integer>> resultList = new ArrayList<>();

        Random random = new Random();

        for (int i = 0; i < 2; i++) {
            Integer number = random.nextInt(10);
            FactorialCalculator calculator = new FactorialCalculator(number);
            Future<Integer> result = executor.submit(calculator);
            resultList.add(result);
        }

        for (Future<Integer> future : resultList) {
            try {
                System.out.println("Future result is - " + " - " + future.get()
                        + "; And Task done is " + future.isDone());
            } catch (InterruptedException | ExecutionException e) {
                e.printStackTrace();
            }
        }
        return new Widget(null, 0, 0);
    }
}
