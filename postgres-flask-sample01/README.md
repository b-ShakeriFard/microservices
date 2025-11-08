This is a sample PostgreSQL + flask app, used for demonstrating statefulset apps and their functionalities.

Data is retrieved from CSV files, and it is initialized via a simple init.sql script.
Postgres container allows communication via 5432 port, and flask via 5004 port.
There are two services: ClusterIP for PostgreSQL & NodePort for flask.

You will find a "kubernetes" folder here in which there are manifest files: statefulset, deployment, PV, PVC, and service.

Enjoy - 8th November 2025
