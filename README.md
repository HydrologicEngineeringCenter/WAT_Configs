# WAT Distributed Compute Compute Node Configurations

The distributed compute works through a controller node and compute nodes. The compute node needs to be set up in a slightly different way than the controller nodes. This configuration set defines the compute node configurations.

## Personal Configuration file
The HEC-WAT-Personal.config needs to be in "C:\Users\\\<USERNAME>\AppData\Roaming\HEC\HEC-WAT\" for all VM's being used for the distributed compute. If a personal configuration file already exists, the contents of this file can be added to the contents of the existing file as long as none of the vmparam settings override one another.

## default-config.xml
This xml file contains the details of how the ignite grid will function. There are many variations that can be placed in this xml file. This file needs to be placed in "C:\Programs\DC\". A few important settings typically need to be adjusted by the user:
- The port the compute nodes listen on and the controller broadcasts on
- The working directory for the models

## computenode.bat
The computenode.bat needs to be stored in "C:\Programs\DC\" it launches the ignite compute node that communicates back with the distributed compute controller.

## Distributed Compute Dependencies
The distributed compute relies on Apache Ignite and a few jars developed by RMA to manage the interaction of HEC-WAT with the ignite capabilities. All of the distributed compute dependencies need to live in "C:\Programs\DC\" A zip file containing the dependencies is avaialble at the following path: https://www.hec.usace.army.mil/nexus/repository/WAT_Plugins/DC/DC-ComputeNode.7z

### gridgaincompute.jar
The gridgaincompute.jar manages the integration of ignite and HEC-WAT dependencies. It is developed as a plugin in HEC-WAT that adds the necessary UI components to start a distributed compute and to manage the compute. It is included in the package above, and needs to be placed in "C:\Programs\DC\Plugin\".

### Ignite Compute Node Resource files
The ignite package for the compute node is included in the zip package above, it needs to be placed in "C:\Programs\DC\" it will contain all of the ignite jars necessary to find the compute nodes. It also stores the JDK appropriate for the version of the ignite resources.
