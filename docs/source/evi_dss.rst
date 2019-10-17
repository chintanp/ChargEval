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
 
When :math:`a \ne 0`, there are two solutions to :math:`ax^2 + bx + c = 0` and they are:

.. math::
    :label: u_icev
    
    u_{\text{icev}_i} = \theta_\text{1} \times \text{gas cost}_\text{i,icev} + \varepsilon_{\text{icev}_i}

.. math::
    :label: u_rent

    u_{\text{rent}_i} = \theta_2 \times C_{\text{rental}_i} + \theta_3 \times \text{gas cost}_\text{i,rent} + \varepsilon_{\text{rent}_i}

.. math::
    :label: u_bev

    u_{\text{bev}_i} = \theta_4 \times \frac { L }{ r_\text{full}} + \theta_5 \times \frac { \text{Max}_\text{Spacing} }{ r_\text{full} } + \theta_6 \times  l_\text{restrooms} + \theta_7 \times \text{Restaurants} + \theta_8 \times \text{Des}_{\text{charger}_\text{type(L2)}} + \theta_9 \times \text{Des}_{\text{charger}_\text{type(L3)}} + \text{ASC_BEV} + \varepsilon_{\text{rent}_i}
    
In the above equations, :math:`u` represents the utility of the particular vehicle choice. :math:`\theta_i` are the model coefficients for the covariates: cost of gas for ICEV during the trip (:math:`\text{gas cost}_\text{i,icev}`), cost of a rental car (:math:`C_{\text{rental}_i}`), gas cost for a rental car (:math:`\text{gas cost}_\text{i,rent}`), ratio of trip length and full range of BEV (:math:`\frac { L }{ r_\text{full}}`), ratio of maximum spacing between chargers along the trip route and full range of a BEV (:math:`{ \text{Max}_\text{Spacing} }{ r_\text{full} }`), largest spacing between restrooms along the route (:math:`l_\text{restrooms}`), whether there is a restroom near the charging station (:math:`\text{Restaurants}`), whether the destination has a level-2 charger (:math:`\text{Des}_{\text{charger}_\text{type(L2)}}`), whether the destination has a fast charger (:math:`\text{Des}_{\text{charger}_\text{type(L3)}}`). :math:`\text{ASC_BEV}` is the alternative specific constant for BEV and :math:`\varepsilon` are the error terms. The coefficients for the variables used in this study are presented in Table 1 .

.. _this publication: https://trid.trb.org/view/1573197 