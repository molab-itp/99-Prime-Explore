//
//  drawPalettePrimes.swift
//  PrimeExplore
//
//  Created by jht2 on 10/18/26.
//

import SwiftUI

// -> (cellCount, primeCount, nx, ny)
func drawPalettePrimes(
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
  colorIndex = 0;
  for num in start..<stop {
    let num0 = num - start 
    var x = Double(num0 % nx) * cellWidth;
    var y = Double(num0 / nx) * cellWidth
    x += xmargin
    y += ymargin
    var fillColor: Color = .black
    if isPrime(num) {
      primes.append(num)
      primeSet.insert(num)
      primeCount += 1
    }
    else {
      fillColor = colorPalette[colorIndex];
    }
    let rect = CGRect(x: x, y: y-lineWidth/2,
                      width:cellWidth, height:cellWidth)
    let dotPath = Path(ellipseIn: rect)
    context.fill(dotPath, with: .color(fillColor) )
    colorIndex = (colorIndex + 1) % colorPalette.count
  }
  //          print("primes", primes)
  //            print("start", start, "stop", stop, "primeCount", primeCount)
  return (cellCount, primeCount, nx, ny)
}

