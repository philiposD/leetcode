import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

String problem = """
You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.

Return the length of the longest substring containing the same letter you can get after performing the above operations.

 

Example 1:

Input: s = "ABAB", k = 2
Output: 4
Explanation: Replace the two 'A's with two 'B's or vice versa.
Example 2:

Input: s = "AABABBA", k = 1
Output: 4
Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.
There may exists other ways to achieve this answer too.
""";

class Solution {
  int characterReplacement(String s, int k) {
    // Using a Map to store character frequencies is much more readable
    Map<String, int> charCounts = {};

    int left = 0;
    int maxFreq = 0;
    int maxLength = 0;

    for (int right = 0; right < s.length; right++) {
      String rightChar = s[right];

      // 1. Expand the window
      charCounts[rightChar] = (charCounts[rightChar] ?? 0) + 1;

      // Update the historical maximum frequency
      // Note: the '!' is safe here because we just assigned it above
      maxFreq = max(maxFreq, charCounts[rightChar]!);

      // 2. Validate the window
      int currentWindowLen = right - left + 1;

      if (currentWindowLen - maxFreq > k) {
        String leftChar = s[left];
        // Shrink the window: reduce the count of the left character
        charCounts[leftChar] = charCounts[leftChar]! - 1;
        left++;
      }

      // 3. Record the maximum valid window length
      maxLength = max(maxLength, right - left + 1);

      print("MaxLength: $maxLength");
    }

    return maxLength;
  }
}

void main() {
  group(
    "Longest Repeating Characters Replacement [Sliding Window Technique {DYNAMIC}]",
    () {
      final solution = Solution();

      test("ABABCDEFG should return 4", () {
        final str = "ABABCDEFG";
        final max = solution.characterReplacement(str, 2);

        expect(max, 4);
      });

      test("AABABBA should return 4", () {
        final str = "AABABBA";
        final max = solution.characterReplacement(str, 1);

        expect(max, 4);
      });
    },
  );
}
