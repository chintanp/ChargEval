===============
Trip Generation
===============

.. detail the complete algorithm here (from the file generate_evtrip_scenarios.R)

The agent-based model simulates the EV trips happening in the state of WA in a day. The procedure to generate the trips is as follows: 

Estimate Long Distance Trips
============================

First the long-distance trips in WA are estimated using the :ref:`evi_dss:Long Distance Travel Demand Model`. The output of this model looks something like this: 

.. (show output of head())

Estimate Trips by EV Owning Households
======================================

Assign households and EVs to trips 
==================================

.. the difference between EV trips, as is inferred from the code, and household trips has to be described. The EV trips are the result at the end of the VCDM. 

.. departure 

.. return

Estimate Vehicle Choice 
=======================

This step predicts whether an EV is chosen for the trip or not as described in the section :ref:`evi_dss:Vehicle Choice Decision Model` (VCDM). 

