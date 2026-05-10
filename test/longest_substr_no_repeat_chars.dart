import 'dart:math' as Math;

import 'package:flutter_test/flutter_test.dart';

class Solution {
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;
    // Maps character to its last seen index
    Map<String, int> map = {};
    int left = 0;

    for (int right = 0; right < s.length; right++) {
      String char = s[right];

      // If we've seen the character and it's within our current window
      if (map.containsKey(char) && map[char]! >= left) {
        // Move the left pointer to right after the previous occurrence
        left = map[char]! + 1;
      }

      map[char] = right; // Update last seen index
      maxLength = Math.max(maxLength, right - left + 1);
      print("MaxLength: $maxLength");
    }

    return maxLength;
  }
}

void main() {
  group(
    "Longest SubString Without Repeating Chars [Sliding Window Technique]",
    () {
      final solution = Solution();

      test("abcabcdbb should return 3", () {
        final str = "abcabcdbb";
        final max = solution.lengthOfLongestSubstring(str);

        expect(max, 4);
      });

      test("dvdf should return 2", () {
        final str = "dvdf";
        final max = solution.lengthOfLongestSubstring(str);

        expect(max, 3);
      });

      test("bbbbb should return 1", () {
        final str = "bbbbb";
        final max = solution.lengthOfLongestSubstring(str);

        expect(max, 1);
      });

      test("pwwkew should return 3", () {
        final str = "pwwkew";
        final max = solution.lengthOfLongestSubstring(str);

        expect(max, 3);
      });
    },
  );
}
