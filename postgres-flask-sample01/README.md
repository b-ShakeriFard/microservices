Author: Behrouz ShakeriFard
Contact: bshakeri@torontomu.ca
Date: November 8th, 2025

second iteration: July 2026


This is a sample PostgreSQL + flask app, used for demonstrating statefulset apps and their functionalities.

Data is retrieved from CSV files, and it is initialized via a simple init.sql script.
Postgres container allows communication via 5432 port, and flask via 5004 port.
There are two services: ClusterIP for PostgreSQL & NodePort for flask.

<hr>

You will find all "kubernetes" manifest files here: 

statefulset, deployment, PV & PVC, headless service, NodePort service, ConfigMap, Secret, etc.

<hr>

App info:

NameSpace: name-db-lab

App-name: fp-name-db-app

postgres Service Name: name-postgres-service

flask port: 5004

postgres port: 5432
