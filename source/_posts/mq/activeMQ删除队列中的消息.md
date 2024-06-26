---
title: activeMQ删除队列中的消息
tags: 编程相关
abbrlink: 63add551
date: 2022-08-11 14:38:38
---

```java


public void removeMessage(String queuesName, String messageId)
            throws Exception {
        String jmsUrl="192.168.14.152:11099"
        String url = String.format("service:jmx:rmi:///jndi/rmi://%s/jmxrmi", jmsUrl);
        JMXServiceURL urls = new JMXServiceURL(url);

        JMXConnector connector = JMXConnectorFactory.connect(urls, null);
        connector.connect();
        MBeanServerConnection conn = connector.getMBeanServerConnection();

       
        ObjectName name = new ObjectName("myDomain:brokerName=localhost,type=Broker");
        BrokerViewMBean mBean = (BrokerViewMBean) MBeanServerInvocationHandler.newProxyInstance
                (conn, name, BrokerViewMBean.class, true);

        for (ObjectName na : mBean.getQueues()) {
            QueueViewMBean queueBean = (QueueViewMBean)
                    MBeanServerInvocationHandler.newProxyInstance
                            (conn, na, QueueViewMBean.class, true);


            if (queueBean.getName().equals(queuesName)) {
                queueBean.removeMessage(messageId);
                break;
            }

//            System.out.println("******************************");
//            System.out.println("队列的名称：" + queueBean.getName());
//            System.out.println("队列中剩余的消息数：" + queueBean.getQueueSize());
//            System.out.println("消费者数：" + queueBean.getConsumerCount());
//            System.out.println("消息入队的数量：" + queueBean.getEnqueueCount());
//            System.out.println("消息出队的数量：" + queueBean.getDequeueCount());
        }

    }
```

 修改mq配置 


 bin/env

 ```
 ACTIVEMQ_SUNJMX_START="$ACTIVEMQ_SUNJMX_START -Dcom.sun.management.jmxremote -Djava.rmi.server.hostname=192.168.14.152"
ACTIVEMQ_OPTS="$ACTIVEMQ_OPTS -Djava.rmi.server.hostname=192.168.14.152 -Dcom.sun.management.jmxremote.port=11099 -Dcom.sun.management.jmxremote.rmi.port=11099 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false "
 ```


activemq.xml
 ```
 <broker xmlns="http://activemq.apache.org/schema/core" schedulePeriodForDestinationPurge="30000"  useJmx="true"  brokerName="localhost" dataDirectory="${activemq.data}">
 ```


 ## 发送消息
 ```java
            Session session = null;
            Connection connection = null;
            MessageProducer producer = null;

            ConnectionFactory connectionFactory =
                    new ActiveMQConnectionFactory(aqUrl);
            connection = connectionFactory.createConnection();
            connection.start();
            session = connection.createSession(false,
                    Session.AUTO_ACKNOWLEDGE);
            Destination destination = session.createQueue(queueName);
            producer = session.createProducer(destination);
            TextMessage message = session.createTextMessage();
            message.setText(messageContent);
            message.setJMSReplyTo(destination);
            producer.send(destination, message);

            producer.send(message);

            return message.getJMSMessageID();
 ```