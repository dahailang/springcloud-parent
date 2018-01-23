package com.sitech.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.feign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class SpringCloudFeignClientStater {
 	
	public static void main(String[] args) {
		SpringApplication.run(SpringCloudFeignClientStater.class, args);
	}
}
