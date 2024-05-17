import unittest
import filecmp
import sys

class LearningCase(unittest.TestCase):



   def test_jam_e2e_runbuild_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/runBuild_acme.txt', '/root/jam/wca4java/tests/expected/e2e/runBuild_acme.txt'))

   def test_jam_e2e_scan_wl_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_acme.txt', '/root/jam/wca4java/tests/expected/e2e/scan_wl_ruleid_acme.txt'))

   def test_jam_e2e_scan_recipe_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_ol_acme.txt', '/root/jam/wca4java/tests/expected/e2e/scan_ol_acme.txt'))

   def test_jam_e2e_scan_count_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_ruleid_acme_count.txt', '/root/jam/wca4java/tests/expected/e2e/scan_ruleid_acme_count.txt'))

   def test_jam_e2e_get_recipes_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/getrecipes_acme.txt', '/root/jam/wca4java/tests/expected/e2e/getrecipes_acme.txt'))

   def test_jam_e2e_run_recipes_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_WARN_acme.txt', '/root/jam/wca4java/tests/expected/e2e/AllRecipes_Mod_WARN_acme.txt'))

   def test_jam_e2e_runbuild_2_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/runBuild_2_acme.txt', '/root/jam/wca4java/tests/expected/e2e/runBuild_2_acme.txt'))

   def test_jam_e2e_scan_wl_2_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_2_acme.txt', '/root/jam/wca4java/tests/expected/e2e/scan_wl_ruleid_2_acme.txt'))

   def test_jam_e2e_scan_ol_2_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_ol_acme_2', '/root/jam/wca4java/tests/expected/e2e/scan_ol_acme_2.txt'))

   def test_jam_e2e_scan_twas_2_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_ruleid_acme_count_2', '/root/jam/wca4java/tests/expected/e2e/scan_ruleid_acme_count_2.txt'))

   def test_jam_e2e_scan_wl_diff_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_diff_acme.txt', '/root/jam/wca4java/tests/expected/e2e/scan_wl_ruleid_diff_acme.txt'))

   def test_jam_e2e_scan_ol_diff_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_diff_acme.txt', '/root/jam/wca4java/tests/expected/e2e/scan_ol_ruleid_diff_acme.txt'))

   def test_jam_e2e_scan_twas_diff_acme(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_twas_ruleid_diff_acme.txt', '/root/jam/wca4java/tests/expected/e2e/scan_twas_ruleid_diff_acme.txt'))
 












def main():
   unittest.main()

if __name__ == "__main__":
    main()

