import unittest
import filecmp
import sys

class LearningCase(unittest.TestCase):



   def test_jam_e2e_runbuild_gas(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/runBuild_gas.txt', '/root/jam/wca4java/tests/expected/e2e/runBuild_gas.txt'))

   def test_jam_e2e_scan_wl_gas(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_gas.txt', '/root/jam/wca4java/tests/expected/e2e/scan_wl_ruleid_gas.txt'))

   def test_jam_e2e_get_recipes_gas(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/getrecipes_gas.txt', '/root/jam/wca4java/tests/expected/e2e/getrecipes_gas.txt'))

   def test_jam_e2e_run_recipes_gas(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_WARN_gas.txt', '/root/jam/wca4java/tests/expected/e2e/AllRecipes_Mod_WARN_gas.txt'))

   def test_jam_e2e_runbuild_2_gas(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/runBuild_2_gas.txt', '/root/jam/wca4java/tests/expected/e2e/runBuild_2_gas.txt'))

   def test_jam_e2e_scan_wl_2_gas(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_2_gas.txt', '/root/jam/wca4java/tests/expected/e2e/scan_wl_ruleid_2_gas.txt'))

   def test_jam_e2e_scan_wl_diff_gas(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_wl_ruleid_diff_gas.txt', '/root/jam/wca4java/tests/expected/e2e/scan_wl_ruleid_diff_gas.txt'))
 












def main():
   unittest.main()

if __name__ == "__main__":
    main()

