import 'package:flutter_test/flutter_test.dart';

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    // Stores the value as the key, and its index as the value
    final numMap = <int, int>{};

    for (var i = 0; i < nums.length; i++) {
      final complement = target - nums[i];

      print("Complement: $complement AND numMap: $numMap");

      // If we've seen the complement before, return its index and the current index
      if (numMap.containsKey(complement)) {
        return [numMap[complement]!, i];
      }

      // Otherwise, save the current number and its index for future reference
      numMap[nums[i]] = i;
    }

    // Fallback return, though the problem guarantees exactly one solution
    return [];
  }
}

void main() {
  test('twoSum', () {
    final solution = Solution();

    final nums = [1, 9, 3, 3];
    final target = 6;

    final result = solution.twoSum(nums, target);

    print(result);
  });
}
