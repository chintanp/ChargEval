==================
Simulation Manager
==================
The Simulation Manager is the controller in the EVI-DSS. The purpose of the Simulation Manager is to watch for the inserts into the database table 
:code:`analysis_record`. A record is inserted into this table whenever a user submits a charging station deployment scenario for analysis. The Simulation Manager receives the insert notification through the database trigger :code:`notify_new_order()` with the payload including the :code:`analysis_id` etc. and queues the analysis request for execution. The Simulation Manager process is shown in :numref:`sim_manager_flowchart`. 

.. _sim_manager_flowchart: 
.. figure:: _static/sim_manager_queueing_model.png
    :width: 800px
    :align: center
    :alt: Simulation Manager Process Flowchart 
    :figclass: align-center
    
    Simulation Manager Process Flowchart 

Simulation Manager and the sub-processes (in R and GAMA) all read the input data from the database and write the output to it. :code:`analysis_id` is passed between processes and all the relevant records from the database can be looked up using the :code:`analysis_id`. 

Implementation Details 
======================
The Simulation Manager is written in NodeJS as it supports asynchronous processes. The code is hosted `here`_. The NodeJS library `bee-queue`_ is used for implementing the queueing. `bee-queue` utilizes `Redis`_ as backend for storing the jobs in queue and their states. The queue can be monitored using an instance of `Arena`_ which tells us the status of the current queue, jobs being processed, waiting etc. 

Future Scope
============
Currently, the Simulation Manager only executes the jobs on the local system on which it is deployed. With a little wiring, it should be able to distribute the analysis execution to a cluster, and possibly handle multiple jobs in parallel. 

.. _here: https://github.com/chintanp/wsdot_evse_sim_manager
.. _bee-queue: https://github.com/bee-queue/bee-queue
.. _Redis: https://redis.io/
.. _Arena: https://github.com/bee-queue/arena