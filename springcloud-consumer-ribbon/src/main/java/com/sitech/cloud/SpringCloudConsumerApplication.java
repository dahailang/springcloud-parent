package com.sitech.cloud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.web.client.RestTemplate;

import com.sitech.cloud.config.TestConfiguration;

@SpringBootApplication
@RibbonClient(name = "springcloud-provider-ribbon-random", configuration = TestConfiguration.class)
@ComponentScan(excludeFilters = { @ComponentScan.Filter(type = FilterType.ANNOTATION, value = ExcludeFromComponentScan.class) })
public class SpringCloudConsumerApplication {
	@Bean
	@LoadBalanced //让RestTemplate 具备负载均衡能力
	public RestTemplate restTemplate(){
		return new RestTemplate();
	}
 	
	public static void main(String[] args) {
		SpringApplication.run(SpringCloudConsumerApplication.class, args);
	}
}
