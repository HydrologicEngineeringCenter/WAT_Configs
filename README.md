# WAT Distributed Compute Controller Configurations

The distributed compute works through a controller node and compute nodes. The controller node needs to be set up in a slightly different way than the compute nodes. This configuration set defines the controller node configurations.

## Personal Configuration file
The HEC-WAT-Personal.config needs to be in "C:\Users\\\<USERNAME>\AppData\Roaming\HEC\HEC-WAT\". If a personal configuration file already exists, the contents of this file can be added to the contents of the existing file as long as none of the vmparam settings override one another.

## default-config.xml
This xml file contains the details of how the ignite grid will function. There are many variations that can be placed in this xml file. This file needs to be placed in "C:\Programs\DC\". A few important settings typically need to be adjusted by the user:
- The port the compute nodes listen on and the controller broadcasts on
- The working directory for the models

## Distributed Compute Dependencies
The distributed compute relies on Apache Ignite and a few jars developed by RMA to manage the interaction of HEC-WAT with the ignite capabilities. All of the distributed compute dependencies need to live in "C:\Programs\DC\"

### gridgaincompute.jar
The gridgaincompute.jar manages the integration of ignite and HEC-WAT dependencies. It is developed as a plugin in HEC-WAT that adds the necessary UI components to start a distributed compute and to manage the compute. It can be downloaded from XXXXXXXXXX It needs to be placed in "C:\Programs\DC\Plugin\".

### rmiServer.jar
The rmiServer.jar manages the communication across processes using Remote invocation (RMI). It can be downloaded from XXXXXXXXXX It needs to be placed in "C:\Programs\DC\RMI\".

### Ignite Controller Resource files
The ignite package for the controller can be found at XXXXXXXXXXXXX it needs to be placed in "C:\Programs\DC\sys" it will contain all of the ignite jars necessary to find the compute nodes.
