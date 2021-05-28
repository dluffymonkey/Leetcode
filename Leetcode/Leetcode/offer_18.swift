//
//  offer_18.swift
//  TestMac
//
//  Created by iLeo on 2021/5/28.
//  Copyright © 2021 ZA. All rights reserved.
//

/*
 本题删除值为 val 的节点分需为两步：定位节点、修改引用。

 定位节点： 遍历链表，直到 head.val == val 时跳出，即可定位目标节点。
 修改引用： 设节点 cur 的前驱节点为 pre ，后继节点为 cur.next ；则执行 pre.next = cur.next ，即可实现删除 cur 节点。


 算法流程：
 特例处理： 当应删除头节点 head 时，直接返回 head.next 即可。
 初始化： pre = head , cur = head.next 。
 定位节点： 当 cur 为空 或 cur 节点值等于 val 时跳出。
 保存当前节点索引，即 pre = cur 。
 遍历下一节点，即 cur = cur.next 。
 删除节点： 若 cur 指向某节点，则执行 pre.next = cur.next ；若 cur 指向 nullnull ，代表链表中不包含值为 val 的节点。
 返回值： 返回链表头部节点 head 即可。

 作者：jyd
 链接：https://leetcode-cn.com/problems/shan-chu-lian-biao-de-jie-dian-lcof/solution/mian-shi-ti-18-shan-chu-lian-biao-de-jie-dian-sh-2/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

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

