package com.patrickgrimard;

import java.io.IOException;

import org.springframework.boot.context.event.ApplicationEnvironmentPreparedEvent;
import org.springframework.boot.env.PropertySourcesLoader;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.PropertySource;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

@Configuration
public class LoadAdditionalProperties
        implements
            ApplicationListener<ApplicationEnvironmentPreparedEvent> {

    private ResourceLoader loader = new DefaultResourceLoader();
 

    public void onApplicationEvent(ApplicationEnvironmentPreparedEvent event) {
        try {
            Resource resource = loader.getResource("classpath:test.yaml");
            PropertySource<?> propertySource = new PropertySourcesLoader().load(resource);
            event.getEnvironment().getPropertySources().addLast(propertySource);
        } catch (IOException ex) {
            throw new IllegalStateException(ex);
        }
    }
}
