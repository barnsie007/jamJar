import unittest
import filecmp
import sys

class LearningCase(unittest.TestCase):



   def test_jam_e2e_runbuild(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/runBuild_lib.txt', '/root/jam/wca4java/tests/expected/e2e/runBuild_lib.txt'))

   def test_jam_e2e_scan_wl(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_liberty_ruleid.txt', '/root/jam/wca4java/tests/expected/e2e/scan_liberty_ruleid.txt'))

   def test_jam_e2e_scan_ol(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_liberty_target.txt', '/root/jam/wca4java/tests/expected/e2e/scan_liberty_target.txt'))

   def test_jam_e2e_scan_twas(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_liberty_ruleid_count.txt', '/root/jam/wca4java/tests/expected/e2e/scan_liberty_ruleid_count.txt'))

   def test_jam_e2e_get_recipes(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/getrecipes_liberty.txt', '/root/jam/wca4java/tests/expected/e2e/getrecipes_liberty.txt'))

   def test_jam_e2e_run_recipes(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_WARN_liberty.txt', '/root/jam/wca4java/tests/expected/e2e/AllRecipes_Mod_WARN_liberty.txt'))

   def test_jam_e2e_runbuild_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/runBuild_lib_2.txt', '/root/jam/wca4java/tests/expected/e2e/runBuild_lib_2.txt'))

   def test_jam_e2e_scan_wl_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_liberty_ruleid_2.txt', '/root/jam/wca4java/tests/expected/e2e/scan_liberty_ruleid_2.txt'))

   def test_jam_e2e_scan_ol_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_liberty_target_2.txt', '/root/jam/wca4java/tests/expected/e2e/scan_liberty_target_2.txt'))

   def test_jam_e2e_scan_twas_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_liberty_ruleid_count_2.txt', '/root/jam/wca4java/tests/expected/e2e/scan_liberty_ruleid_count_2.txt'))

   def test_jam_e2e_scan_wl_diff(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_liberty_ruleid_diff.txt', '/root/jam/wca4java/tests/expected/e2e/scan_liberty_ruleid_diff.txt'))

   def test_jam_e2e_scan_ol_diff(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_liberty_target_diff.txt', '/root/jam/wca4java/tests/expected/e2e/scan_liberty_target_diff.txt'))













def main():
   unittest.main()

if __name__ == "__main__":
    main()

