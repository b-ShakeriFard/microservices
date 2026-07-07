Author: Behrouz ShakeriFard
Contact: bshakeri@torontomu.ca
Date: November 8th, 2025

second iteration: July 2026


This is a sample PostgreSQL + flask app, used for demonstrating statefulset apps and their functionalities.

Data is retrieved from CSV files, and it is initialized via a simple init.sql script.
Postgres container allows communication via 5432 port, and flask via 5004 port.
There are two services: ClusterIP for PostgreSQL & NodePort for flask.

<hr>

You will find a "kubernetes" folder here in which there are manifest files: 

statefulset, deployment, PV & PVC, headless service, NodePort service, etc.

<hr>

App info:

NameSpace: name-db-lab

App-name:

Service Name:

flask port: 5008

postgres port: 5432
