//
//  IsPrime.swift
//  PrimeExplore
//
//  Created by jht2 on 10/18/26.
//

import Foundation

func isPrime(_ num:Int) -> Bool {
  if num < 2 {
    return false
  }
  // Don't need to check all numbers
  let numStop = Int(Double(num).squareRoot())+1
  for i in 2..<numStop {
    if num % i == 0 {
      return false
    }
  }
  return true
}

