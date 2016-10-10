#!/bin/bash

aws autoscaling detach-load-balancers --auto-scaling-group-name realrabbit --load-balancer-names dmartihawk
 
 aws elb deregister-instances-from-load-balancer --load-balancer-name dmartihawk --instances i-0da5b00478f82a730
 i-0f9678e838323cbd5 i-06d5720cd2d3ad39a

 aws autoscaling delete-auto-scaling-group --auto-scaling-group-name realrabbit --force-delete
 
 aws autoscaling delete-launch-configuration --launch-configuration-name rabbit
 
 aws elb delete-load-balancer-listeners --load-balancer-name dmartihawk --load-balancer-ports 80
 
 aws ec2 terminate-instances --instance-ids i-0da5b00478f82a730 i-0f9678e838323cbd5 i-06d5720cd2d3ad39a
