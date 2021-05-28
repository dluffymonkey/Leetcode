//
//  offer_42.swift
//  Leetcode
//
//  Created by zza on 2021/5/28.
//

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
