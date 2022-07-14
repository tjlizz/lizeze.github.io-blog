---
title: RestControllerAdvice返回String时异常
date: 2022-07-14 09:55:18
tags:
     - java
     - springboot
---



```java


@RestControllerAdvice(value = "cn.xx996")
public class CommonResponseDataAdvice implements ResponseBodyAdvice<Object> {
    @Override
    public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object o, MethodParameter returnType, MediaType selectedContentType, Class<? extends HttpMessageConverter<?>> selectedConverterType, ServerHttpRequest request, ServerHttpResponse serverHttpResponse) {

        CommonResponse<Object> response = new CommonResponse<>("", 0);

        if (null == o) {
            return response;
        } else if (o instanceof CommonResponse) {
            response = (CommonResponse<Object>) o;
        } else if (o instanceof String) {

            //返回是String类型时，单独处理。转换成JSON字符串即可
            response.setData(o);
            return JSON.toJSONString(response);
        } else {
            response.setData(o);
        }

        return response;

    }
}




```