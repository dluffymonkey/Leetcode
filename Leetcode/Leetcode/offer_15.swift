//
//  offer_15.swift
//  Leetcode
//
//  Created by iLeo on 2021/6/1.
//

/*
 方法一：逐位判断
 根据 与运算 定义，设二进制数字 nn ，则有：
 若 n&1=0 ，则 n 二进制 最右一位 为 0 ；
 若 n&1=1 ，则 n 二进制 最右一位 为 1 。
 根据以上特点，考虑以下 循环判断 ：
 判断 n 最右一位是否为 1 ，根据结果计数。
 将 n 右移一位（本题要求把数字 n 看作无符号数，因此使用 无符号右移 操作）。
 算法流程：
 初始化数量统计变量 res=0 。
 循环逐位判断： 当 n=0 时跳出。
 res += n & 1 ： 若 n&1=1 ，则统计数 res 加一。
 n >>= 1 ： 将二进制数字 n 无符号右移一位（ Java 中无符号右移为 ">>>" ） 。
 返回统计数量 res 。
 
 方法二：巧用 n&(n−1)
 (n−1) 解析： 二进制数字 n 最右边的 1 变成 0 ，此 1 右边的 0 都变成 1 。
 n&(n−1) 解析： 二进制数字 n 最右边的 1 变成 0 ，其余不变。
 算法流程：
 初始化数量统计变量 res 。
 循环消去最右边的 1 ：当 n=0 时跳出。
 res += 1 ： 统计变量加 1 ；
 n &= n - 1 ： 消去数字 n 最右边的 1 。
 返回统计数量 res 。


 作者：jyd
 链接：https://leetcode-cn.com/problems/er-jin-zhi-zhong-1de-ge-shu-lcof/solution/mian-shi-ti-15-er-jin-zhi-zhong-1de-ge-shu-wei-yun/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

/// 剑指 Offer 15. 二进制中1的个数
/// https://leetcode-cn.com/problems/er-jin-zhi-zhong-1de-ge-shu-lcof/


class Solution15 {
    func hammingWeight(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        var n = n
        var count = 0
        while n != 0 {
            n = n & (n - 1) //去除最低位的1.
            count += 1
        }
        return count
    }
}

/// 注意这里计算的结果是错误的，因为Xcode将输入的值当成十进制的Int数值进行计算的
private func test15() {
    let s15 = Solution15()
    print(s15.hammingWeight(00000000000000000100000001011))
}

