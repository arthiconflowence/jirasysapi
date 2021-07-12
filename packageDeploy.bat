@ECHO OFF 
TITLE Mule Deployment using Maven 
:: This script takes the required parameters to deploy an API

echo  #################################################
echo  #### Script to Build and Deploy the Jar file ####
echo  #################################################

:: ############System Parameters#######
SET muleVersion="4.2.2"
SET userName="REPLACE_BY_USER"
SET password="REPLACE_BY_USER"
SET applicationName="REPLACE_BY_USER"
SET environment="REPLACE_BY_USER"
SET businessGroup="REPLACE_BY_USER"
SET visualizer="system"
SET workerType="REPLACE_BY_USER"
SET clientId="REPLACE_BY_USER"
SET clientSecret="REPLACE_BY_USER"
SET workers="REPLACE_BY_USER"
SET region="REPLACE_BY_USER"

:: ##########Application parameters########
set encryptionKey="REPLACE_BY_USER"

:: ###################################
mvn clean package deploy -DskipMunitTests -DmuleDeploy -DmuleVersion=%muleVersion% -Dusername=%userName% -Dpassword=%password% -DapplicationName=%applicationName% -Denvironment=%environment% -DbusinessGroup=%businessGroup% -Danypoint.platform.visualizer.layer=%visualizer% -Dregion=%region% -Dworkers=%workers% -DworkerType=%workerType% -Danypoint.platform.client_id=%clientId% -Danypoint.platform.client_secret=%clientSecret% -DencryptionKey=%encryptionKey% -Djira-auth.token="Basic ZHJhbWFsaW5nYW1AbXVsZXNvZnQuY29tOlcySWNRb0lzZ1h2VlVXMkkyMEROOTBFOQ=="


PAUSE
