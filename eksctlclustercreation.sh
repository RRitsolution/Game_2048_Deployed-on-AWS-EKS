#!/bin/bash
##EKS Cluster setup:-
eksctl create cluster --name production-eks --nodegroup-name production-nodes --node-type t2.medium --nodes 3 --nodes-min 2 --nodes-max 10 --region us-east-1 --managed
kubectl get nodes
eksctl utils associate-iam-oidc-provider --cluster production-eks --approve --region us-east-1
curl -o iam_policy.json   https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json
aws iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://iam_policy.json
eksctl create iamserviceaccount --cluster production-eks --namespace kube-system --name aws-load-balancer-controller --attach-policy-arn arn:aws:iam::631844602603:policy/AWSLoadBalancerControllerIAMPolicy --override-existing-serviceaccounts --region us-east-1 --approve
