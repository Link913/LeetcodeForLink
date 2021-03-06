//
//  3.swift
//  LeetCode
//
//  Created by Link on 2020/5/27.
//  Copyright © 2020 Link. All rights reserved.
//

import Cocoa

// 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
// https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var longest = 0, left = 0, set = Set<Character>()
        let sChars = Array(s)
        
        for (i, char) in sChars.enumerated() {
            print(set)
            print("\(left) === \(i)")
            
            //如果集合中有这个字母
            if set.contains(char) {
                
                //求出当前串和上一次的字符串哪一个更长
                longest = max(longest, i - left)
                
                //当字符串最左边的字符串与当前遍历的字符不相等时,将这个字符从集合中移除,同时将头index偏移,直到二者相等
                while sChars[left] != char {
                    set.remove(sChars[left])
                    left += 1
                }
                
                //计算完成后将字符串的起点加一
                left += 1
                
            } else {
                set.insert(char)
            }
        }
        
        return max(longest, sChars.count - left)
    }
}
