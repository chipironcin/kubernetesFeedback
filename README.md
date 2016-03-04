# kubernetesFeedback
This repo holds the necessary files to build a Docker container.
This container will run a very simple command line feedback application intended to collect feedback about the Bitnami Kubernetes Workshop that will take place on March 4th, 2016 in Seville.

The docker image is already built and ready to use from [DockerHub repo](https://hub.docker.com/r/chipironcin/kubernetesfeedback/).

##Quick instructions
###Run in Docker
```
docker run -d --name myFeedback chipironcin/feedbackappclient
docker logs myFeedback
docker exec -it myFeedback feedbackScript.sh
```

###Run in Kubernetes
```
kubectl run myFeedback --image=chipironcin/feedbackappclient
kubectl get logs myFeedback
kubectl exec myFeedback feedbackScript.sh
```
