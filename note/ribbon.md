1. ribbon 的基本使用
第一步：引入jar 由于eureka依赖ribbon。不用重复引用
第二步：@LoadBalanced 注解让restTemplate 具备负载均衡能力
第三步：restTemplate 调用虚拟ip [VIP virtual IP HAProxy Heartbeat]
	restTemplate.getForObject("http://microservice-provider-user/simple/" + id, 

使用配置文件定义ribbon文件
配置文件  优先于 java代码  优先于默认配置

注意事项：
1. 自定义的ribbonClient 需要注意Spring父子容易问题。两个解决方案 :
	1.创建 @ComponentScan or @SpringBootApplication 扫描不到的包里面比如com.sitech.config
	2.自定义注解
	
ribbon和Eureka连用

##Use Ribbon Without Eureka
1. 没有eureka依赖 直接
#springcloud-provider.ribbon.listOfServers: 172.21.10.184:7903
2. 有eureka依赖
#ribbon.eureka.enabled: false  
#springcloud-provider.ribbon.listOfServers: 172.21.10.184:7903
#springcloud-provider-ribbon-random.ribbon.listOfServers: 172.21.10.184:7901 
