//
//  drawGrid.swift
//  PrimeExplore
//
//  Created by jht2 on 10/18/26.
//

import SwiftUI

struct PrimeDisplay {
  let numInterval = 1000.0;
  let lineWidth = 1.0
  let ncell = 20.0
  let cellWidth = 40.0
  let margin =  0.0 // Keep at zero
}
let primeDisplay = PrimeDisplay();


// cellCount depends on size
// -> (cellCount, xmargin, ymargin, nx, ny, cellWidth)
func drawGrid(
  context :GraphicsContext,
  size :CGSize ) -> (Int,Double,Double,Int,Int,Double)
{
  let lineWidth = primeDisplay.lineWidth
  var cellWidth = primeDisplay.cellWidth
  let margin = primeDisplay.margin;
  let ncell = primeDisplay.ncell
  if ncell != 0 {
    cellWidth = Double(Int(size.width - margin*2.0)/Int(ncell))
  }
  // grid columns
  var x = 0.0
  var nx = 0
  let height:Double = Double(Int(size.height)/Int(cellWidth)) * cellWidth
  let width:Double = Double(Int(size.width)/Int(cellWidth)) * cellWidth
  let xmargin = (size.width - width) / 2.0
  let ymargin = (size.height - height) / 2.0
  //    var context2 = context
  //    context2.translateBy(x: xmargin, y: ymargin)
  while x <= width {
    var path = Path()
    path.move(to: CGPoint(x: x + xmargin, y:ymargin))
    path.addLine(to: CGPoint(x: x + xmargin, y: height + ymargin))
    context.stroke(path, with: .color(.black), lineWidth: lineWidth)
    x += cellWidth
    nx += 1
  }
  // grid rows
  var y = 0.0
  var ny = 0
  while y <= height {
    var path = Path()
    path.move(to: CGPoint(x: 0 + xmargin, y:y + ymargin))
    path.addLine(to: CGPoint(x: width + xmargin, y: y + ymargin))
    context.stroke(path, with: .color(.black), lineWidth: lineWidth)
    y += cellWidth
    ny += 1
  }
  nx -= 1;
  ny -= 1;
  let cellCount = nx * ny;
  //      print("drawGrid cellCount", cellCount)
  return (cellCount, xmargin, ymargin, nx, ny, cellWidth);
}
