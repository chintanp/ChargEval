============================================
EV Infrastructure Agent-based Model (eviabm)
============================================

Organization of the Model
=========================

Agent-based model in GAMA follows the object-oriented design to the core. All GAMA objects inherit from the :code:`model` object which is defined in the first line of any model. Other objects in the simulation are:

Global 
------

The :code:`global` species (class)


.. warning::
    The agent-based model (EVI-ABM) only considers a constant charging rate of 50kW for each EV - since the `fueleconomy.gov` website used for collecting vehicle information does not contain information about maximum charge power for an EV. It also considers all chargers to be charging at 50 kW too, since AFDC does not maintain charging station maximum charging power information. This was not much of an issue when most vehicles allowed only 50 kW and most CHAdeMO and COMBO chargers allowed 50 kW too. With Electrify America charging stations, however, and advent of ultra-fast charging - the model will have to be updated to consider vehicle / charger specific charging rates. 