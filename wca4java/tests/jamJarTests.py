import unittest
import filecmp
import sys

class LearningCase(unittest.TestCase):



   def test_jam_addlocaldepend_db2jcc(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_db2jcc.jar.txt', '/root/jam/wca4java/tests/expected/addLocalDependenciesToApplication_db2jcc.jar.txt'))

   def test_jam_addlocaldepend_db2cuz(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_db2jcc_license_cisuz.jar.txt', '/root/jam/wca4java/tests/expected/addLocalDependenciesToApplication_db2jcc_license_cisuz.jar.txt'))

   def test_jam_addlocaldepend_db2cu(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_db2jcc_license_cu.jar.txt', '/root/jam/wca4java/tests/expected/addLocalDependenciesToApplication_db2jcc_license_cu.jar.txt'))

   def test_jam_addlocaldepend_mq(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/addLocalDependenciesToApplication_wmq.jmsra.rar.txt', '/root/jam/wca4java/tests/expected/addLocalDependenciesToApplication_wmq.jmsra.rar.txt'))

   def test_jam_addserverconfig(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/addServerConfig.txt', '/root/jam/wca4java/tests/expected/addServerConfig.txt'))
  
   def test_jam_addserverconfig_garage(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/addServerConfig_garage.txt', '/root/jam/wca4java/tests/expected/addServerConfig_garage.txt')) 

   def test_jam_allrecipes(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllRecipes_mod.txt', '/root/jam/wca4java/tests/expected/AllRecipes_mod.txt'))
  
   def test_jam_allrecipes_pom(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/modpom', '/root/jam/wca4java/tests/expected/modpom'))
 
   def test_jam_allrecipes_nobundle(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllRecipes_NoMigrationBundle.txt', '/root/jam/wca4java/tests/expected/AllRecipes_NoMigrationBundle.txt'))

   def test_jam_allrecipes_garage(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllRecipes_Garage.txt', '/root/jam/wca4java/tests/expected/AllRecipes_Garage.txt'))

   def test_jam_allrecipes_sample(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllRecipes_Sample.txt', '/root/jam/wca4java/tests/expected/AllRecipes_Sample.txt'))

   def test_jam_allrecipes_cluster(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllRecipes_Cluster.txt', '/root/jam/wca4java/tests/expected/AllRecipes_Cluster.txt'))

   def test_jam_alllibs(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllDependencies_Mod.txt', '/root/jam/wca4java/tests/expected/AllDependencies_Mod.txt'))
 
   def test_jam_alllibs_nobundle(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllDependencies_Mod_NoBundle.txt', '/root/jam/wca4java/tests/expected/AllDependencies_Mod_NoBundle.txt'))

   def test_jam_alllibs_sql(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllDependencies_Mod_SQL.txt', '/root/jam/wca4java/tests/expected/AllDependencies_Mod_SQL.txt'))

   def test_jam_alllibs_nodepend(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllDependencies_Garage_NoDepend.txt', '/root/jam/wca4java/tests/expected/AllDependencies_Garage_NoDepend.txt'))

   def test_jam_runrecipe(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllRecipes_Mod_WARN.txt', '/root/jam/wca4java/tests/expected/AllRecipes_Mod_WARN.txt'))

   def test_jam_runreceipe_nobundle(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllRecipes_Mod_NoBundle_WARN.txt', '/root/jam/wca4java/tests/expected/AllRecipes_Mod_NoBundle_WARN.txt'))

   def test_jam_runreceipe_garage(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllRecipes_Garage_rewrite.yml', '/root/jam/wca4java/tests/expected/AllRecipes_Garage_rewrite.yml'))

   def test_jam_runreceipe_norecipe(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/AllRecipes_NoRecipe.txt', '/root/jam/wca4java/tests/expected/AllRecipes_NoRecipe.txt'))

   def test_jam_runbuild(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/runBuild_invalid.txt', '/root/jam/wca4java/tests/expected/runBuild_invalid.txt'))

   def test_jam_runbuild(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/runBuild.txt', '/root/jam/wca4java/tests/expected/runBuild.txt'))
  
   def test_jam_scanbuild(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/scanZip.txt', '/root/jam/wca4java/tests/expected/scanZip.txt'))

   def test_jam_scanbuild_target(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/modTargetServer_openLib.txt', '/root/jam/wca4java/tests/expected/modTargetServer_openLib.txt'))
 
   def test_jam_scanbuild_java(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/modTargetJava_8_ee7.txt', '/root/jam/wca4java/tests/expected/modTargetJava_8_ee7.txt'))

   def test_jam_scanbuild_target_lib(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/modTargetServer_Lib.txt', '/root/jam/wca4java/tests/expected/modTargetServer_Lib.txt'))

   def test_jam_scanbuild_target_was(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/modTargetServer_WAS.txt', '/root/jam/wca4java/tests/expected/modTargetServer_WAS.txt'))

 #  def test_jam_scanbuild_target_was90(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/modTargetServer_WAS90.txt', '/root/jam/wca4java/tests/expected/modTargetServer_WAS90.txt'))

 #  def test_jam_scanbuild_target_java11(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/modTargetJava_11.txt', '/root/jam/wca4java/tests/expected/modTargetJava_11.txt'))

 #  def test_jam_scanbuild_target_java17(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/modTargetJava_17.txt', '/root/jam/wca4java/tests/expected/modTargetJava_17.txt'))
 
 #  def test_jam_scanbuild_target_db2_java17(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/db2TargetJava_17.txt', '/root/jam/wca4java/tests/expected/db2TargetJava_17.txt'))

   def test_jam_removews(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS.txt', '/root/jam/wca4java/tests/expected/WS.txt'))

   def test_jam_removenewws(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WSnew.txt', '/root/jam/wca4java/tests/expected/WSnew.txt'))

   def test_jam_wsdir(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/wsDir.txt', '/root/jam/wca4java/tests/expected/wsDir.txt'))

   def test_jam_wsnewdir(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/wsNewDir.txt', '/root/jam/wca4java/tests/expected/wsNewDir.txt'))
  
   def test_jam_anal_json_wl(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WL_json.txt', '/root/jam/wca4java/tests/expected/WL_json.txt'))

   def test_jam_anal_html_wl(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WL_html.txt', '/root/jam/wca4java/tests/expected/WL_html.txt'))

   def test_jam_anal_json_ol(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/OL_json.txt', '/root/jam/wca4java/tests/expected/OL_json.txt'))

 #  def test_jam_anal_html_ol(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/OL_html.txt', '/root/jam/wca4java/tests/expected/OL_html.txt'))

  # def test_jam_anal_json_twas(self):
  #      self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/tWAS_json.txt', '/root/jam/wca4java/tests/expected/tWAS_json.txt'))

  # def test_jam_anal_html_twas(self):
  #      self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/tWAS_html.txt', '/root/jam/wca4java/tests/expected/tWAS_html.txt'))

   def test_jam_inv_html(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/inv_html.txt', '/root/jam/wca4java/tests/expected/inv_html.txt'))

   def test_jam_inv_json(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/inv_json.txt', '/root/jam/wca4java/tests/expected/inv_json.txt'))

   def test_jam_tech_json(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/tech_json.txt', '/root/jam/wca4java/tests/expected/tech_json.txt'))

   def test_jam_tech_html(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/tech_html.txt', '/root/jam/wca4java/tests/expected/tech_html.txt'))

   def test_jam_container(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/container.txt', '/root/jam/wca4java/tests/expected/container.txt'))

   def test_jam_container(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/appBinaryLoc.txt', '/root/jam/wca4java/tests/expected/appBinaryLoc.txt'))

   def test_jam_rulehelp_websphere_rule(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_data.txt', '/root/jam/wca4java/tests/expected/ruleHelp_data.txt'))

   def test_jam_rulehelp_websphere_count(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_count.txt', '/root/jam/wca4java/tests/expected/ruleHelp_count.txt'))

   def test_jam_rulehelp_websphere_ruleHelp_recipe(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_recipe.txt', '/root/jam/wca4java/tests/expected/ruleHelp_recipe.txt'))

   def test_jam_rulehelp_websphere_decode(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_url.txt', '/root/jam/wca4java/tests/expected/ruleHelp_url.txt'))

  # def test_jam_rulehelp_websphere_filesystem(self):
  #      self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_filesystem.txt', '/root/jam/wca4java/tests/expected/ruleHelp_filesystem.txt'))

  # def test_jam_rulehelp_websphere_initial(self):
  #      self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_initial.txt', '/root/jam/wca4java/tests/expected/ruleHelp_initial.txt'))

  # def test_jam_rulehelp_websphere_url(self):
  #      self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_url.txt', '/root/jam/wca4java/tests/expected/ruleHelp_url.txt'))

  # def test_jam_rulehelp_websphere_data_ol(self):
  #      self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_data_ol.txt', '/root/jam/wca4java/tests/expected/ruleHelp_data_ol.txt'))

  # def test_jam_rulehelp_websphere_cookies_ol(self):
  #      self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_cookies_ol.txt', '/root/jam/wca4java/tests/expected/ruleHelp_cookies_ol.txt'))

 #  def test_jam_rulehelp_websphere_servername_ol(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_servername_ol.txt', '/root/jam/wca4java/tests/expected/ruleHelp_servername_ol.txt'))

 #  def test_jam_rulehelp_websphere_security_ol(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_appsecurity_ol.txt', '/root/jam/wca4java/tests/expected/ruleHelp_appsecurity_ol.txt'))

 #  def test_jam_rulehelp_websphere_filesystem_ol(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_filesystem_ol.txt', '/root/jam/wca4java/tests/expected/ruleHelp_filesystem_ol.txt'))

 #  def test_jam_rulehelp_websphere_initial_ol(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_initial_ol.txt', '/root/jam/wca4java/tests/expected/ruleHelp_initial_ol.txt'))

 #  def test_jam_rulehelp_websphere_url_ol(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_url_ol.txt', '/root/jam/wca4java/tests/expected/ruleHelp_url_ol.txt'))
  
 #  def test_jam_rulehelp_websphere_data_twas(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_data_twas.txt', '/root/jam/wca4java/tests/expected/ruleHelp_data_twas.txt'))

 #  def test_jam_rulehelp_websphere_security_twas(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_appsecurity_twas.txt', '/root/jam/wca4java/tests/expected/ruleHelp_appsecurity_twas.txt'))

 #  def test_jam_rulehelp_websphere_filesystem_twas(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_filesystem_twas.txt', '/root/jam/wca4java/tests/expected/ruleHelp_filesystem_twas.txt'))

 #  def test_jam_rulehelp_websphere_url_twas(self):
 #       self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_url_twas.txt', '/root/jam/wca4java/tests/expected/ruleHelp_url_twas.txt'))

   def test_jam_rulehelp_websphere_url_nohelp(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/ruleHelp_noRule.txt', '/root/jam/wca4java/tests/expected/ruleHelp_noRule.txt'))

   def test_jam_recipe_garage_ol(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/garageOL.txt', '/root/jam/wca4java/tests/expected/garageOL.txt'))

   def test_jam_mod_target_ol(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/modTargetServer_openLiberty.txt', '/root/jam/wca4java/tests/expected/modTargetServer_openLiberty.txt'))

   def test_jam_mod_java_ol(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/modTargetJava_8_ee7_ol.txt', '/root/jam/wca4java/tests/expected/modTargetJava_8_ee7_ol.txt'))

   def test_jam_mod_ruleid_ol(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/modruleId.txt', '/root/jam/wca4java/tests/expected/modruleId.txt'))




def main():
   unittest.main()

if __name__ == "__main__":
    main()

