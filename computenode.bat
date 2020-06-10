@echo off

rem adjust these first two
set IGNITE_HOME=C:\Programs\ignite
set JAVA_HOME=C:\Programs\ignite\jdk
set WAT_HOME=C:\Programs\HEC-WAT\HEC-WAT


rem these should be okay
set JVM_OPTS= -Xms1g -Xmx6g -server -XX:+AggressiveOpts -XX:MaxPermSize=256m -ea 

set JVM_OPTS=%JVM_OPTS% -DLOGFILE="%temp%\wat_console.log"
set JVM_OPTS=%JVM_OPTS% -DPLUGINS="%WAT_HOME%\jar\ext"
set JVM_OPTS=%JVM_OPTS% -Djava.library.path="%WAT_HOME%\lib"
set JVM_OPTS=%JVM_OPTS% -DNoComputeConvergenceCheck=true
set JVM_OPTS=%JVM_OPTS% -DRmiFile.internOwner=true
set JVM_OPTS=%JVM_OPTS% -DmaxComputeTextPaneLength=5000
set JVM_OPTS=%JVM_OPTS% -DmaxMessagesTabLength=5000
set JVM_OPTS=%JVM_OPTS% -DHecFile.NoFileCompression=true
set JVM_OPTS=%JVM_OPTS% -DFIA.ServerWaitMs=1200
set JVM_OPTS=%JVM_OPTS% -DFRA.NoSqueezeDSS=false
set JVM_OPTS=%JVM_OPTS% -DIgnoreRestartFile=true
set JVM_OPTS=%JVM_OPTS% -DMerge.IntegrityLevel=0
set JVM_OPTS=%JVM_OPTS% -XX:+HeapDumpOnOutOfMemoryError  
::set JVM_OPTS=%JVM_OPTS% -Djava.util.logging.manager=org.apache.logging.julbridge.JULBridgeLogManager
set JVM_OPTS=%JVM_OPTS% -Djava.util.logging.config.file="%wat_home%/config/properties/logging.properties"
set JVM_OPTS=%JVM_OPTS% -Djavax.xml.parsers.SAXParserFactory=com.sun.org.apache.xerces.internal.jaxp.SAXParserFactoryImpl 
set JVM_OPTS=%JVM_OPTS% -DWriteFilesToDelete=true

rem -verbose:class
set USER_LIBS=C:\Programs\DC\Plugin\gridgaincompute.jar;%WAT_HOME%\jar\*;%WAT_HOME%\jar\rmi\*;%WAT_HOME%\jar\sys\*;%WAT_HOME%\jar\ext\*;%WAT_HOME%\jar\sys\excel\*;%WAT_HOME%\jar\sys\akka\*;%WAT_HOME%\jar\sys\ratingEditor\*;%WAT_HOME%\..\apps\HEC-HMS\*;%WAT_HOME%\jar\sys\geotools\*
rem this isn't a mistake, its supposed to clear the variable so that the path doesn't keep growing
set IGNITE_LIBS=

:: if WAT_HOME contains spaces,  CONFIG_FILE will contain spaces and gg_computenode_start.bat freaks out.
:: I think this %%~sA trick is known to have problems in xp before sp1...
set CONFIG_FILE="C:\Programs\DC\default-config.xml"
for %%A in (%CONFIG_FILE%) do set shortconfig=%%~sA

cd "%WAT_HOME%"
call "%IGNITE_HOME%\bin\ignite.bat" %shortconfig% > %temp%\out.log 2>&1

