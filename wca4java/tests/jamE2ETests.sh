####run the jam Jar


####
#addLocalDependenciesToApplication

##clean up dependencies

rm -rf /root/source/modresorts/modresorts/src/main/liberty/lib/

rm -rf /root/jam/wca4java/tests/logs

#### clone down the repo 

cd /root/source/modresorts/
rm -rf *
git clone git@github.ibm.com:TransformationAdvisor/modresorts.git

sleep 10 

cp -R /root/source/modresorts/modresorts/src /root/source/modresorts/modresorts/src_orig

cd /root/jam/wca4java/tests/



####run a Build
echo "Run Build"
echo ""
java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/modresorts/modresorts -b clean package > /root/jam/wca4java/tests/actual/e2e/runBuild_CleanPackage.txt

if [ -f /root/source/modresorts/modresorts/target/modresorts-2.0.0.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e/runBuild.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e/runBuild.txt
fi

### run a scan on the war file
echo "run a scan on the war file"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/source/modresorts/modresorts/target/modresorts-2.0.0.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=ibm8

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | sort -n | sed 's/^ *//g' > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_TechnologyReport.json | grep excludePackages | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_InventoryReport.json | grep archiveName | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | wc -l > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_count.txt
#######
echo "get recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/modresorts/modresorts > /root/jam/wca4java/tests/actual/e2e/getrecipes.txt

###
echo "run the recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runAllRecipes -a /root/source/modresorts/modresorts  > /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod.txt

cat /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod.txt | grep INFO | awk -F : '{print $4}' > /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_WARN.txt

cp /root/source/modresorts/modresorts/pom.xml /root/jam/wca4java/tests/actual/e2e/pome2e

######

echo "remove the jar file "
echo ""
rm -rf /root/source/modresorts/modresorts/target

#######
echo "run build "
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/modresorts/modresorts -b clean package > /root/jam/wca4java/tests/actual/e2e/runBuild_CleanPackage_2.txt


if [ -f /root/source/modresorts/modresorts/target/modresorts-2.0.0.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e/runBuild_2.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e/runBuild_2.txt
fi

####
echo "run scan again"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/source/modresorts/modresorts/target/modresorts-2.0.0.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=ibm8 -d

if [ -d /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/logs ]; then
 echo "Log directory present" > /root/jam/wca4java/tests/actual/e2e/log.txt
else
 echo "Log directory not present" > /root/jam/wca4java/tests/actual/e2e/log.txt
fi

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | sort -n | sed 's/^ *//g' > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_2.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_TechnologyReport.json | grep excludePackages | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_2.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_InventoryReport.json | grep archiveName | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid_2.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | wc -l > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_count_2.txt

jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json > /root/jam/wca4java/tests/actual/e2e/mig_anal.txt

cat /root/jam/wca4java/tests/actual/e2e/mig_anal.txt | grep ruleId | sort -n  | sed 's/^ *//g' > /root/jam/wca4java/tests/actual/e2e/mig_anal_ruleid.txt


######
echo "get the difference between the files"
echo ""

diff /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid.txt /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_2.txt  > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_diff.txt

diff /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid.txt /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_2.txt  > /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_diff.txt

diff /root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid.txt /root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid_2.txt  > /root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid_diff.txt

diff /root/jam/wca4java/tests/actual/e2e/mig_anal_ruleid.txt /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_2.txt > /root/jam/wca4java/tests/actual/e2e/mig_bin_ruleid_diff.txt


####get the timestamp

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getMigrationBundleGenerationDateAndTime -a /root/source/modresorts/modresorts > /root/jam/wca4java/tests/actual/e2e/timestamp.txt

if [ -s /root/jam/wca4java/tests/actual/e2e/timestamp.txt ]; then
 echo "timestamp file is not empty" > /root/jam/wca4java/tests/actual/e2e/check_timestamp.txt
else
 echo "timestamp file is empty" > /root/jam/wca4java/tests/actual/e2e/check_timestamp.txt
fi

############
echo "Ruuning the tests"
echo ""
##### run the tests

python /root/jam/wca4java/tests/jamJarTestsE2E.py |& tee /root/jam/wca4java/tests/results/jamJarE2E.txt
