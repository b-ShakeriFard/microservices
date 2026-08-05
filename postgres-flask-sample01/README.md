Author: Behrouz ShakeriFard <br>
Contact: bshakeri@torontomu.ca <br>
Date: November 8th, 2025

UPDATED
second iteration: July 2026


This is a sample web-based application designed for demonstrating deployment of a statefulset app on kubernetes.
Microservices: flask (front-end) + PostgreSQL (back-end)

ARCHITECTURE:

```mermaid
flowchart TB
    User["User / Web Browser"]

    subgraph K3S["Kubernetes Cluster"]
        direction TB

        subgraph NS["Namespace: name-db-lab"]
            direction TB

            NodePort["NodePort Service - Port: 30100"]

            Flask["Flask Application Pod<br/>fp-name-db-app<br/>Port: 5004"]

            Headless["PostgreSQL Headless Service"]

            PostgreSQL[("PostgreSQL Pod<br/>Port: 5432")]

            NodePort -->|"targetPort: 5004"| Flask
            Flask -->|"Database connection: 5432"| Headless
            Headless -->|"DNS discovery"| PostgreSQL
        end
    end

    User -->|"HTTP<br/>Node-IP:30100"| NodePort
```

<hr>

Data is retrieved from a CSV file, and initialized via a simple init.sql script.

There are two services: 
Headless service for the PostgreSQL stateful - port 5432, 
NodePort service for flask - port 5004.

<hr>

Kubernetes manifest files: 

- flask deployment,
- flask Nodeport service,
- PV (persistent volume),
- NameSpace
- PostgreSQL statefulset,
- PostgreSQL Headless service,
- PostgreSQL PVC 
- ConfigMap and Secret, for allowing flask to access the database.

<hr>

<h3> 
App info: </h3>

- NameSpace: name-db-lab

- App-name: fp-name-db-app

- PostgreSQL Headless Service Name: name-postgres-service

- flask port: 5004

- postgres port: 5432
