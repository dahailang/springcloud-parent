package com.sitech.cloud;


/**
 * 处理父子容器：
 * 1.自定义例外标签
 * 2.对应类上标注解
 * 3.在StarterApplication里面：@ComponentScan(excludeFilters = { @ComponentScan.Filter(type = FilterType.ANNOTATION, value = ExcludeFromComponentScan.class) })
 */
public @interface ExcludeFromComponentScan {

}
