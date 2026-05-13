import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

final description = """
A string is good if there are no repeated characters.

Given a string s​​​​​, return the number of good substrings of length three in s​​​​​​.

Note that if there are multiple occurrences of the same substring, every occurrence should be counted.

A substring is a contiguous sequence of characters in a string.

 

Example 1:

Input: s = "xyzzaz"
Output: 1
Explanation: There are 4 substrings of size 3: "xyz", "yzz", "zza", and "zaz". 
The only good substring of length 3 is "xyz".
Example 2:

Input: s = "aababcabc"
Output: 4
Explanation: There are 7 substrings of size 3: "aab", "aba", "bab", "abc", "bca", "cab", and "abc".
The good substrings are "abc", "bca", "cab", and "abc".
 

Constraints:

1 <= s.length <= 100
s​​​​​​ consists of lowercase English letters.
""";

class SolutionQuick {
  int countGoodSubstrings(String s) {
    int len = s.length;
    int maxOccurences = 0;

    for (int i = 0; i < len; i++) {
      if (i + 2 > len - 1) {
        break;
      }

      String char1 = s[i];
      String char2 = s[i + 1];
      String char3 = s[i + 2];

      if (char1 != char2 && char2 != char3 && char1 != char3) {
        maxOccurences++;
      }
    }

    return maxOccurences;
  }
}

void main() {
  group("Substrings of Size Three with Distinct Characters [Quick - NO Sliding Window", () {
    final solution = SolutionQuick();

    test("Should return 1 for xyzzaz", () {
      final str = "xyzzaz";
      final max = solution.countGoodSubstrings(str);

      final arr = [];

      expect(max, 1);
    });

    test("Should return 4 for aababcabc", () {
      final str = "aababcabc";
      final max = solution.countGoodSubstrings(str);

      expect(max, 4);
    });
  });
}
