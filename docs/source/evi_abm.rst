============================================
EV Infrastructure Agent-based Model (eviabm)
============================================




.. warning::
    The agent-based model (EVI-ABM) only considers a constant charging rate of 50kW for each EV - since the `fueleconomy.gov` website used for collecting vehicle information does not contain information about maximum charge power for an EV. It also considers all chargers to be charging at 50 kW too, since AFDC does not maintain charging station maximum charging power information. This was not much of an issue when most vehicles allowed only 50 kW and most CHAdeMO and COMBO chargers allowed 50 kW too. With Electrify America charging stations, however, and advent of ultra-fast charging - the model will have to be updated to consider vehicle / charger specific charging rates. 