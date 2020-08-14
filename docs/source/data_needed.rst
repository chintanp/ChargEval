.. _data_needed:

================
Data Requirement
================

The data requirements of EVI-DSS can be classified into two categories, static and dynamic. 

.. (also cross-link these with the respective models, so each model should have a link to the dataset it uses. Maybe here mention all the models that this dataset is used in.) 

Static Datasets
===============

These datasets do not change or may change very infrequently to warrant an update strategy. 

WA State Road Network
---------------------
The WA State road network is used to simulate road travel. The road network was downloaded as shapefile from a source similar to `WA Public Roads Review Map`_ and its SRID converted to `EPSG:4326`_.

Zipcode Details
---------------
The details about the zipcodes needed include the lat-long of the centroid of the zipcode. For this purpose, the R package `zipcode`_ is used. 



Dynamic Datasets
================



.. _WA Public Roads Review Map: https://wsdot.maps.arcgis.com/apps/Viewer/index.html?appid=e1d3bf7788c14584a816559c6ccf51e6
.. _EPSG:4326: https://spatialreference.org/ref/epsg/wgs-84/
.. _zipcode: https://CRAN.R-project.org/package=zipcode