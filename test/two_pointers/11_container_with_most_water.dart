import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

final description = """
You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.

Example 1:
Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

Example 2:
Input: height = [1,1]
Output: 1


Gemini solution: https://gemini.google.com/share/a940bf4ce9a4
""";

class Solution {
  int maxArea(List<int> height) {
    int right = height.length - 1;
    int left = 0;
    int maxArea = 0;

    while (left < right) {
      int currentHeight = min(height[left], height[right]);
      int currentWidth = right - left;
      int area = currentHeight * currentWidth;

      maxArea = max(maxArea, area);

      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }

    return maxArea;
  }
}

class SolutionBrutForce {
  final description = """
    Time Complexity O(n^2) because we checking n(n-1)/2 combinations. This will result in a "Time Limit Exceeded" error for large arrays on LeetCode.
    Space complexity O(1) as it stores only 1 variable for the max area.
    """;

  int maxArea(List<int> height) {
    int maxWater = 0;
    for (int i = 0; i < height.length; i++) {
      for (int j = i + 1; j < height.length; j++) {
        int currentArea = (j - i) * (height[i] < height[j] ? height[i] : height[j]);
        if (currentArea > maxWater) {
          maxWater = currentArea;
        }
      }
    }
    return maxWater;
  }
}

void main() {
  group("Container with most water [TWO POINTER TECHNIQUE]", () {
    final solution = Solution();

    test("Scenario I", () {
      final list = [1, 8, 6, 2, 5, 4, 8, 3, 7];
      final area = solution.maxArea(list);

      expect(area, 49);
    });

    test("Scenario II", () {
      final list = [1, 1];
      final area = solution.maxArea(list);

      expect(area, 1);
    });
  });
}
