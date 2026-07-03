Documentation on a statefulset App

2026 - JUNE - 8th

Author: Behrouz ShakeriFard

This is a web-based application, consist of a python/flask container, and a PostgreSQL data-base.
The python/flask part runs on port 5004, and PostgreSQL runs on 5432. 

DOCKER

The Docker-Compose file
should include a dedicated network with the name "tasknet". The environment variables are:

DataBase name: taskdb
Username: taskuser
password: junk00

docker network create tasknet

docker run --rm --network tasknet --name task-manager-webapp -p 5004:5004 task-manager-beta:v2026-06-08a 

docker run -d \
  --name postgres-taskdb-cont
  --network tasknet \
  -e POSTGRES_DB=taskdb \
  -e POSTGRES_USER=taskuser \
  -e POSTGRES_PASSWORD=junk00 \
  postgres:latest

Once you have it up and running, you would need to get inside the container, and import the dump:

cat taskdb.sql | docker exec -i taskdb psql -U taskuser -d taskdb

KUBERNETES

For kubernetes deployment, things are a bit more elaborate. You need to:
1. Run the flask pod (alternatively, create a deployment);
2. Create a service (NodePort) for the flask app to be accessible;
3. Create a StatefulSet for the postgres pod - as well as PV and PVC;
4. Create a service (ClusterIP) for communication between the flask app and the databse.

If you choose to utilize the CLI, you may find the following commands useful:

# Create the flask pod
kubectl run flask-pod --image task-manager-beta:v2026-06-08a

# Expose the pod
kubectl expose pod flask-pod --type=NodePort --port=5004 --target-port=5004 --name=flask-service

# Create the postgres pod
kubectl run postgres-pod --image=postgres:latest --image-pull-policy=Never --env="POSTGRES_DB=taskdb" --env="POSTGRES_USER=taskuser" --env="POSTGRES_PASSWORD=junk00"

# Create the service for internal communication
kubectl expose pod postgres-pod --name=postgres-taskdb-cont --port=5432 --target-port=5432

Then you would need to copy the database inside the pod, and initialize it.

# Copy the database
kubectl cp taskdb.sql postgres-pod:/tmp/taskdb.sql

# Initialize it
kubectl exec -it postgres-pod -- psql -U taskuser -d taskdb -f /tmp/taskdb.sql

