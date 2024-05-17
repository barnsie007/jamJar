####run the jam Jar

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

############
echo ""
echo "addLocalDependenciesToApplication tests"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api addLocalDependenciesToApplication -a /root/source/modresorts/modresorts > /root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_noL.txt

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api addLocalDependenciesToApplication -a /root/source/modresorts/modresorts -l /root/jam/jamDependencies/db2jcc.jar

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api addLocalDependenciesToApplication -a /root/source/modresorts/modresorts -l /root/jam/jamDependencies/db2jcc_license_cisuz.jar

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api addLocalDependenciesToApplication -a /root/source/modresorts/modresorts -l /root/jam/jamDependencies/db2jcc_license_cu.jar

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api addLocalDependenciesToApplication -a /root/source/modresorts/modresorts -l /root/jam/jamDependencies/wmq.jmsra.rar

if [ -f /root/source/modresorts/modresorts/pom.xml.bak.1 ]; then
echo "pom is backed up"
else
echo "pom not backed up"
fi


if [ -f /root/source/modresorts/modresorts/src/main/liberty/lib/db2jcc.jar ]; then

   echo "db2jcc.jar is present" > /root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_db2jcc.jar.txt

else 
   echo "db2jcc.jar is not present" > /root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_db2jcc.jar.txt

fi

if [ -f /root/source/modresorts/modresorts/src/main/liberty/lib/db2jcc_license_cisuz.jar ]; then

   echo "db2jcc_license_cisuz.jar is present" > /root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_db2jcc_license_cisuz.jar.txt

else
   echo "db2jcc_license_cisuz.jar is not present" > /root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_db2jcc_license_cisuz.jar.txt

fi

if [ -f /root/source/modresorts/modresorts/src/main/liberty/lib/db2jcc_license_cu.jar ]; then

   echo "db2jcc_license_cu.jar is present" > /root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_db2jcc_license_cu.jar.txt

else
   echo "db2jcc_license_cu.jar is not present" > /root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_db2jcc_license_cu.jar.txt

fi

if [ -f /root/source/modresorts/modresorts/src/main/liberty/lib/wmq.jmsra.rar ]; then

   echo "wmq.jmsra.rar is present" > /root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_wmq.jmsra.rar.txt

else
   echo "wmq.jmsra.rar is not present" > /root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_wmq.jmsra.rar.txt

fi


##### addServerConfig
echo ""
echo "addServerConfig tests"
echo ""
rm -rf /root/source/modresorts/modresorts/src/main/liberty/config/

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api addServerConfig -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip

if [ -f /root/source/modresorts/modresorts/src/main/liberty/config/server.xml ]; then
  echo "server xml is present" > /root/jam/wca4java/tests/actual/addServerConfig.txt
else
  echo "server xml is not present" > /root/jam/wca4java/tests/actual/addServerConfig.txt
fi

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api addServerConfig -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/garage/garagesale.ear_migrationBundle.zip > /root/jam/wca4java/tests/actual/addServer_exists.txt

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api addServerConfig -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/garage/garagesale.ear_migrationBundle.zip -f

cat /root/source/modresorts/modresorts/src/main/liberty/config/server.xml | grep Gar > /root/jam/wca4java/tests/actual/addServerConfig_garage.txt


###getAllAvailableRecipes
echo ""
echo "getAllAvailableRecipes tests"
echo ""

### remove migration bundle from workspace

rm -rf /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip > /root/jam/wca4java/tests/actual/AllRecipes_mod.txt

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/modresorts/modresorts > /root/jam/wca4java/tests/actual/AllRecipes_NoMigrationBundle.txt

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/garage/garagesale.ear_migrationBundle.zip | sort -n > /root/jam/wca4java/tests/actual/AllRecipes_Garage.txt

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/sample/samplemdbejbear.ear_migrationBundle.zip > /root/jam/wca4java/tests/actual/AllRecipes_Sample.txt

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/cluster/2Recipes_migrationBundle.zip > /root/jam/wca4java/tests/actual/AllRecipes_Cluster.txt > /root/jam/wca4java/tests/actual/AllRecipes_Cluster.txt


#### getAllLibDependencies
echo ""
echo "getAllLibDependencies tests"
echo ""
### remove migration bundle from workspace

rm -rf /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllLibDependencies -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/sql/bdinqservicesit7.ear_migrationBundle.zip > /root/jam/wca4java/tests/actual/AllDependencies_Mod.txt

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllLibDependencies -a /root/source/modresorts/modresorts > /root/jam/wca4java/tests/actual/AllDependencies_Mod_NoBundle.txt

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllLibDependencies -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/sql/bdinqservicesit7.ear_migrationBundle.zip | sort -n > /root/jam/wca4java/tests/actual/AllDependencies_Mod_SQL.txt

rm -rf /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllLibDependencies -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/garage/garagesale.ear_migrationBundle.zip > /root/jam/wca4java/tests/actual/AllDependencies_Garage_NoDepend.txt



#### runRecipes
echo ""
echo "runRecipes tests"
echo ""

rm -rf /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/

rm -rf /root/source/modresorts/modresorts/src

cp -R /root/source/modresorts/modresorts/src_orig /root/source/modresorts/modresorts/src

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runAllRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip > /root/jam/wca4java/tests/actual/AllRecipes_Mod.txt

cat /root/jam/wca4java/tests/actual/AllRecipes_Mod.txt | grep WARNING > /root/jam/wca4java/tests/actual/AllRecipes_Mod_WARN.txt

cp /root/source/modresorts/modresorts/pom.xml /root/jam/wca4java/tests/actual/modpom

rm -rf /root/source/modresorts/modresorts/src
cp -R /root/source/modresorts/modresorts/src_orig /root/source/modresorts/modresorts/src

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runAllRecipes -a /root/source/modresorts/modresorts > /root/jam/wca4java/tests/actual/AllRecipes_Mod_NoBundle.txt

cat /root/jam/wca4java/tests/actual/AllRecipes_Mod_NoBundle.txt | grep WARNING > /root/jam/wca4java/tests/actual/AllRecipes_Mod_NoBundle_WARN.txt

rm -rf /root/source/modresorts/modresorts/src
cp -R /root/source/modresorts/modresorts/src_orig /root/source/modresorts/modresorts/src

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runAllRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/garage/garagesale.ear_migrationBundle.zip > /root/jam/wca4java/tests/actual/AllRecipes_Garage1.txt

cat /root/jam/wca4java/tests/actual/AllRecipes_Garage1.txt | grep WARNING > /root/jam/wca4java/tests/actual/AllRecipes_Garage_WARN.txt

cp /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/rewrite.yml /root/jam/wca4java/tests/actual/AllRecipes_Garage_rewrite.yml

rm -rf /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/

rm -rf /root/source/modresorts/modresorts/src
cp -R /root/source/modresorts/modresorts/src_orig /root/source/modresorts/modresorts/src

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runAllRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/noRecipe/aprs.ear_migrationBundle.zip > /root/jam/wca4java/tests/actual/AllRecipes_NoRecipe.txt


###runRecipes
echo ""
echo "run single recipe tests"
echo ""

rm -rf /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/

rm -rf /root/source/modresorts/modresorts/src
cp -R /root/source/modresorts/modresorts/src_orig /root/source/modresorts/modresorts/src

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip -r org.openrewrite.java.liberty.ServerName > /root/jam/wca4java/tests/actual/AllRecipes_Recipe_Server.txt

rm -rf /root/source/modresorts/modresorts/src
cp -R /root/source/modresorts/modresorts/src_orig /root/source/modresorts/modresorts/src

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip -r org.openrewrite.java.liberty.WebSphereUnavailableSSOCookieMethod > /root/jam/wca4java/tests/actual/AllRecipes_Recipe_org.openrewrite.java.liberty.WebSphereUnavailableSSOCookieMethod.txt

rm -rf /root/source/modresorts/modresorts/src
cp -R /root/source/modresorts/modresorts/src_orig /root/source/modresorts/modresorts/src


####runBuild
echo ""
echo "runBuild tests"
echo ""

rm -rf /root/source/modresorts/modresorts/target
java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/modresorts/modresorts 

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/modresorts/modresorts -b johnc > /root/jam/wca4java/tests/actual/runBuild_invalid.txt

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api runBuild -a /root/source/modresorts/modresorts -b clean package > /root/jam/wca4java/tests/actual/runBuild_CleanPackage.txt

if [ -f /root/source/modresorts/modresorts/target/modresorts-2.0.0.war ]; then
 echo "war file is created" > /root/jam/wca4java/tests/actual/runBuild.txt
else
 echo "war file did not get created" > /root/jam/wca4java/tests/actual/runBuild.txt
fi


### scan Application
echo ""
echo "scan Application tests"
echo ""
#####was855 / ibm6 / ee6 to Liberty / ibm8 /ee7

rm -rf /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/jam/jamEarFiles/modresorts-2.0.0.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=liberty --target-ee-version=ee7 --target-java-version=ibm8

if [ -f /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json ]; then
 echo "Scan zip exists" > /root/jam/wca4java/tests/actual/scanZip.txt
else
 echo "Scan zip does not exist" > /root/jam/wca4java/tests/actual/scanZip.txt
fi

###check scan files

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep targetAppServer > /root/jam/wca4java/tests/actual/modTargetServer_openLib.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep targetJava > /root/jam/wca4java/tests/actual/modTargetJava_8_ee7.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/modTargetServer_Lib.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep totalRulesFlaggedWithAutomatedFix | sort -n   > /root/jam/wca4java/tests/actual/modTargetServer_WAS.txt


rm -rf /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/

#### was855 / ibm6 / ee6 to was90 / ibm8 / ee7

##java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/jam/jamEarFiles/modresorts-2.0.0.war --source-app-server=was855 --source-ee-version=ee6 --source-java-version=ibm6 --target-app-server=was90 --target-ee-version=ee7 --target-java-version=ibm8

##cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0/modresorts-2.0.0.war.WASaaS.analyze.json | grep targetAppServer > /root/jam/wca4java/tests/actual/modTargetServer_WAS90.txt


rm -rf /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/

#### was90 / ibm8 / ee6 to was90 / java11
 
##java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/jam/jamEarFiles/modresorts-2.0.0.war --source-app-server=was90 --source-ee-version=ee6 --source-java-version=ibm8 --target-app-server=was90 --target-ee-version=ee7 --target-java-version=java11

##cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0/modresorts-2.0.0.war.ICp_Liberty.analyze.json | grep targetJava > /root/jam/wca4java/tests/actual/modTargetJava_11.txt

##java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/jam/jamEarFiles/modresorts-2.0.0.war --source-app-server=was90 --source-ee-version=ee6 --source-java-version=ibm8 --target-app-server=was90 --target-ee-version=ee7 --target-java-version=java17

##cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0/modresorts-2.0.0.war.ICp_Liberty.analyze.json | grep targetJava > /root/jam/wca4java/tests/actual/modTargetJava_17.txt

#####scan Jar file 

##java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/jam/jamDependencies/db2jcc.jar --source-app-server=was90 --source-ee-version=ee6 --source-java-version=ibm8 --target-app-server=was90 --target-ee-version=ee7 --target-java-version=java17

##cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/db2jcc/db2jcc.jar.ICp_Liberty.analyze.json | grep targetJava > /root/jam/wca4java/tests/actual/db2TargetJava_17.txt

rm -rf /root/.ibm_java_app_mod/

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api scanApplication -a /root/source/modresorts/modresorts/ -b /root/jam/jamEarFiles/modresorts-2.0.0.war --source-app-server=was90 --source-ee-version=ee6 --source-java-version=ibm8 --target-app-server=openLiberty --target-ee-version=ee7 --target-java-version=java17 

if [ -d /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json ]; then
 echo "Log Directory exists" > /root/jam/wca4java/tests/actual/logDir.txt
else
 echo "Log Directory does not exist" > /root/jam/wca4java/tests/actual/logDir.txt
fi

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep targetAppServer > /root/jam/wca4java/tests/actual/modTargetServer_openLiberty.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep targetJava > /root/jam/wca4java/tests/actual/modTargetJava_8_ee7_ol.txt

cat /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/binary_scanner_output/modresorts-2.0.0.war_AnalysisReport.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/modruleId.txt




#### getAnalysisReport
echo ""
echo "getAnalysisReport tests without -m"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAnalysisReport -a /root/source/modresorts/modresorts -f JSON > /root/jam/wca4java/tests/actual/WL_json.txt

###get rule help websphere liberty
echo ""
echo "rule help tests WebSphere Liberty"
echo ""

jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json > /root/jam/wca4java/tests/actual/pretty_anal.json

cat /root/jam/wca4java/tests/actual/pretty_anal.json | grep ruleId | sort -n > /root/jam/wca4java/tests/actual/ruleHelp_data.txt

cat /root/jam/wca4java/tests/actual/pretty_anal.json | grep ruleId | wc -l > /root/jam/wca4java/tests/actual/ruleHelp_count.txt

cat /root/jam/wca4java/tests/actual/pretty_anal.json | grep recipe | sort -n > /root/jam/wca4java/tests/actual/ruleHelp_recipe.txt

cat /root/jam/wca4java/tests/actual/pretty_anal.json | grep ruleHelpEncoded | sort -n | tail -n 1 | awk -F : '{print $2}' | tr -d "\"" | sed 's/^ *//g' | base64 --decode > /root/jam/wca4java/tests/actual/ruleHelp_url.txt

########




java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAnalysisReport -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip -f HTML  > /root/jam/wca4java/tests/actual/WL_html.txt

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAnalysisReport -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip -f JSON  > /root/jam/wca4java/tests/actual/OL_json.txt

#java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAnalysisReport -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip -f HTML  > /root/jam/wca4java/tests/actual/OL_html.txt


### get rule help for Open Liberty
echo ""
echo "rule help for open liberty tests"
echo ""

#jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json | grep ruleHelpLocationLocal | grep Database > /root/jam/wca4java/tests/actual/ruleHelp_data_ol.txt

#jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json | grep ruleHelpLocationLocal | grep WSSecurityHelperRevokeSSOCookies > /root/jam/wca4java/tests/actual/ruleHelp_cookies_ol.txt

#jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json | grep ruleHelpLocationLocal | grep ServerName > /root/jam/wca4java/tests/actual/ruleHelp_servername_ol.txt

#jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json | grep ruleHelpLocationLocal | grep ApplicationSecurity > /root/jam/wca4java/tests/actual/ruleHelp_appsecurity_ol.txt

#jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json | grep ruleHelpLocationLocal | grep FileSystemRule > /root/jam/wca4java/tests/actual/ruleHelp_filesystem_ol.txt

#jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json |  grep ruleHelpLocationLocal | grep InitialContext > /root/jam/wca4java/tests/actual/ruleHelp_initial_ol.txt

#jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json |  grep ruleHelpLocationLocal | grep UrlRule > /root/jam/wca4java/tests/actual/ruleHelp_url_ol.txt

#jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json |  grep ruleHelpLocationLocal | grep HiddenThirdPartyAPIInUseRule > /root/jam/wca4java/tests/actual/ruleHelp_hidden_ol.txt

#######

#java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAnalysisReport -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip -f JSON  > /root/jam/wca4java/tests/actual/tWAS_json.txt


#java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAnalysisReport -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip -f HTML > /root/jam/wca4java/tests/actual/tWAS_html.txt

### get rule help for tWAS 
echo ""
echo "rule help for tWAS tests"
echo ""

#jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json | grep ruleHelpLocationLocal | grep Database > /root/jam/wca4java/tests/actual/ruleHelp_data_twas.txt

#jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json | grep ruleHelpLocationLocal | grep ApplicationSecurity > /root/jam/wca4java/tests/actual/ruleHelp_appsecurity_twas.txt

#jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json | grep ruleHelpLocationLocal | grep FileSystemRule > /root/jam/wca4java/tests/actual/ruleHelp_filesystem_twas.txt

#jq '.' /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0/migration_bundle/reports/modresorts-2.0.0.war_AnalysisReport.json |  grep ruleHelpLocationLocal | grep UrlRule > /root/jam/wca4java/tests/actual/ruleHelp_url_twas.txt


#####

###getInventoryReport
echo ""
echo "getInventoryReport tests"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getInventoryReport -a /root/source/modresorts/modresorts  --format=JSON > /root/jam/wca4java/tests/actual/inv_json.txt

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getInventoryReport -a /root/source/modresorts/modresorts  --format=HTML > /root/jam/wca4java/tests/actual/inv_html.txt

### getTechnologyReport
echo ""
echo "getTechnologyReport tests"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getTechnologyReport -a /root/source/modresorts/modresorts  --format=JSON > /root/jam/wca4java/tests/actual/tech_json.txt

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getTechnologyReport -a /root/source/modresorts/modresorts  --format=HTML > /root/jam/wca4java/tests/actual/tech_html.txt





#### addContainerFile
echo ""
echo "addContainerFile tests"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api addContainerFile -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip 

if [ -f /root/source/modresorts/modresorts/Containerfile ]; then
 echo "Containerfile is present" > /root/jam/wca4java/tests/actual/container.txt
else
 echo "Containerfile is not present" > /root/jam/wca4java/tests/actual/container.txt
fi


#### getApplicationBinaryLocation

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getApplicationBinaryLocation -a /root/source/modresorts/modresorts/ > /root/jam/wca4java/tests/actual/appBinaryLoc.txt


#####get recipes for Garage ear

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/garage/OL/garagesale.earOL_migrationBundle.zip > /root/jam/wca4java/tests/actual/garageOL.txt


###different zip - no rule help

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAnalysisReport -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/noRule/modNoRule.zip -f JSON  > /root/jam/wca4java/tests/actual/ruleHelp_noRule.txt


### getApplicationWorkspace
echo ""
echo "getApplicationWorkspace tests"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getApplicationWorkspace -a /root/source/modresorts/modresorts > /root/jam/wca4java/tests/actual/wsDir.txt

sed -i 's/com.acme.modres/com_acme-modresorts.30/g' /root/source/modresorts/modresorts/pom.xml

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getApplicationWorkspace -a /root/source/modresorts/modresorts > /root/jam/wca4java/tests/actual/wsNewDir.txt


####cleanApplicationWorkspace
echo ""
echo "cleanApplicationWorkspace tests"
echo ""

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api cleanApplicationWorkspace  -a /root/source/modresorts/modresorts/

if [ ! -d /root/.ibm_java_app_mod/com_acme-modresorts.30_modresorts_2.0.0 ]; then
 echo "Workspace removed" > /root/jam/wca4java/tests/actual/WSnew.txt
else
 echo "Workspace present " > /root/jam/wca4java/tests/actual/WSnew.txt
fi


sed -i 's/com_acme-modresorts.30/com.acme.modres/g' /root/source/modresorts/modresorts/pom.xml


java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api getAllAvailableRecipes -a /root/source/modresorts/modresorts -m /root/jam/jamMigrationZips/modresorts/modresorts.ear_migrationBundle.zip

java -jar /root/jam/wca4java/jamJar/ta-jam-0.3.0.jar api cleanApplicationWorkspace  -a /root/source/modresorts/modresorts/

if [ ! -d /root/.ibm_java_app_mod/com.acme.modres_modresorts_2.0.0 ]; then
 echo "Workspace removed" > /root/jam/wca4java/tests/actual/WS.txt
else
 echo "Workspace present " > /root/jam/wca4java/tests/actual/WS.txt
fi



##### run the tests

python /root/jam/wca4java/tests/jamJarTests.py |& tee /root/jam/wca4java/tests/results/jamJar.txt
