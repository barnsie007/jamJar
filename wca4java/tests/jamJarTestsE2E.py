import unittest
import filecmp
import sys

class LearningCase(unittest.TestCase):



   def test_jam_e2e_runbuild(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/runBuild.txt', '/root/jam/wca4java/tests/expected/e2e/runBuild.txt'))

   def test_jam_e2e_scan_wl(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid.txt', '/root/jam/wca4java/tests/expected/e2e/scan_wl_ruleid.txt'))

   def test_jam_e2e_scan_ol(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid.txt', '/root/jam/wca4java/tests/expected/e2e/scan_ol_ruleid.txt'))

   def test_jam_e2e_scan_twas(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid.txt', '/root/jam/wca4java/tests/expected/e2e/scan_twas_ruleid.txt'))

   def test_jam_e2e_get_recipes(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/getrecipes.txt', '/root/jam/wca4java/tests/expected/e2e/getrecipes.txt'))

   def test_jam_e2e_run_recipes(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_WARN.txt', '/root/jam/wca4java/tests/expected/e2e/AllRecipes_Mod_WARN.txt'))

   def test_jam_e2e_pom(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/pome2e', '/root/jam/wca4java/tests/expected/e2e/pome2e'))

   def test_jam_e2e_runbuild_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/runBuild_2.txt', '/root/jam/wca4java/tests/expected/e2e/runBuild_2.txt'))

   def test_jam_e2e_scan_wl_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_2.txt', '/root/jam/wca4java/tests/expected/e2e/scan_wl_ruleid_2.txt'))

   def test_jam_e2e_scan_ol_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_2.txt', '/root/jam/wca4java/tests/expected/e2e/scan_ol_ruleid_2.txt'))

   def test_jam_e2e_scan_twas_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid_2.txt', '/root/jam/wca4java/tests/expected/e2e/scan_twas_ruleid_2.txt'))

   def test_jam_e2e_scan_wl_diff(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_diff.txt', '/root/jam/wca4java/tests/expected/e2e/scan_wl_ruleid_diff.txt'))

   def test_jam_e2e_scan_ol_diff(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_diff.txt', '/root/jam/wca4java/tests/expected/e2e/scan_ol_ruleid_diff.txt'))

   def test_jam_e2e_scan_twas_diff(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid_diff.txt', '/root/jam/wca4java/tests/expected/e2e/scan_twas_ruleid_diff.txt'))
 
   def test_jam_e2e_scan_wl_count(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_count.txt', '/root/jam/wca4java/tests/expected/e2e/scan_wl_ruleid_count.txt'))

   def test_jam_e2e_scan_wl_count_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_count_2.txt', '/root/jam/wca4java/tests/expected/e2e/scan_wl_ruleid_count_2.txt'))

   def test_jam_e2e_scan_time(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/check_timestamp.txt', '/root/jam/wca4java/tests/expected/e2e/check_timestamp.txt'))

   def test_jam_e2e_log(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/log.txt', '/root/jam/wca4java/tests/expected/e2e/log.txt'))
   
   def test_jam_e2e_mig(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/mig_anal_ruleid.txt', '/root/jam/wca4java/tests/expected/e2e/mig_anal_ruleid.txt'))

   def test_jam_e2e_diff(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/mig_bin_ruleid_diff.txt', '/root/jam/wca4java/tests/expected/e2e/mig_bin_ruleid_diff.txt'))



def main():
   unittest.main()

if __name__ == "__main__":
    main()

