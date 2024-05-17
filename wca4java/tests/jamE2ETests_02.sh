####run the jam Jar


####
#addLocalDependenciesToApplication

##clean up dependencies

rm -rf /root/jam/wca4java/tests/logs

#### clone down the repo 

cd /root/source/gas/
rm -rf *
git clone git@github.ibm.com:was-svt/mvn-tWAS-gasstationmodule.git 

sleep 10 

cd /root/jam/wca4java/tests/

# /root/java/jdk-17.0.3.1/bin/jar -xf StationSecure_Entities.jar
#   rm -rf StationSecure_Entities.jar
#   cp ../pom.xml .
#   mvn rewrite:run
#   rm -rf pom.xml
#   /root/java/jdk-17.0.3.1/bin/jar -cf StationSecure_Entities.jar *


####run a Build
echo "Run Build Web Cafe Web"
echo ""
java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/gas/mvn-tWAS-gasstationmodule -b clean package > /root/jam/wca4java/tests/actual/e2e/runBuild_CleanPackage_gas.txt

if [ -f /root/source/gas/mvn-tWAS-gasstationmodule/target/GasStationModule.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e/runBuild_gas.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e/runBuild_gas.txt
fi

### run a scan on the war file
echo "run a scan on the war file"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/gas/mvn-tWAS-gasstationmodule -b /root/source/gas/mvn-tWAS-gasstationmodule/target/GasStationModule.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=ibm8

cat /root/.ibm_java_app_mod/GasStationModule_GasStationModule_0.0.1-SNAPSHOT/binary_scanner_output/GasStationModule.war_AnalysisReport.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_gas.txt


#######
echo "get recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/gas/mvn-tWAS-gasstationmodule  > /root/jam/wca4java/tests/actual/e2e/getrecipes_gas.txt

###
echo "run the recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runAllRecipes -a /root/source/gas/mvn-tWAS-gasstationmodule -m /root/jam/jamMigrationZips/gas/OL/gasstationmodule.war_migrationBundle.zip > /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_gas.txt

cat /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_gas.txt | grep INFO | awk -F : '{print $4}' > /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_WARN_gas.txt
######


echo "remove the jar file "
echo ""
rm -rf /root/source/gas/mvn-tWAS-gasstationmodule/target

#######
echo "run build "
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/gas/mvn-tWAS-gasstationmodule -b clean package > /root/jam/wca4java/tests/actual/e2e/runBuild_CleanPackage_2_gas.txt


if [ -f /root/source/gas/mvn-tWAS-gasstationmodule/target/GasStationModule.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e/runBuild_2_gas.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e/runBuild_2_gas.txt
fi

####
echo "run scan again"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/gas/mvn-tWAS-gasstationmodule -b /root/source/gas/mvn-tWAS-gasstationmodule/target/GasStationModule.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=ibm8

cat /root/.ibm_java_app_mod/GasStationModule_GasStationModule_0.0.1-SNAPSHOT/binary_scanner_output/GasStationModule.war_AnalysisReport.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_2_gas.txt


######
echo "get the difference between the files"
echo ""

diff /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_gas.txt /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_2_gas.txt  > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_diff_gas.txt


############
echo "Ruuning the tests"
echo ""
##### run the tests

python /root/jam/wca4java/tests/jamJarTestsE2E_02.py |& tee /root/jam/wca4java/tests/results/jamJarE2E_02.txt
