//
//  drawCountPrimes.swift
//  PrimeExplore
//
//  Created by jht2 on 10/18/26.
//

import SwiftUI

// -> (cellCount, primeCount, nx, ny)
func drawCountPrimes(
  context :GraphicsContext,
  size :CGSize,
  startNum: Double) -> (Int,Int,Int,Int)
{
  var primeCount = 0
  let (cellCount,xmargin,ymargin,nx,ny, cellWidth) =
  drawGrid(context: context, size: size)
  let lineWidth = primeDisplay.lineWidth
  //      let cellWidth = primeDisplay.cellWidth
  var primes: [Int] = []
  var primeSet: Set<Int> = []
  let start = Int(startNum)
  let stop = start+cellCount
  for num in start..<stop {
    if isPrime(num) {
      primes.append(num)
      primeSet.insert(num)
      primeCount += 1
      let num0 = num - start - 1
      var x = Double(num0 % nx) * cellWidth;
      var y = Double(num0 / nx) * cellWidth
      x += xmargin
      y += ymargin
      var fillColor: Color = .black
      if primeSet.contains(num-2) {
        fillColor = .red;
      }
      let rect = CGRect(x: x, y: y-lineWidth/2,
                        width:cellWidth, height:cellWidth)
      let dotPath = Path(ellipseIn: rect)
      context.fill(dotPath, with: .color(fillColor) )
    }
  }
  //          print("primes", primes)
  //            print("start", start, "stop", stop, "primeCount", primeCount)
  return (cellCount, primeCount, nx, ny)
}

