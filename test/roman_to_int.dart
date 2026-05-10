import 'package:flutter_test/flutter_test.dart';

class Solution {
  int romanToInt(String s) {
    const romanValues = {
      'I': 1,
      'V': 5,
      'X': 10,
      'L': 50,
      'C': 100,
      'D': 500,
      'M': 1000,
    };

    int finalValue = 0;
    int lastValue = 0;

    // Work backwards from the end of the string
    for (int i = s.length - 1; i >= 0; i--) {
      int currentValue = romanValues[s[i]]!;

      // If current value is less than the value to its right, subtract it
      // Example: IV -> V is 5, I is 1. 1 < 5, so finalValue = 5 - 1 = 4.
      if (currentValue < lastValue) {
        finalValue -= currentValue;
      } else {
        finalValue += currentValue;
      }

      lastValue = currentValue;
    }

    return finalValue;
  }
}

void main() {
  group("Roman to INT", () {
    final solution = Solution();

    test("III should return 3", () {
      final str = "III";
      final parsed = solution.romanToInt(str);

      expect(parsed, 3);
    });

    test("LVIII should return 58", () {
      final str = "LVIII";
      final parsed = solution.romanToInt(str);

      expect(parsed, 58);
    });

    test("MCMXCIV should return 1994", () {
      final str = "MCMXCIV";
      final parsed = solution.romanToInt(str);

      expect(parsed, 1994);
    });
  });
}
