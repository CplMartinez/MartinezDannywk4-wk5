#!/bin/bash

aws ec2 run-instances --image-id ami-06b94666 --key-name logic --client-token dm41zk21 --security-group-ids sg-2336e15a --instance-type t2.micro --count 3
 
 aws elb create-load-balancer --load-balancer-name dmcwk4 --listeners 
Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=80 --subnets subnet-cb246bbd

 aws elb create-load-balancer --load-balancer-name dmartihawk --listeners Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=80 --availability-zone us-west-2b
dmartihawk-1323102667.us-west-2.elb.amazonaws.com

aws elb register-instances-with-load-balancer --load-balancer-name dmartihawk --instances i-0f9678e838323cbd5 i-06d5720cd2d3ad39a i-0da5b00478f82a730


aws autoscaling create-launch-configuration --launch-configuration-name rabbit --image-id ami-06b94666 --key-name logic --instance-type t2.micro

aws autoscaling create-auto-scaling-group --auto-scaling-group-name realrabbit --launch-configuration-name rabbit --availability-zones us-west-2b --load-balancer-names dmartihawk --min-size 2 --max-size 5 --desired-capacity 4

