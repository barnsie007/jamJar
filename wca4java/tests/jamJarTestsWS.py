import unittest
import filecmp
import sys

class LearningCase(unittest.TestCase):



   def test_jam_WS_runbuild(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/runBuild.txt', '/root/jam/wca4java/tests/expected/WS/runBuild.txt'))

   def test_jam_WS_scan_wl(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/scan_wl_ruleid.txt', '/root/jam/wca4java/tests/expected/WS/scan_wl_ruleid.txt'))

   def test_jam_WS_scan_ol(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/scan_ol_ruleid.txt', '/root/jam/wca4java/tests/expected/WS/scan_ol_ruleid.txt'))

   def test_jam_WS_scan_twas(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/scan_twas_ruleid.txt', '/root/jam/wca4java/tests/expected/WS/scan_twas_ruleid.txt'))

   def test_jam_WS_get_recipes(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/getrecipes.txt', '/root/jam/wca4java/tests/expected/WS/getrecipes.txt'))

   def test_jam_WS_run_recipes(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/AllRecipes_Mod_WARN.txt', '/root/jam/wca4java/tests/expected/WS/AllRecipes_Mod_WARN.txt'))

   def test_jam_WS_runbuild_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/runBuild_2.txt', '/root/jam/wca4java/tests/expected/WS/runBuild_2.txt'))

   def test_jam_WS_scan_wl_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/scan_wl_ruleid_2.txt', '/root/jam/wca4java/tests/expected/WS/scan_wl_ruleid_2.txt'))

   def test_jam_WS_scan_ol_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/scan_ol_ruleid_2.txt', '/root/jam/wca4java/tests/expected/WS/scan_ol_ruleid_2.txt'))

   def test_jam_WS_scan_twas_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/scan_twas_ruleid_2.txt', '/root/jam/wca4java/tests/expected/WS/scan_twas_ruleid_2.txt'))

   def test_jam_WS_scan_wl_diff(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/scan_wl_ruleid_diff.txt', '/root/jam/wca4java/tests/expected/WS/scan_wl_ruleid_diff.txt'))

   def test_jam_WS_scan_ol_diff(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/scan_ol_ruleid_diff.txt', '/root/jam/wca4java/tests/expected/WS/scan_ol_ruleid_diff.txt'))

   def test_jam_WS_scan_twas_diff(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/scan_twas_ruleid_diff.txt', '/root/jam/wca4java/tests/expected/WS/scan_twas_ruleid_diff.txt'))
 
   def test_jam_WS_scan_wl_count(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/scan_wl_ruleid_count.txt', '/root/jam/wca4java/tests/expected/WS/scan_wl_ruleid_count.txt'))

   def test_jam_WS_scan_wl_count_2(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/scan_wl_ruleid_count_2.txt', '/root/jam/wca4java/tests/expected/WS/scan_wl_ruleid_count_2.txt'))

   def test_jam_WS_scan_time(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/check_timestamp.txt', '/root/jam/wca4java/tests/expected/WS/check_timestamp.txt'))

   def test_jam_WS_source8(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/sourceJava_modresorts_8.txt', '/root/jam/wca4java/tests/expected/WS/sourceJava_modresorts_8.txt'))

   def test_jam_WS_source21(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/sourceJava_modresorts_21.txt', '/root/jam/wca4java/tests/expected/WS/sourceJava_modresorts_21.txt'))

   def test_jam_WS_workspace(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/WS/check_workspace.txt', '/root/jam/wca4java/tests/expected/WS/check_workspace.txt'))


def main():
   unittest.main()

if __name__ == "__main__":
    main()

