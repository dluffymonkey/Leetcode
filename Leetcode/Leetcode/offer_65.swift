//
//  offer_65.swift
//  Leetcode
//
//  Created by iLeo on 2021/6/1.
//

/*
 本题考察对位运算的灵活使用，即使用位运算实现加法。
 设两数字的二进制形式 a, ba,b ，其求和 s = a + bs=a+b ，a(i)a(i) 代表 aa 的二进制第 ii 位，则分为以下四种情况：
 
 把a+b转换成非进位和+进位，由于不能用加法，因此要一直转换直到第二个加数变成0。 用递归的写法比循环更容易理解。
 
 
 解题思路：如下
 作者：jyd
 链接：https://leetcode-cn.com/problems/bu-yong-jia-jian-cheng-chu-zuo-jia-fa-lcof/solution/mian-shi-ti-65-bu-yong-jia-jian-cheng-chu-zuo-ji-7/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

/// 剑指 Offer 65. 不用加减乘除做加法
/// https://leetcode-cn.com/problems/bu-yong-jia-jian-cheng-chu-zuo-jia-fa-lcof/


class Solution65 {
    func add(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        /// 转换成非进位和 + 进位
        return add(a ^ b, (a & b) << 1)
    }
}

private func test65() {
    let s65 = Solution65()
    print(s65.add(-2, 14441))
}
