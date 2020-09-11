===================
System Architecture
===================

EVI-DSS is based on the model-view-controller (MVC) architecture. In the MVC architecture, the model represents the data, the view refers to the interface(s) exposed to the user and the controller handles the user requests. The architecture of EVI-DSS is as shown in :numref:`evi_dss_arch`.

 
.. _evi_dss_arch: 
.. figure:: _static/wsdot_evse_arch.jpg
    :width: 800px
    :align: center
    :alt: EVI-DSS System Architecture
    :figclass: align-center

    EVI-DSS System Architecture
	
Model
=====
The model refers to the data in the application. A relational database management system, `PostgreSQL`_ (v12.0.0) has been used as it provides geospatial capabilities through its extensions `PostGIS`_ (v 3.0) and `pgRouting`_ (v 3.0.0-alpha). The benefit of a database over files is that it enforces strict rules on data. This can help when as the complexity of the application increases and several layers depend on the same data. 

Read :ref:`database:Database` for details about the database.

View
====
The view refers to the interface exposed to the users of EVI-DSS. The users interact with the views. EVI-DSS has two views - the :ref:`evi_des:EV Infrastructure Designer (evides)` can be used to select the locations of prospective charging stations and configure the details for the charging stations placed; and the :ref:`res_view:Results Viewer (resview)` can be used to view to the results of the simulation for the current EV infrastructure, which is the combination of built as well as proposed charging stations. 

Controller
==========
The controller is the application that manages the execution of a simulation process when a new analysis request is made. Due to the multi-user nature of EVI-DSS, many users may simultaneously submit analysis execution requests. The controller queues the analysis requests and allocates the available resources. 

Read :ref:`sim_man:Simulation Manager (simman)` for more details about the controller. 

Benefits of MVC Architecture
============================
MVC is a popular architecture for complex applications. The benefit in our case, is that we can deploy all the component applications of EVI-DSS namely the database, the EV Infrastructure Designer, the Results Viewer and Simuilation Manager on one machine, or we can deploy it across several machines allowing to scale the application as needed. Modular nature of EVI-DSS allows us to maintain the application with ease, and a develop can work on one component without affecting the others. This also makes deployment easier, as the components can all be containerized. 

.. warning::
    It would be prudent to note that EVI-DSS currently is not robust to database failure. So, if the database crashes, the processes depending on them are likely to crash or mis-behave. This is high on the wish-list along with reducing execution time for analysis.

System Diagram
==============

:numref:`evi_dss_sys_diagram` shows the EVI-DSS System Diagram. 

.. _evi_dss_sys_diagram: 
.. figure:: _static/evi_dss_sys_diagram.png
    :width: 800px
    :align: center
    :alt: EVI-DSS System Diagram
    :figclass: align-center

    EVI-DSS System Diagram


Deployment
----------

EVI-DSS is planned to be deployed on an AWS EC2 instance using :code:`docker-compose`. The docker-compose `script is located here`_. It is suggested that the script be launched in an instance of type t3a.medium (2 vCPUs, 4 GB RAM) or larger. 


Services
^^^^^^^^

- :code:`nginx`: The Nginx webserver is used as a reverse proxy for the R Shiny applications :code:`evides` and :code:`resview`. 

- :code:`evides`: :ref:`evi_des:EV Infrastructure Designer (evides)` is the R Shiny app with authentication for submitting new EVSE deplopyment scenarios. These scenarios get recorded in a database. 

- :code:`simman`: This micro-service, the :ref:`sim_man:Simulation Manager (simman)` is the NodeJS application responsible for managing the submitted analysis requests.

  * :code:`tripgen`: :code:`simman` programmatically launches an EC2 instance for :ref:`trip_gen:Trip Generation (tripgen)`. Upon trip generation, the EC2 instance is terminated. 

  * :code:`eviabm`: The :ref:`evi_abm:EV Infrastructure Agent-based Model (eviabm)` simulates the EV and EVSE agents and runs in its dedicated EC2 instance which is terminated after the simulation is over.

- :code:`redis`: The Redis server is used to as the storage for analysis request queue, used by :code:`simman`.

- :code:`resview`: The :ref:`res_view:Results Viewer (resview)` is the R Shiny application for viewing the results of the simulation. It shows summary statistics as well as agent states at every minute of the simulation. 

- :code:`flyway`: This service can be executed to implement database migrations. 

To start a docker container after making a change, use the following command to recreate the container (will take some time to execute):

.. code-block:: bash

   $ docker-compose up -d --build --force-recreate <container-name(s)> 

Replace <container-name(s)> with the name(s) of the docker container you wish to start, for example, :code:`evides`, :code:`nginx` etc. 

To start a stopped container, or start a container without (re)building it, use the following command:

.. code-block:: bash

   $ docker-compose up -d <container-name> 

Observability
-------------

Observability is the capability to be aware of the system and take quick remedial action in case of failures, errors etc. and is critical for distributed, scalable applications. The three main pillars of observability include:

Logging
^^^^^^^
EVI-DSS uses AWS CloudWatch as centralized log destination for all systems. Logs are sent from docker containers (evides, simman, resview, redis, nginx, flyway, tripgen) as well as from the launched EC2 instances tripgen and eviabm. Using a centralized log destination allows for log persistance and long term analytical capabilities.

Monitoring
^^^^^^^^^^
While no centralized dashboard for monitoring all services was not created, following tools are used in combination to monitor the various services in the application:

- dockprom: `dockprom`_ gives fine grained statistics for all the docker containers on the system. 

- pgAdmin: pgAdmin's in-built dashboard allows insight into the database and can be used to see the number of active connections as well as transaction metrics. 

- AWS EC2 Dashboard: The AWS EC2 dashboard provides basic monitoring capabilities on the launched EC2 instances, namely the number and specification of the launched instances as well as coarse system metrics like CPU and memory utilization. 

- ssh: All the EC2 instances have ssh access which means a user can log in and view the system state and debug it as needed. 

Distributed Tracing
^^^^^^^^^^^^^^^^^^^
Currently, no instrumentation exists in the system that directly shows the trace of an analysis request, i.e. which step of the process is currently executing. But since, the simulation manager is controlled by the three triggers, namely, :code:`notify_new_order()`, :code:`notify_trips_generated()` and :code:`notify_solved()`, observing the database for status changes alongwith the audit trigger on the :code:`analysis_record` table gives us an indication of the step. 

.. _dockprom: https://github.com/stefanprodan/dockprom
.. _script is located here: https://github.com/chintanp/evi-dss/blob/master/docker-compose.yml
.. _PostgreSQL: https://www.postgresql.org/about/news/1976/
.. _PostGIS: https://postgis.net/2019/07/01/postgis-3.0.0alpha3/
.. _pgRouting: https://docs.pgrouting.org/latest/en/index.html
