# kubernetesFeedback
This repo holds the necessary files to build a Docker container.
This container will run a very simple command line feedback application intended to collect feedback about the Bitnami Kubernetes Workshop that will take place on March 4th, 2016 in Seville.

The docker image is already built and ready to use from [DockerHub repo](https://hub.docker.com/r/chipironcin/kubernetesfeedback/).

## Quick instructions
### Run in Docker
```
docker run -d --name myfeedback chipironcin/kubernetesfeedback
docker logs myfeedback
docker exec -it myfeedback ./feedbackScript.sh
```

### Run in Kubernetes
```
kubectl run myfeedback<your_name> --image=chipironcin/kubernetesfeedback
kubectl get pods | grep myfeedback<your_name>
kubectl logs <your_pod_name>
kubectl exec <your_pod_name> ./feedbackScript.sh
```
