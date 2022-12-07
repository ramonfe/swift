
 //Definition for singly-linked list.
 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
 
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        if list1 == nil { return list2}

        if list2 == nil { return list1}

        var nList = list1        

        if nList!.val > list2!.val {
            nList! = list2        
        }
        return nList
    }
}

let foo = Solution()
let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(4)
l1.next = l2
l2.next = l3

foo.mergeTwoLists(l1, l1)