.. ChargEval documentation master file, created by
   sphinx-quickstart on Wed Oct 16 12:00:00 2019.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

==========================
ChargEval documentation
==========================

ChargEval is a decision support system for electric vehicle infrastructure (EVI)  design for the state of Washington, USA. The underlying modeling framework is general enough that the tool can be used at any scale, any where.

.. note::
   The live demo of the EV Infrastructure Designer is `here`_ and some sample runs can be seen in the `Results Viewer here`_.

The decision to build EVI is a complex one and is dependent on several factors. ChargEval uses combination of models to predict the EVSE utilization. The documents detail the various components of the ChargEval system and the component models involed.

.. toctree::
   :maxdepth: 2
   :numbered:
   :caption: Contents:

   intro
   dss
   evi_dss
   arch
   data_needed
   database
   evi_des
   sim_man
   trip_gen
   evi_abm
   res_view


.. _here: https://stlab.shinyapps.io/evides2
.. _Results Viewer here: https://stlab.shinyapps.io/resview
