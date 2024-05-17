import unittest
import filecmp
import sys

class LearningCase(unittest.TestCase):



   def test_jam_e2e_runbuild_cafe(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/runBuild_cafe.txt', '/root/jam/wca4java/tests/expected/e2e/runBuild_cafe.txt'))

   def test_jam_e2e_scan_ol_cafe(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_cafe.txt', '/root/jam/wca4java/tests/expected/e2e/scan_ol_ruleid_cafe.txt'))

   def test_jam_e2e_get_recipes_cafe(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/getrecipes_cafe.txt', '/root/jam/wca4java/tests/expected/e2e/getrecipes_cafe.txt'))

   def test_jam_e2e_run_recipes_cafe(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/AllRecipes_Mod_WARN_cafe.txt', '/root/jam/wca4java/tests/expected/e2e/AllRecipes_Mod_WARN_cafe.txt'))

   def test_jam_e2e_runbuild_2_cafe(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/runBuild_2_cafe.txt', '/root/jam/wca4java/tests/expected/e2e/runBuild_2_cafe.txt'))

   def test_jam_e2e_scan_ol_2_cafe(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_2_cafe.txt', '/root/jam/wca4java/tests/expected/e2e/scan_ol_ruleid_2_cafe.txt'))

   def test_jam_e2e_scan_ol_diff_cafe(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/scan_ol_ruleid_diff_cafe.txt', '/root/jam/wca4java/tests/expected/e2e/scan_ol_ruleid_diff_cafe.txt'))

   def test_jam_e2e_scan_source_java(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/sourceJava_cafe.txt', '/root/jam/wca4java/tests/expected/e2e/sourceJava_cafe.txt'))

   def test_jam_e2e_scan_target_java(self):
        self.assertTrue(filecmp.cmp('/root/jam/wca4java/tests/actual/e2e/targetJava_cafe.txt', '/root/jam/wca4java/tests/expected/e2e/targetJava_cafe.txt'))












def main():
   unittest.main()

if __name__ == "__main__":
    main()

