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

echo "build war with java 8"
####build war with java 8

mv -f /usr/bin/java /usr/bin/java_orig
cp -f -R /usr/bin/java_18 /usr/bin/java


###########

####run a Build
echo "Run Build"
echo ""
java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/modresorts/modresorts -b clean package > /root/jam/wca4java/tests/actual/e2e8to21wl/runBuild_CleanPackage.txt

if [ -f /root/source/modresorts/modresorts/target/modresorts-2.0.0.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e8to21wl/runBuild.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e8to21wl/runBuild.txt
fi

### run a scan on the war file
echo "run a scan on the war file"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/source/modresorts/modresorts/target/modresorts-2.0.0.war --source-app-server=liberty --source-ee-version=ee7 --source-java-version=ibm8 --target-app-server=liberty --target-ee-version=ee7 --target-java-version=java21

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_ruleid.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep target | sort -n > /root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_target.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_TechnologyReport.json | grep excludePackages | sort -n > /root/jam/wca4java/tests/actual/e2e8to21wl/scan_ol_ruleid.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_InventoryReport.json | grep archiveName | sort -n > /root/jam/wca4java/tests/actual/e2e8to21wl/scan_twas_ruleid.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | wc -l > /root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_ruleid_count.txt
#######
echo "get recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/modresorts/modresorts > /root/jam/wca4java/tests/actual/e2e8to21wl/getrecipes.txt

echo "setup env to java 21"
###setup env to java 21

mv -f /usr/bin/java /usr/bin/java_orig
cp -f -R /usr/bin/java_21 /usr/bin/java

sed -i 's/1.8/21/g' /root/source/modresorts/modresorts/pom.xml


###
echo "run the recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runAllRecipes -a /root/source/modresorts/modresorts  > /root/jam/wca4java/tests/actual/e2e8to21wl/AllRecipes_Mod.txt

cat /root/jam/wca4java/tests/actual/e2e8to21wl/AllRecipes_Mod.txt | grep INFO | awk -F : '{print $4}' > /root/jam/wca4java/tests/actual/e2e8to21wl/AllRecipes_Mod_WARN.txt
######

echo "remove the jar file "
echo ""
rm -rf /root/source/modresorts/modresorts/target

######


#######
echo "run build "
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/modresorts/modresorts -b clean package > /root/jam/wca4java/tests/actual/e2e8to21wl/runBuild_CleanPackage_2.txt


if [ -f /root/source/modresorts/modresorts/target/modresorts-2.0.0.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e8to21wl/runBuild_2.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e8to21wl/runBuild_2.txt
fi

####
echo "run scan again"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/source/modresorts/modresorts/target/modresorts-2.0.0.war --source-app-server=liberty --source-ee-version=ee7 --source-java-version=ibm8 --target-app-server=liberty --target-ee-version=ee7 --target-java-version=java21

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_ruleid_2.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_TechnologyReport.json | grep excludePackages | sort -n > /root/jam/wca4java/tests/actual/e2e8to21wl/scan_ol_ruleid_2.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_InventoryReport.json | grep archiveName | sort -n > /root/jam/wca4java/tests/actual/e2e8to21wl/scan_twas_ruleid_2.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | wc -l > /root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_ruleid_count_2.txt
######
echo "get the difference between the files"
echo ""

diff /root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_ruleid.txt /root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_ruleid_2.txt  > /root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_ruleid_diff.txt

diff /root/jam/wca4java/tests/actual/e2e8to21wl/scan_ol_ruleid.txt /root/jam/wca4java/tests/actual/e2e8to21wl/scan_ol_ruleid_2.txt  > /root/jam/wca4java/tests/actual/e2e8to21wl/scan_ol_ruleid_diff.txt

diff /root/jam/wca4java/tests/actual/e2e8to21wl/scan_twas_ruleid.txt /root/jam/wca4java/tests/actual/e2e8to21wl/scan_twas_ruleid_2.txt  > /root/jam/wca4java/tests/actual/e2e8to21wl/scan_twas_ruleid_diff.txt

####get the timestamp

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getMigrationBundleGenerationDateAndTime -a /root/source/modresorts/modresorts > /root/jam/wca4java/tests/actual/e2e8to21wl/timestamp.txt

if [ -s /root/jam/wca4java/tests/actual/e2e8to21wl/timestamp.txt ]; then
 echo "timestamp file is not empty" > /root/jam/wca4java/tests/actual/e2e8to21wl/check_timestamp.txt
else
 echo "timestamp file is empty" > /root/jam/wca4java/tests/actual/e2e8to21wl/check_timestamp.txt
fi


#####base 64 rule help
jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json > /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.txt | grep ruleHelpEncoded | sort -n | tail -n 1 | awk -F : '{print $2}' | tr -d "\"" | sed 's/^ *//g' | base64 --decode  > /root/jam/wca4java/tests/actual/e2e8to21wl/base64.txt



####copy back java to java 8

mv -f /usr/bin/java /usr/bin/java_orig

cp -f -R /usr/bin/java_18 /usr/bin/java


############
echo "Ruuning the tests"
echo ""
##### run the tests

python /root/jam/wca4java/tests/jamJarTestsE2E8to21WL.py |& tee /root/jam/wca4java/tests/results/jamJarE2E8to21WL.txt
