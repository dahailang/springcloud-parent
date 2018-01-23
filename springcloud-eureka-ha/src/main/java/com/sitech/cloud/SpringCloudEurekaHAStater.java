package com.sitech.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class SpringCloudEurekaHAStater {
	public static void main(String[] args) {
		SpringApplication.run(SpringCloudEurekaHAStater.class, args);
	}
}
