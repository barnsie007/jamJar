####run the jam Jar


####
#addLocalDependenciesToApplication

##clean up dependencies

rm -rf /root/jam/wca4java/tests/logs

#### clone down the repo 

cd /root/source/modresortsSE/
rm -rf *
git clone -b java-se-issues git@github.ibm.com:TransformationAdvisor/modresorts.git

sleep 10 

cd /root/jam/wca4java/tests/



####run a Build
echo "Run Build"
echo ""
java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/modresortsSE/modresorts -b clean package > /root/jam/wca4java/tests/actual/e2e/runBuild_CleanPackageSE.txt

if [ -f /root/source/modresortsSE/modresorts/target/modresorts-2.0.0.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e/runBuildSE.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e/runBuildSE.txt
fi

### run a scan on the war file
echo "run a scan on the war file"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresortsSE/modresorts/ -b /root/source/modresortsSE/modresorts/target/modresorts-2.0.0.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=ibm8

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0/modresorts-2.0.0.war.ICp_Liberty.WebSphereLiberty.analyze.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleidSE.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0/modresorts-2.0.0.war.ICp_Liberty.analyze.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleidSE.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0/modresorts-2.0.0.war.WASaaS.analyze.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_twas_ruleidSE.txt

#######
echo "get recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/modresortsSE/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip > /root/jam/wca4java/tests/actual/e2e/getrecipesSE.txt

###
echo "run the recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runAllRecipes -a /root/source/modresortsSE/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip > /root/jam/wca4java/tests/actual/e2e/AllRecipes_ModSE.txt

cat /root/jam/wca4java/tests/actual/e2e/AllRecipes_ModSE.txt | grep INFO | awk -F : '{print $4}' > /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_WARNSE.txt
######

echo "remove the jar file "
echo ""
rm -rf /root/source/modresortsSE/modresorts/target

#######
echo "run build "
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/modresortsSE/modresorts -b clean package > /root/jam/wca4java/tests/actual/e2e/runBuild_CleanPackage_2SE.txt


if [ -f /root/source/modresortsSE/modresorts/target/modresorts-2.0.0.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e/runBuild_2SE.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e/runBuild_2SE.txt
fi

####
echo "run scan again"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresortsSE/modresorts/ -b /root/source/modresortsSE/modresorts/target/modresorts-2.0.0.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=ibm8

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0/modresorts-2.0.0.war.ICp_Liberty.WebSphereLiberty.analyze.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_2SE.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0/modresorts-2.0.0.war.ICp_Liberty.analyze.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_2SE.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0/modresorts-2.0.0.war.WASaaS.analyze.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid_2SE.txt

######
echo "get the difference between the files"
echo ""

diff /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleidSE.txt /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_2SE.txt  > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_diffSE.txt

diff /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleidSE.txt /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_2SE.txt  > /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_diffSE.txt

diff /root/jam/wca4java/tests/actual/e2e/scan_twas_ruleidSE.txt /root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid_2SE.txt  > /root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid_diffSE.txt

############
echo "Ruuning the tests"
echo ""
##### run the tests

python /root/jam/wca4java/tests/jamJarTestsE2E_O4.py |& tee /root/jam/wca4java/tests/results/jamJarE2E_04.txt
