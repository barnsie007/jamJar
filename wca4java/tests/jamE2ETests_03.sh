####run the jam Jar


####
#addLocalDependenciesToApplication

##clean up dependencies

rm -rf /root/jam/wca4java/tests/logs

#### clone down the repo 

cd /root/source/acme/
rm -rf *
git clone git@github.ibm.com:was-svt/Acmeair-Customer-Service.git

sleep 10 

cd /root/jam/wca4java/tests/


####copy back java to java 21 

mv -f /usr/bin/java /usr/bin/java_orig

cp -f -R /usr/bin/java_21 /usr/bin/java


####run a Build
echo "Run Build Web Cafe Web"
echo ""
java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/acme/Acmeair-Customer-Service -b clean package > /root/jam/wca4java/tests/actual/e2e/runBuild_CleanPackage_acme.txt

if [ -f /root/source/acme/Acmeair-Customer-Service/target/acmeair-customerservice-java-6.0.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e/runBuild_acme.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e/runBuild_acme.txt
fi

### run a scan on the war file
echo "run a scan on the war file"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/acme/Acmeair-Customer-Service -b /root/source/acme/Acmeair-Customer-Service/target/acmeair-customerservice-java-6.0.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=ibm8

cat /root/.ibm_java_app_mod/acmeair-customerservice-java_acmeair-customerservice-java_6.0/binary_scanner_output/acmeair-customerservice-java-6.0.war_AnalysisReport.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_acme.txt

cat /root/.ibm_java_app_mod/acmeair-customerservice-java_acmeair-customerservice-java_6.0/binary_scanner_output/acmeair-customerservice-java-6.0.war_AnalysisReport.json | grep recipe | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_ol_acme.txt

cat /root/.ibm_java_app_mod/acmeair-customerservice-java_acmeair-customerservice-java_6.0/binary_scanner_output/acmeair-customerservice-java-6.0.war_AnalysisReport.json | grep ruleId | wc -l > /root/jam/wca4java/tests/actual/e2e/scan_ruleid_acme_count.txt

#######
echo "get recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/acme/Acmeair-Customer-Service  > /root/jam/wca4java/tests/actual/e2e/getrecipes_acme.txt


###
echo "run the recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runAllRecipes -a /root/source/acme/Acmeair-Customer-Service  > /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_acme.txt

cat /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_acme.txt | grep INFO | awk -F : '{print $4}' > /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_WARN_acme.txt
######


echo "remove the jar file "
echo ""
rm -rf /root/source/acme/Acmeair-Customer-Service/target/

#######
echo "run build "
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/acme/Acmeair-Customer-Service -b clean package > /root/jam/wca4java/tests/actual/e2e/runBuild_CleanPackage_2_acme.txt


if [ -f /root/source/acme/Acmeair-Customer-Service/target/acmeair-customerservice-java-6.0.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e/runBuild_2_acme.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e/runBuild_2_acme.txt
fi

####
echo "run scan again"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source//acme/Acmeair-Customer-Service -b /root/source/acme/Acmeair-Customer-Service/target/acmeair-customerservice-java-6.0.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=ibm8

cat /root/.ibm_java_app_mod/acmeair-customerservice-java_acmeair-customerservice-java_6.0/binary_scanner_output/acmeair-customerservice-java-6.0.war_AnalysisReport.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_2_acme.txt

cat /root/.ibm_java_app_mod/acmeair-customerservice-java_acmeair-customerservice-java_6.0/binary_scanner_output/acmeair-customerservice-java-6.0.war_AnalysisReport.json | grep recipe | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_ol_acme_2.txt

cat /root/.ibm_java_app_mod/acmeair-customerservice-java_acmeair-customerservice-java_6.0/binary_scanner_output/acmeair-customerservice-java-6.0.war_AnalysisReport.json | grep ruleId | wc -l > /root/jam/wca4java/tests/actual/e2e/scan_ruleid_acme_count_2.txt

######
echo "get the difference between the files"
echo ""

diff /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_acme.txt /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_2_acme.txt  > /root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_diff_acme.txt

diff /root/jam/wca4java/tests/actual/e2e/scan_ol_acme.txt /root/jam/wca4java/tests/actual/e2e/scan_ol_acme_2.txt  > /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_diff_acme.txt

diff /root/jam/wca4java/tests/actual/e2e/scan_ruleid_acme_count.txt /root/jam/wca4java/tests/actual/e2e/scan_ruleid_acme_count.txt  > /root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid_diff_acme.txt

####copy back java to java 8 

mv -f /usr/bin/java /usr/bin/java_orig

cp -f -R /usr/bin/java_18 /usr/bin/java

############
echo "Ruuning the tests"
echo ""
##### run the tests

python /root/jam/wca4java/tests/jamJarTestsE2E_03.py |& tee /root/jam/wca4java/tests/results/jamJarE2E_03.txt
