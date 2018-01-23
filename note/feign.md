1. feign声明式webservice客户端
2. jax-rs 是java api for rest service 是一个标准入门参考jersey 或者cxf
3. jax-ws 

springcloud 为feign添加springMVC注解==扩展feign支持springmvc注解
springcloud 整合了ribbon和erueka 使用feign


feign 开源地址：
使用要点：
1. 统一注解
2. 接口  

使用feign过程中的两个坑
1. GetMapping不支持
2. @PathVariable得设置value
3. @FeignClient("")接口中方法请求参数如果为对象 则RequestMethod 必为POST写成GET也无用


#覆写Feign的默认配置
@FeignClient(name="",configuration=FooConfiguration.class)

注意：spring的父子容器问题的，两种处理方法


@FeignClient(name="",url="") 有url属性则 name属性变为必须的


feign 日志控制
