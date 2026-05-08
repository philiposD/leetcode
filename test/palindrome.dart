import 'package:flutter_test/flutter_test.dart';

class Solution {
  bool isPalindrome(int x) {
    if (x < 0 || (x % 10 == 0 && x != 0)) {
      return false;
    }

    int revertedNumber = 0;
    while (x > revertedNumber) {
      revertedNumber = (revertedNumber * 10) + (x % 10);
      x = x ~/ 10;

      print("revertedNumber: $revertedNumber, x: $x");
    }


    print("We have x afer while: $x");
    print("We have revertedNumber  afer while: $revertedNumber");

    return x == revertedNumber || x == revertedNumber ~/ 10;
  }
}

void main() {
  test('twoSum', () {
    final solution = Solution();
    final num = 121;
    final numNegative = -121;
    final nonPalindrome = 10;

    final check1 = solution.isPalindrome(num);
    final check2 = solution.isPalindrome(numNegative);
    final check3 = solution.isPalindrome(nonPalindrome);


    expect(check1, true);
    expect(check2, false);
    expect(check3, false);
  });
}
