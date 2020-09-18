============================================
EV Infrastructure Agent-based Model (eviabm)
============================================

The agent-based model is implemented in `GAMA`_. GAMA was considered suitable for this project as it supports spatially explicit agent-based models. Some other features include: 

- A high-level language with several data-structures and programming constructs. 

- An advanced eclipse-based integrated development environment supporting auto-complete and in-simulation agent state viewer. 

- A graphical user interface (GUI) for viewing and interacting with the simulations. 

- External interfacing capabailities including connections to a database. 

- The ability to operate in a headless mode (as a background application without GUI) on multiple operating systems. 

- Vibrant community and active support through google groups and github issues. 

- Detailed documentation and examples covering several applications and usecases. 

EVI-ABM System Overview
=======================

The EVI-ABM system overview is shown in :numref:`evi_abm_sys_diagram`. We see that all agents, EVs, charging stations, and roads are children of the global agent “World”. All agents have attributes and possibly actions and states, which together define the agent’s characteristics. Some of these are built-in like location and speed, while some are user-defined like vehicle ID, capacity etc. :numref:`evi_abm_sys_diagram` shows the object-oriented nature of a GAMA model, and intuitively transfers to the real world. Depending on the problem at hand, we can define agents in as much detail as we choose. 

.. _evi_abm_sys_diagram: 
.. figure:: _static/WSDOT_EVSE_System_diagram.png
    :width: 800px
    :align: center
    :alt: EVI-ABM System Diagram
    :figclass: align-center
    
    EVI-ABM System Diagram

Finite State Machine Control
============================

Finite state machine (FSM) is a commonly used control paradigm and divides the system into several states and transitions. Agents begin the simulation in a certain state and transition into any (one of the) other states when a certain condition is fulfilled. It is important to note that, at any time-step agents can be in only one state.

FSM control is suitable to model the EV operation as we have deterministic and finite states the vehicle can be in (resting, driving, charging). The benefit of FSM control for our use case is that it helps in managing the complexity of operation and allows for easy testing. While modeling the infrastructure and driver behavior, FSM control allows us to observe in which state our agents are at any time step of the simulation and hence, we can get greater observability aiding in debugging. FSM control is also flexible, i.e. if we decide to add more complexity to the operation by adding more states (e.g. waiting in queue); we can do that by changing the transition conditions. The state diagram for our system is shown in :numref:`evi_abm_state_diagram`

.. _evi_abm_state_diagram: 
.. figure:: _static/WSDOT_EVSE_FSM.png
    :width: 800px
    :align: center
    :alt: EVI-ABM State Diagram
    :figclass: align-center

    Finite state machine diagram for EVI-ABM

To parse the state diagram, first observe the start and finished states. Other states in the system are “Resting”, “Driving”, “Locate Charger”, “Drive to Charger”, "Queue for Charging" and “Charging”, dark rectangular blocks. These are connected to diamond shaped decision boxes, that are the transition conditions, and the statements above the connecting lines are actions, or behaviors that are undertaken by agents at every time step, like “Go to Target”, “Update States” etc. While some decision questions like “Is T > T_rest?”, or “Is current location the target?” are easily answered in the ABM framework; some other EVI-ABM specific decision questions like “Does charging make sense?” are not so directly answerable and will depend on the trip and car related conditions as well as individual preferences. The linkages between these conditions and preferences are captured in behavioral models. 

Assumptions and Limitations
===========================

- **Energy Consumption**: The energy consumption during travel is assumed to be a constant currently. It is chosen as the capacity divided by the range. In reality, the energy consumption is dependent on the vehicle speed, road gradient, ambient temperature etc. 

- **Charging Rate**: The agent-based model (eviabm) only considers a constant charging rate of 50kW for each EV - since the `fueleconomy.gov` website used for collecting vehicle information does not contain information about maximum charge power for an EV. It also considers all chargers to be charging at 50 kW too, since AFDC does not maintain charging station maximum charging power information. This was not much of an issue when most vehicles allowed only 50 kW and most CHAdeMO and COMBO chargers allowed 50 kW too. With Electrify America charging stations, however, and advent of ultra-fast charging - the model will have to be updated to consider vehicle / charger specific charging rates. In reality, EVs rarely charge using the constant power profile. Charging profiles are proprietary and dynamic. 

- **Charging Choice**: While the charging choice at a charging station is being governed by the :ref:`ccdm`, a few additional constraints are imposed on the charging choice:

  #. Vehicle will not charge if the SOC is above the value :code:`MIN_SOC_CHARGING` (currently set at 60%) and will always charge if the SOC is at or below the :code:`MAX_SOC_CHARGING` (currently set at 20%). 
  
  #. Vehicle will only consider charging when it is in vicinity of a charging station. This means that a vehicle will consider charging at the station nearest to it, when it is within a distance of 2 timesteps from the station. 

  #. The vehicle will only reconsider charging after :code:`reconsider_charging_time` (currently 10 minutes). This means that if a vehicle has considered to charge (using the CCDM), then it will do so again only after 10 minutes, even if it is in vicinity of other charging stations. 

  #. A vehicle must charge at a charging station, if it cannot make it to the next charging station or its destination with the amount of charge currently in the vehicle. 

- **Queueing and Waiting**: A vehicle will queue for charging at the charging station when it reaches there. The following assumptions are made around queueing and waiting at the charging stations:

  #. If the charging station is completely occupied on arrival, and if the vehicle has enough charge to go to the next station, then it will proceed to do so. 

  #. If the charging station is full and distance to the next station is greater than :code:`BLOCK_SIZE` (currently 200 meters), or the distance of the next station is greater than the range left, then the vehicle will wait at the current charging station. 

  #. If vehicle charging station is occupied and the next charging station is not too far (less than 200 meters), then the vehicle will relocate to the next charging station. 

  #. Waiting EVs will be served on a first-come, first-serve basis. 
  

    .. _GAMA: https://gama-platform.github.io/