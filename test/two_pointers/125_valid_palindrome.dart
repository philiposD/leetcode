import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

final description = """
A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.

 

Example 1:

Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
Example 2:

Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
Example 3:

Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.


Gemini solution: https://gemini.google.com/share/1bea5b0f9df6
""";

class SolutionMostEfficient {
  bool isPalindrome(String s) {
    int left = 0;
    int right = s.length - 1;

    while (left < right) {
      // Move left pointer to the next alphanumeric character
      while (left < right && !_isAlphanumeric(s.codeUnitAt(left))) {
        left++;
      }

      // Move right pointer to the previous alphanumeric character
      while (left < right && !_isAlphanumeric(s.codeUnitAt(right))) {
        right--;
      }

      // Compare lowercase versions of the characters
      if (_toLowerCase(s.codeUnitAt(left)) != _toLowerCase(s.codeUnitAt(right))) {
        return false;
      }

      left++;
      right--;
    }

    return true;
  }

  // Helper to check if a code unit is 0-9, A-Z, or a-z
  bool _isAlphanumeric(int codeUnit) {
    return (codeUnit >= 48 && codeUnit <= 57) || // 0-9
        (codeUnit >= 65 && codeUnit <= 90) || // A-Z
        (codeUnit >= 97 && codeUnit <= 122); // a-z
  }

  // Helper to convert uppercase A-Z to lowercase a-z
  int _toLowerCase(int codeUnit) {
    if (codeUnit >= 65 && codeUnit <= 90) {
      return codeUnit + 32; // Add 32 to reach the lowercase ASCII range
    }
    return codeUnit;
  }
}

class SolutionLessEfficient {
  final description = """
    Time Complexity O(n^2) because we checking n(n-1)/2 combinations. This will result in a "Time Limit Exceeded" error for large arrays on LeetCode.
    Space complexity O(1) as it stores only 1 variable for the max area.
    """;

  bool isPalindrome(String s) {
    final strClean = s.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    int left = 0;
    int right = strClean.length - 1;

    while (left < right) {
      final strLeft = strClean[left];
      final strRight = strClean[right];

      if (strLeft != strRight) {
        return false;
      }

      left++;
      right--;
    }

    return true;
  }
}

void main() {
  group("Container with most water [TWO POINTER TECHNIQUE]", () {
    final solutionLessEfficient = SolutionLessEfficient();

    test("Scenario I", () {
      final str = "A man, a plan, a canal: Panama";
      final result = solutionLessEfficient.isPalindrome(str);

      expect(result, true);
    });

    test("Scenario II", () {
      final str = "race a car";
      final result = solutionLessEfficient.isPalindrome(str);

      expect(result, false);
    });

    test("Scenario III", () {
      final str = " ";
      final result = solutionLessEfficient.isPalindrome(str);

      expect(result, true);
    });
  });
}
