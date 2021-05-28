//
//  offer_18.swift
//  TestMac
//
//  Created by iLeo on 2021/5/28.
//  Copyright © 2021 ZA. All rights reserved.
//

import Foundation
/// 18. 删除链表的节点
/// https://leetcode-cn.com/problems/shan-chu-lian-biao-de-jie-dian-lcof/


private class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(val)"
        }
        let des = "\(val) -> " + String(describing: next)
        return des
    }
}


private class Solution18 {
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        if head!.val == val {
            return head?.next
        }
        
        var temp = head
        while temp?.next != nil {
            if temp?.next?.val == val {
                temp?.next = temp?.next?.next
                return head
            } else {
                temp = temp?.next
            }
        }
        return temp
    }
}

func test18() {
    let n1 = ListNode(4)
    let n2 = ListNode(1)
    let n3 = ListNode(5)
    let n4 = ListNode(9)
    n1.next = n2
    n2.next = n3
    n3.next = n4
    
    let s18 = Solution18()
    let res = s18.deleteNode(n1, 9)
    print(res ?? "")
}

