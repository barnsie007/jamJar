####run the jam Jar


####
#addLocalDependenciesToApplication

##clean up dependencies

rm -rf /root/jam/wca4java/tests/logs

#### clone down the repo 

cd /root/source/websphere-cafe/
rm -rf *
git clone https://github.com/Azure-Samples/websphere-cafe.git

sleep 10 

cd /root/jam/wca4java/tests/



####run a Build
echo "Run Build Web Cafe Web"
echo ""
java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web -b clean package > /root/jam/wca4java/tests/actual/e2e/runBuild_CleanPackage_cafe.txt

if [ -f /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web/target/websphere-cafe.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e/runBuild_cafe.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e/runBuild_cafe.txt
fi

### run a scan on the war file
echo "run a scan on the war file"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web -b /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web/target/websphere-cafe.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=ibm8


jq '.' /root/.ibm_java_app_mod/null_websphere-cafe-web_null/migration_bundle/reports/websphere-cafe.war_AnalysisReport.json > /root/jam/wca4java/tests/actual/e2e/pretty_scan_ol_ruleid_cafe.txt
cat /root/jam/wca4java/tests/actual/e2e/pretty_scan_ol_ruleid_cafe.txt | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_cafe.txt


#######
echo "get recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web --logging | tail -n 2 > /root/jam/wca4java/tests/actual/e2e/getrecipes_cafe.txt


###
echo "run the recipes"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runAllRecipes -a /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web  > /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_cafe.txt

cat /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_cafe.txt | grep INFO | awk -F : '{print $4}' > /root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_WARN_cafe.txt
######


echo "remove the jar file "
echo ""
rm -rf /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web/target

#######
echo "run build "
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web -b clean package > /root/jam/wca4java/tests/actual/e2e/runBuild_CleanPackage_2_cafe.txt


if [ -f /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web/target/websphere-cafe.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/e2e/runBuild_2_cafe.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/e2e/runBuild_2_cafe.txt
fi

####
echo "run scan again"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web -b /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web/target/websphere-cafe.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=ibm8

jq '.' /root/.ibm_java_app_mod/null_websphere-cafe-web_null/migration_bundle/reports/websphere-cafe.war_AnalysisReport.json > /root/jam/wca4java/tests/actual/e2e/pretty_scan_ol_ruleid_2_cafe.txt
cat /root/jam/wca4java/tests/actual/e2e/pretty_scan_ol_ruleid_2_cafe.txt | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_2_cafe.txt


######
echo "get the difference between the files"
echo ""


diff /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_cafe.txt /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_2_cafe.txt  > /root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_diff_cafe.txt

###
echo "run get source java"
java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getSourceJavaVersion -a /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web > /root/jam/wca4java/tests/actual/e2e/sourceJava_cafe.txt

echo "run get target java"

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getTargetJavaVersions -a /root/source/websphere-cafe/websphere-cafe/websphere-cafe-web | sort -n > /root/jam/wca4java/tests/actual/e2e/targetJava_cafe.txt

############
echo "Ruuning the tests"
echo ""
##### run the tests

python /root/jam/wca4java/tests/jamJarTestsE2E_01.py |& tee /root/jam/wca4java/tests/results/jamJarE2E_01.txt
