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

Read :ref:`database:Database Description` for details about the database.

View
====
The view refers to the interface exposed to the users of EVI-DSS. The users interact with the views. EVI-DSS has two views - the :ref:`evi_des:EV Infrastructure Designer` can be used to select the locations of prospective charging stations and configure the details for the charging stations placed; and the :ref:`res_view:Results Viewer` can be used to view to the results of the simulation for the current EV infrastructure, which is the combination of built as well as proposed charging stations. 

Controller
==========
The controller is the application that manages the execution of a simulation process when a new analysis request is made. Due to the multi-user nature of EVI-DSS, many users may simultaneously submit analysis execution requests. The controller queues the analysis requests and allocates the available resources. 

Read :ref:`sim_man:Simulation Manager` for more details about the controller. 

Benefits of MVC Architecture
============================
MVC is a popular architecture for complex applications. The benefit in our case, is that we can deploy all the component applications of EVI-DSS namely the database, the EV Infrastructure Designer, the Results Viewer and Simuilation Manager on one machine, or we can deploy it across several machines allowing to scale the application as needed. Modular nature of EVI-DSS allows us to maintain the application with ease, and a develop can work on one component without affecting the others. This also makes deployment easier, as the components can all be containerized. 

.. warning::
    It would be prudent to note that EVI-DSS currently is not robust to database failure. So, if the database crashes, the processes depending on them are likely to crash or mis-behave. This is high on the wish-list along with reducing execution time for analysis.

System Diagram
==============

:numref:`evi_dss_sys_diagram` shows the EVI-DSS System Diagram. Using `docker-compose`_ script

.. _evi_dss_sys_diagram: 
.. figure:: _static/evi_dss_sys_diagram.png
    :width: 800px
    :align: center
    :alt: EVI-DSS System Diagram
    :figclass: align-center

    EVI-DSS System Diagram



 


.. _PostgreSQL: https://www.postgresql.org/about/news/1976/
.. _PostGIS: https://postgis.net/2019/07/01/postgis-3.0.0alpha3/
.. _pgRouting: https://docs.pgrouting.org/latest/en/index.html
