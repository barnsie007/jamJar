####run the jam Jar


####
#addLocalDependenciesToApplication

##clean up dependencies

rm -rf /root/source/modresorts/modresorts/src/main/liberty/lib/

rm -rf /root/jam/wca4java/tests/logs

rm -rf /root/jam/wca4java/workspace/.ibm_java_app_mod/

#### clone down the repo 

cd /root/source/modresorts/
rm -rf *
git clone git@github.ibm.com:TransformationAdvisor/modresorts.git

sleep 10 

echo "set up the java 18 env build war"

####set up the java 18 env build war  

mv -f /usr/bin/java /usr/bin/java_orig
cp -f -R /usr/bin/java_18 /usr/bin/java

###########

####run a Build
echo "Run Build"
echo ""
java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/modresorts/modresorts -b clean package > /root/jam/wca4java/tests/actual/WS/runBuild_CleanPackage.txt

if [ -f /root/source/modresorts/modresorts/target/modresorts-2.0.0.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/WS/runBuild.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/WS/runBuild.txt
fi

### run a scan on the war file
echo "run a scan on the war file"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/source/modresorts/modresorts/target/modresorts-2.0.0.war -w /root/jam/wca4java/workspace/ --source-app-server=openLiberty --source-ee-version=ee7 --source-java-version=ibm8 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=java21

cat /root/jam/wca4java/workspace/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/WS/scan_wl_ruleid.txt

cat /root/jam/wca4java/workspace/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_TechnologyReport.json | grep excludePackages | sort -n > /root/jam/wca4java/tests/actual/WS/scan_ol_ruleid.txt

cat /root/jam/wca4java/workspace/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_InventoryReport.json | grep archiveName | sort -n > /root/jam/wca4java/tests/actual/WS/scan_twas_ruleid.txt

cat /root/jam/wca4java/workspace/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | wc -l > /root/jam/wca4java/tests/actual/WS/scan_wl_ruleid_count.txt
#######
echo "get recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/modresorts/modresorts  -w /root/jam/wca4java/workspace/ > /root/jam/wca4java/tests/actual/WS/getrecipes.txt


echo "get source java versions"
java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getSourceJavaVersion -a /root/source/modresorts/modresorts  -w /root/jam/wca4java/workspace/ > /root/jam/wca4java/tests/actual/WS/sourceJava_modresorts_8.txt

echo "set up to java 21"
####set up the java 21 env build war

mv -f /usr/bin/java /usr/bin/java_orig
cp -f -R /usr/bin/java_21 /usr/bin/java

sed -i 's/1.8/21/g' /root/source/modresorts/modresorts/pom.xml

echo "get source java versions"
java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getSourceJavaVersion -a /root/source/modresorts/modresorts  -w /root/jam/wca4java/workspace/ > /root/jam/wca4java/tests/actual/WS/sourceJava_modresorts_21.txt

###
echo "run the recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runAllRecipes -a /root/source/modresorts/modresorts  -w /root/jam/wca4java/workspace/ > /root/jam/wca4java/tests/actual/WS/AllRecipes_Mod.txt

cat /root/jam/wca4java/tests/actual/WS/AllRecipes_Mod.txt | grep INFO | awk -F : '{print $4}' > /root/jam/wca4java/tests/actual/WS/AllRecipes_Mod_WARN.txt
######

echo "remove the jar file "
echo ""
rm -rf /root/source/modresorts/modresorts/target

#######
echo "run build "
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/modresorts/modresorts -b clean package > /root/jam/wca4java/tests/actual/WS/runBuild_CleanPackage_2.txt


if [ -f /root/source/modresorts/modresorts/target/modresorts-2.0.0.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/WS/runBuild_2.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/WS/runBuild_2.txt
fi

####
echo "run scan again"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/source/modresorts/modresorts/target/modresorts-2.0.0.war -w /root/jam/wca4java/workspace/ --source-app-server=openLiberty --source-ee-version=ee7 --source-java-version=ibm8 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=java21

cat /root/jam/wca4java/workspace/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/WS/scan_wl_ruleid_2.txt

cat /root/jam/wca4java/workspace/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_TechnologyReport.json | grep excludePackages | sort -n > /root/jam/wca4java/tests/actual/WS/scan_ol_ruleid_2.txt

cat /root/jam/wca4java/workspace/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_InventoryReport.json | grep archiveName | sort -n > /root/jam/wca4java/tests/actual/WS/scan_twas_ruleid_2.txt

cat /root/jam/wca4java/workspace/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | wc -l > /root/jam/wca4java/tests/actual/WS/scan_wl_ruleid_count_2.txt
######
echo "get the difference between the files"
echo ""

diff /root/jam/wca4java/tests/actual/WS/scan_wl_ruleid.txt /root/jam/wca4java/tests/actual/WS/scan_wl_ruleid_2.txt  > /root/jam/wca4java/tests/actual/WS/scan_wl_ruleid_diff.txt

diff /root/jam/wca4java/tests/actual/WS/scan_ol_ruleid.txt /root/jam/wca4java/tests/actual/WS/scan_ol_ruleid_2.txt  > /root/jam/wca4java/tests/actual/WS/scan_ol_ruleid_diff.txt

diff /root/jam/wca4java/tests/actual/WS/scan_twas_ruleid.txt /root/jam/wca4java/tests/actual/WS/scan_twas_ruleid_2.txt  > /root/jam/wca4java/tests/actual/WS/scan_twas_ruleid_diff.txt

####get the timestamp

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getMigrationBundleGenerationDateAndTime -a /root/source/modresorts/modresorts -w /root/jam/wca4java/workspace/ > /root/jam/wca4java/tests/actual/WS/timestamp.txt

if [ -s /root/jam/wca4java/tests/actual/WS/timestamp.txt ]; then
 echo "timestamp file is not empty" > /root/jam/wca4java/tests/actual/WS/check_timestamp.txt
else
 echo "timestamp file is empty" > /root/jam/wca4java/tests/actual/WS/check_timestamp.txt
fi


####copy back java to java 8

mv -f /usr/bin/java /usr/bin/java_orig

cp -f -R /usr/bin/java_18 /usr/bin/java

echo "clean workspace"

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api cleanApplicationWorkspace -a /root/source/modresorts/modresorts/ -w /root/jam/wca4java/workspace/

if [ -d /root/jam/wca4java/workspace/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0 ]; then
 echo "workspace exists" > /root/jam/wca4java/tests/actual/WS/check_workspace.txt
else
 echo "workspace deleted" > /root/jam/wca4java/tests/actual/WS/check_workspace.txt
fi


############
echo "Ruuning the tests"
echo ""
##### run the tests

python /root/jam/wca4java/tests/jamJarTestsWS.py |& tee /root/jam/wca4java/tests/results/jamJarWS.txt
