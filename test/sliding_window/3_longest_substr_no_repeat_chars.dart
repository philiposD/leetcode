import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

final description = """
Given a string s, find the length of the longest substring without duplicate characters.

Example 1:

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3. Note that "bca" and "cab" are also correct answers.
Example 2:

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
""";

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
      maxLength = max(maxLength, right - left + 1);
      print("MaxLength: $maxLength");
    }

    return maxLength;
  }
}

class SolutionQuick {
  int lengthOfLongestSubstring(String s) {
    int longest = 0;
    int left = 0;
    Set<String> charOccured = {};

    for (int right = 0; right < s.length; right++) {
      String char = s[right];

      while (charOccured.contains(char)) {
        charOccured.remove(s[left]);
        left++;
      }

      longest = max(longest, right - left + 1);

      charOccured.add(char);
    }

    return longest;
  }
}

class SolutionEfficient {
  int lengthOfLongestSubstring(String s) {
    int longest = 0;
    int left = 0;

    // Create a fixed-size array for the 128 ASCII characters.
    // Initialize all values to -1 to indicate the character hasn't been seen yet.
    List<int> lastSeen = List.filled(128, -1);

    for (int right = 0; right < s.length; right++) {
      // Get the ASCII integer value instead of creating a new String
      int charCode = s.codeUnitAt(right);

      // If we have seen this character before AND its last known position
      // is inside our current window (>= left), jump the left pointer.
      if (lastSeen[charCode] >= left) {
        left = lastSeen[charCode] + 1;
      }

      // Update the character's last seen index to the current 'right' position
      lastSeen[charCode] = right;

      // Calculate the max length
      longest = max(longest, right - left + 1);
    }

    return longest;
  }
}

void main() {
  group("Longest SubString Without Repeating Chars [Sliding Window Technique {FIXED}]", () {
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
  });

  group("[EFFICIENT] - Longest SubString Without Repeating Chars [Sliding Window Technique {FIXED}]", () {
    final solution = SolutionEfficient();

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
  });
}
