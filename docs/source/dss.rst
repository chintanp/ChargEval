=======================
Decision Support System
=======================

Definition 
==========
A decision support system is a tool to help assess the outcome of a decision. Since the outcome if often stochastic and dependent on several extraneous factors, there is an inherent uncertainty in the prediction of the outcome. To manage the uncertainty and validate the underlying models, the outcome of decision support systems should be validated against real-world data. Further, even with or in the absence of validation, the decision support systems should not be used to blindly to decide whether a decision makes sense. They should rather be used to compare the outcomes of two decisions. 

Need 
====
EV infrastructure is a facility location problem. Facility location problems are NP hard. There are multiple criteria for evaluating the feasibility of a fast charger siting scenario. In the absence of a deterministic optimal solution for fast charger locations, we need to manually evaluate which locations make more sense compared to others. Therefore, the decision support system can give us the key performance indicators (KPIs) of metrics relevant to the all stakeholders, so a sustainable solution to EV infrastructure development can be found. 

Frameworks available 
====================

Justification of selected framework 
===================================
The available frameworks are either too simplistic, that they do not capture the local and regional travel models and propensities, or are too complex and time-consuming that their application for statewide EV infrastructure development would not warrant the cost and effort. The proposed framework is modular, so that as various sub-models can evolve over time. As we have better understanding of the dynamics of a system like EV adoption or energy consumed during a trip, the underlying model for the system can be switched or updated to test for the new hypothesis.  Further, none of the available decision support systems is available in an open-source format. The open-source nature of the proposed decision support system allows others to use the system in the same or other geographical area. Support, feedback and scrutiny from other users is another avenue for system advancement.  
