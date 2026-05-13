import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

final description = """
Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.

 

Example 1:

Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Explanation: 
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
The distinct triplets are [-1,0,1] and [-1,-1,2].
Notice that the order of the output and the order of the triplets does not matter.
Example 2:

Input: nums = [0,1,1]
Output: []
Explanation: The only possible triplet does not sum up to 0.
Example 3:

Input: nums = [0,0,0]
Output: [[0,0,0]]
Explanation: The only possible triplet sums up to 0.


Link for solution with Gemini and visualisation:
https://gemini.google.com/share/065c1b294a84

""";

class Solution {
  List<List<int>> threeSum(List<int> nums) {
    // 1. Sort the array to easily manage duplicates and use two pointers
    nums.sort();
    List<List<int>> triplets = [];
    int n = nums.length;

    for (int i = 0; i < n - 2; i++) {
      // Skip duplicate elements for the first position to avoid duplicate triplets
      // Safeguard for out of bound using i > 0 and skipping duplicates
      if (i > 0 && nums[i] == nums[i - 1]) {
        continue;
      }

      int left = i + 1;
      int right = n - 1;
      // We are looking for a sum that equals 0. Think from an algebraic point of view:
      // nums[i] + nums[j] + nums[k] = 0 -> Convert this to:
      // nums[j] + nums[k] = -nums[i]
      int target = -nums[i];

      while (left < right) {
        int currentSum = nums[left] + nums[right];

        if (currentSum == target) {
          triplets.add([nums[i], nums[left], nums[right]]);

          // Skip duplicate elements for the second position
          while (left < right && nums[left] == nums[left + 1]) {
            left++;
          }
          // Skip duplicate elements for the third position
          while (left < right && nums[right] == nums[right - 1]) {
            right--;
          }

          // Move both pointers inward after finding a valid triplet
          left++;
          right--;
        } else if (currentSum < target) {
          // If the sum is too small, we need a larger number, move left pointer right
          left++;
        } else {
          // If the sum is too large, we need a smaller number, move right pointer left
          right--;
        }
      }
    }

    return triplets;
  }
}

void main() {
  group("3 Sum using Two pointers", () {
    final solution = Solution();

    test("Scenario I", () {
      final list = [-1, 0, 1, 2, -1, -4];
      final threeSumList = solution.threeSum(list);

      expect(threeSumList, [
        [-1, -1, 2],
        [-1, 0, 1],
      ]);
    });

    test("Scenario II", () {
      final list = [0, 1, 1];
      final threeSumList = solution.threeSum(list);

      expect(threeSumList, []);
    });

    test("Scenario III", () {
      final list = [0, 0, 0];
      final threeSumList = solution.threeSum(list);

      expect(threeSumList, [
        [0, 0, 0],
      ]);
    });
  });
}
