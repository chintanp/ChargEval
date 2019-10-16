=======
EVI-DSS
=======

The electric vehicle infrastructure decision support system (EVI-DSS) is the tool to guide decision makers in planning the deployment of EV infrastructure. Public agencies as well as private companies can use the EVI-DSS, since it predicts KPIs relevant to each domain. The EVI-DSS has been developed in collaboration with and with funding from Washington State Department of Transportation. The results and scenarios presented in this paper are therefore for the Washington state region. However, the methodology described is general enough to be applied anywhere across the world. 

Goals of EVI-DSS 
================
The EVI-DSS shows the infeasibility metric across the state and indication of where a high of volume of traffic flow is matched with a high spacing of charging stations. These areas are good candidates for charging stations if the objective is to maximize utilization. Once the sites are chosen, the EVI-DSS estimates the potential utilization for a chosen site. The utilization is outputted as energy and power. The total energy consumed per charging station in a month and the peak power draw in a month are important statistics that affect the economics of charging stations. 

Components
==========
The various components of the EVI-DSS are described below. For an in-depth technical exposition refer to the corresponding paper or contact the authors. 

Long Distance Travel Demand Model 
--------------------------------
The necessity of charging on a route is directly proportional to the number of EV trips passing through the route. The trip counts between origin-destination (OD) pairs were estimated using INRIX data, as reported in previous work. The OD matrix is composed of around 300k+ rows for indicating trip counts from all origin zips to all destination zips within WA. The trip counts are dependent on several factors like the origin and destination population, respective counties, and distance between origin and destination. The total trip count between an OD pair is composed of two quantities, the traffic belonging to O, departing from O to D, and the traffic belonging to D, returning to D from O. It is imperative to separate the total traffic volume between an OD pair into returning and departing sub-volumes as the sub-volumes are dependent on the county that the EV belongs to. For techinal details refer to `this publication`_. 


Vehicle Choice Decision Model
-----------------------------
The vehicle choice decision model (VCDM) can tell us whether an EV is feasible for trip depending on various trip and vehicle characteristics. Ge (55) estimates several discrete choice models generated through stated preference surveys. For the purpose of EVI-ABM a latent choice logistic regression model is used that makes a vehicle selection between an internal combustion engine vehicle (ICEV), a rental vehicle or a battery electric vehicle (BEV), and is described as under:
 
〖u_icev〗_i=θ_1*〖gas cost〗_(i,icev)+ 〖ε_icev〗_i                                                     (1)
〖u_rent〗_i=θ_2*〖C_rental〗_i+θ_3*〖gas cost〗_(i,rent)+  〖ε_rent〗_i                                     (2)
〖u_bev〗_i=θ_4*L/r_full +θ_5*Max_Spacing/r_full +θ_6*l_restrooms+θ_7*Restaurants+
θ_8*Des_(charger_type(L2)  )+θ_9*Des_(charger_type(L3)  )+ASC_BEV+  〖ε_rent〗_i        (3)
In the above equations, u represents the utility of the particular vehicle choice. θ_i are the model coefficients for the covariates: cost of gas for ICEV during the trip (〖gas cost〗_(i,icev)), cost of a rental car (〖C_rental〗_i), gas cost for a rental car (〖gas cost〗_(i,rent)), ratio of trip length and full range of BEV (L/r_full ), ratio of maximum spacing between chargers along the trip route and full range of a BEV (Max_Spacing/r_full ), largest spacing between restrooms along the route (l_restrooms), whether there is a restroom near the charging station (Restaurants), whether the destination has a level-2 charger (Des_(charger_type(L2)  )), whether the destination has a fast charger (θ_9*Des_(charger_type(L3)  )). ASC_BEV is the alternative specific constant for BEV and ε are the error terms. The coefficients for the variables used in this study are presented in Table 1 .

.. _this publication: https://trid.trb.org/view/1573197 