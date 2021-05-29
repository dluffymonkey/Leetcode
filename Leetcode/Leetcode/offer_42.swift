//
//  offer_42.swift
//  Leetcode
//
//  Created by zza on 2021/5/28.
//

/*
 解题思路：
 常见解法    时间复杂度    空间复杂度
 暴力搜索    O(N^2)      O(1)
 分治思想    O(NlogN)    O(logN)
 动态规划    O(N)        O(1)
 动态规划是本题的最优解法，以下按照标准流程解题。
 动态规划解析：
 状态定义： 设动态规划列表 dp ，dp[i] 代表以元素 nums[i] 为结尾的连续子数组最大和。

 为何定义最大和 dp[i] 中必须包含元素 nums[i] ：保证 dp[i] 递推到 dp[i+1] 的正确性；如果不包含 nums[i] ，递推时则不满足题目的连续子数组要求。
 转移方程： 若 dp[i−1] ≤ 0 ，说明 dp[i - 1] 对 dp[i] 产生负贡献，即 dp[i-1] + nums[i] 还不如 nums[i] 本身大。
 当 dp[i - 1] > 0 时：执行 dp[i] = dp[i-1] + nums[i] ；
 当 dp[i − 1] ≤ 0 时：执行 dp[i] = nums[i] ；
 初始状态： dp[0] = nums[0]，即以 nums[0] 结尾的连续子数组最大和为 nums[0] 。
 返回值： 返回 dpdp 列表中的最大值，代表全局最大值。

 空间复杂度降低：
 由于 dp[i] 只与 dp[i-1] 和 nums[i] 有关系，因此可以将原数组 nums 用作 dp 列表，即直接在 nums 上修改即可。
 由于省去 dp 列表使用的额外空间，因此空间复杂度从 O(N) 降至 O(1) 。
 复杂度分析：

 时间复杂度 O(N) ： 线性遍历数组 nums 即可获得结果，使用 O(N) 时间。
 空间复杂度 O(1) ： 使用常数大小的额外空间。

 作者：jyd
 链接：https://leetcode-cn.com/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof/solution/mian-shi-ti-42-lian-xu-zi-shu-zu-de-zui-da-he-do-2/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

/// **注意**：动态规划主要是看以当前数组的某一个元素为结尾的连续子数组的最大和，必须带上某个元素为最后一个值，然后从第一个元素开始计算，同时判断元素的值是否大于0，把得到的最大值存放到数组Q中，最后取Q的最大值即可

/// 剑指 Offer 42. 连续子数组的最大和
/// https://leetcode-cn.com/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof/

private class Solution42 {
    func maxSubArray(_ nums: [Int]) -> Int {
        ///  异常处理
        if nums.count == 0 {
            return 0
        }
        
        ///  分治的时间复杂度不符合要求
        ///  动态方程
        var temp = nums
        var res = temp[0]
        ///  一次遍历
        for i in 1..<nums.count {
            temp[i] += max(0, temp[i - 1])
            res = max(res, temp[i])
        }
        return res
    }
}

func test42() {
    let s42 = Solution42()
    let res = s42.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
    print("res --- \(res)")
}
