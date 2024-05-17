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
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e/runBuild_lib.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e/runBuild_lib.txt
fi

### run a scan on the war file
echo "run a scan on the war file"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/source/modresorts/modresorts/target/modresorts-2.0.0.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=liberty --target-ee-version=ee7 --target-java-version=ibm8

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_liberty_ruleid.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep target | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_liberty_target.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | wc -l > /root/jam/wca4java/tests/actual/e2e/scan_liberty_ruleid_count.txt
#######
echo "get recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip > /root/jam/wca4java/tests/actual/e2e/getrecipes_liberty.txt

###
echo "run the recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runAllRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip > /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_liberty.txt

cat /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_liberty.txt | grep WARNING > /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_WARN_liberty.txt
######

echo "remove the jar file "
echo ""
rm -rf /root/source/modresorts/modresorts/target

#######
echo "run build "
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/modresorts/modresorts -b clean package > /root/jam/wca4java/tests/actual/e2e/runBuild_CleanPackage_2_liberty.txt


if [ -f /root/source/modresorts/modresorts/target/modresorts-2.0.0.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e/runBuild_lib_2.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e/runBuild_lib_2.txt
fi

####
echo "run scan again"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/source/modresorts/modresorts/target/modresorts-2.0.0.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=liberty --target-ee-version=ee7 --target-java-version=ibm8

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_liberty_ruleid_2.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep target | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_liberty_target_2.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | wc -l > /root/jam/wca4java/tests/actual/e2e/scan_liberty_ruleid_count_2.txt
######
echo "get the difference between the files"
echo ""

diff /root/jam/wca4java/tests/actual/e2e/scan_liberty_ruleid.txt /root/jam/wca4java/tests/actual/e2e/scan_liberty_ruleid_2.txt  > /root/jam/wca4java/tests/actual/e2e/scan_liberty_ruleid_diff.txt

diff /root/jam/wca4java/tests/actual/e2e/scan_liberty_target.txt /root/jam/wca4java/tests/actual/e2e/scan_liberty_target_2.txt  > /root/jam/wca4java/tests/actual/e2e/scan_liberty_target_diff.txt


############
echo "Ruuning the tests"
echo ""
##### run the tests

python /root/jam/wca4java/tests/jamJarTestsE2E_Liberty.py |& tee /root/jam/wca4java/tests/results/jamJarE2E_Liberty.txt
