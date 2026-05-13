import 'package:flutter_test/flutter_test.dart';

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode dummyHead = ListNode(0); // Placeholder
    ListNode? curr = dummyHead;
    int carry = 0;

    // Keep going if there are nodes left or a leftover carry
    while (l1 != null || l2 != null || carry != 0) {
      int x = (l1 != null) ? l1.val : 0;
      int y = (l2 != null) ? l2.val : 0;

      int sum = carry + x + y;
      carry = sum ~/ 10; // Integer division for carry

      // Create the next node with the single digit (remainder)
      curr?.next = ListNode(sum % 10);
      curr = curr?.next;

      // Move to the next nodes in the input lists
      if (l1 != null) l1 = l1.next;
      if (l2 != null) l2 = l2.next;
    }

    return dummyHead.next; // Return everything AFTER the placeholder
  }
}

void main() {
  test('Add two numbers', () {
    final sol = Solution();
    final l1 = ListNode(2, ListNode(4, ListNode(3)));
    final l2 = ListNode(5, ListNode(6, ListNode(4)));

    var result = sol.addTwoNumbers(l1, l2);

    // Define expected values in a list for easy iteration
    final expectedValues = [7, 0, 8];

    for (var val in expectedValues) {
      expect(result, isNotNull);
      expect(result!.val, val);
      result = result.next;
    }

    expect(result, isNull); // Ensure there are no extra nodes
  });
}
