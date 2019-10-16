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

Long Ditance Travel Demand Model 
--------------------------------

			OD and trip count (exists)  [zip_od_tripcounts] 
				The remaining effort here needs to get all the codes and data in one place with documentation, version control and testing. 
			Departure time model (will not be developed) [ev_start] 
				This model needs to predict when the EVs start their journey. This model could consider the following in making the departure time decision: type of EV (tesla, range), route characteristics (chargers, POIs, energy consumption), driver characteristics (age, sex, income, occupation). It is not clear what data we have available for estimating this model. If data collection we possible, OBD data can be immensely useful. 
		Vehicle choice decision model (exists) [vcdm_latentlogit3] 
			This model needs to be documented and modularized to make it testing friendly. 
		Agent-based model to simulate use (needs some work) [evi_abm]
			EVI-ABM is more or less functional. Major enhancements include the capability to run the simulation on Linux and Windows, in headless mode with multiple days being simulated in parallel. Another enhancement is a verbose mode, that prints the log messages. A nice to have enhancement would be a parametric GUI that allows selection of number of EV and EVSE agents, etc.
			Charging choice decision model (needs checking) [ccdm_scdm4]
				Trip end SOCs are still skewed to the right. Also, EVs are getting out of charge in feasible road sections. These inconsistencies can be due to a flawed model or implementation scheme. 
