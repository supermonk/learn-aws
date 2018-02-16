package com.patrickgrimard;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * Created by XTL on 8/14/2014.
 */
@Configuration
@ComponentScan
@EnableAutoConfiguration
public class Application {

    public static void main(String[] args) {

        new SpringApplicationBuilder(Application.class).listeners(new LoadAdditionalProperties())
                .run(args);

    }

}
