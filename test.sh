lib=("FailureLog_Manager.jar" "Station_Entities.jar" "Store_ItemEntities.jar" "Store_SaleEntities.jar" "FailureLog_Entities.jar" "Sequence_Entities.jar" "StationSecure_Entities.jar" "Station_Entities.jar" "Store_ItemEntities.jar" "Store_SaleEntities.jar")

for recipe in ${!lib[@]}; do
 mkdir /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib/test
 echo "what is ${lib[$recipe]}"
 cp /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib/${lib[$recipe]} /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib/test
 cd /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib/test
/root/java/jdk-17.0.3.1/bin/jar -xf /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib/${lib[$recipe]}
 rm -rf /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib/${lib[$recipe]}
cp /root/source/gas/mvn-tWAS-gasstationmodule/pom.xml /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib/test/
cd /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib/test/
mvn rewrite:run
#java -jar /root/jam/wca4java/jamJar/ta-jam-0.1.0-SNAPSHOT.jar api runAllRecipes -a /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib -m /root/jam/jamMigrationZips/gas/OL/gasstationmodule.war_migrationBundle.zip
 /root/java/jdk-17.0.3.1/bin/jar -cf /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib/test/${lib[$recipe]} *
 cp /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib/test/${lib[$recipe]} /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib/
 #cd ..
 rm -rf /root/source/gas/mvn-tWAS-gasstationmodule/src/main/webapp/WEB-INF/lib/test
done
