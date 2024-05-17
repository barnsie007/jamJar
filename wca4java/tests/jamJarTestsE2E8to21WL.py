import unittest
import filecmp
import sys

class LearningCase(unittest.TestCase):



   def test_jam_e2e8to21wl_runbuild(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/runBuild.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/runBuild.txt'))

   def test_jam_e2e8to21wl_scan_wl(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_ruleid.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/scan_wl_ruleid.txt'))

   def test_jam_e2e8to21wl_scan_ol(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/scan_ol_ruleid.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/scan_ol_ruleid.txt'))

   def test_jam_e2e8to21wl_scan_twas(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/scan_twas_ruleid.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/scan_twas_ruleid.txt'))

   def test_jam_e2e8to21wl_get_recipes(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/getrecipes.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/getrecipes.txt'))

   def test_jam_e2e8to21wl_run_recipes(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/AllRecipes_Mod_WARN.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/AllRecipes_Mod_WARN.txt'))

   def test_jam_e2e8to21wl_runbuild_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/runBuild_2.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/runBuild_2.txt'))

   def test_jam_e2e8to21wl_target(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_target.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/scan_wl_target.txt'))

   def test_jam_e2e8to21wl_scan_wl_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_ruleid_2.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/scan_wl_ruleid_2.txt'))

   def test_jam_e2e8to21wl_scan_ol_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/scan_ol_ruleid_2.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/scan_ol_ruleid_2.txt'))

   def test_jam_e2e8to21wl_scan_twas_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/scan_twas_ruleid_2.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/scan_twas_ruleid_2.txt'))

   def test_jam_e2e8to21wl_scan_wl_diff(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_ruleid_diff.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/scan_wl_ruleid_diff.txt'))

   def test_jam_e2e8to21wl_scan_ol_diff(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/scan_ol_ruleid_diff.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/scan_ol_ruleid_diff.txt'))

   def test_jam_e2e8to21wl_scan_twas_diff(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/scan_twas_ruleid_diff.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/scan_twas_ruleid_diff.txt'))
 
   def test_jam_e2e8to21wl_scan_wl_count(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_ruleid_count.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/scan_wl_ruleid_count.txt'))

   def test_jam_e2e8to21wl_scan_wl_count_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/scan_wl_ruleid_count_2.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/scan_wl_ruleid_count_2.txt'))

   def test_jam_e2e8to21wl_scan_time(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/check_timestamp.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/check_timestamp.txt'))

   def test_jam_e2e8to21wl_base64(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e8to21wl/base64.txt', '/root/jam/wca4java/tests/expected/e2e8to21wl/base64.txt'))



def main():
   unittest.main()

if __name__ == "__main__":
    main()

