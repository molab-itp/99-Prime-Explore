//
//  PrimeCountView.swift
//  PrimeExplore
//
//  Created by jht2 on 10/18/26.
//

import SwiftUI

let animInterval = 0.5; // update interval in seconds

struct PrimeCountView: View {
  @State private var startNum = 0.0
  @State var cellCount: Int = 0
  @State var primeCount: Int = 0
  @State var nx: Int = 0
  @State var ny: Int = 0
  
  @State private var autoStep = false
  @State var lastUpdateDate: Date = .distantPast
  
  var body: some View {
    TimelineView(.animation(minimumInterval: animInterval)) { timeline in
      VStack {
        controlsTop()
        Canvas { context, size in
          //      print("size", size)
          // drawPalettePrimes
          
          let (cellCount,primeCount, nx, ny) = drawPalettePrimes (
            context: context,
            size: size,
            startNum: startNum )
//          let (cellCount,primeCount, nx, ny) = drawCountPrimes(
//            context: context,
//            size: size,
//            startNum: startNum )

          
          let seconds = timeline.date.timeIntervalSince(lastUpdateDate)
          if seconds > animInterval {
            //            print(timeline.date)
            Task {
              self.lastUpdateDate = timeline.date
              // must defer setting with Task
              self.cellCount = cellCount
              self.primeCount = primeCount
              self.nx = nx
              self.ny = ny
              if autoStep {
                stepAction()
              }
            }
          }
          // must read to trigger update
          _ = timeline.date
        }
        controlsBottom()
      }
      .padding(5)
      .onAppear {
        //      print("onAppear countUI", countUI)
      }
    }
  }
  
  func controlsTop() -> some View {
    VStack {
      HStack {
        Text("grid \(nx)x\(ny)=\(cellCount)")
        Text("n primes:\(primeCount)")
        if cellCount != 0 {
          let density = Double(primeCount)/Double(cellCount);
          Text(String(format: "d: %.4f", density))
        }
      }
      HStack {
        Text("Start: \(Int(startNum))")
        Spacer()
        Picker("Auto Step", selection: $autoStep) {
          Text("Off").tag(false)
          Text("On").tag(true)
        }
        .pickerStyle(.segmented)
        .frame(width: 100)
      }
    }
  }
  
  func stepAction() {
    startNum += Double(cellCount);
  }
  
  func controlsBottom() -> some View {
    VStack {
      HStack {
        Button("-Step") {
          //          startNum -= primeDisplay.numInterval
          startNum -= Double(cellCount);
        }
        Button("Zero") {
          startNum = 0
        }
        Button("+Step") {
          //          startNum += primeDisplay.numInterval
          stepAction()
        }
      }
    }
    .buttonStyle(.bordered)
    //    .font(.system(size: 28))
  }
  
}

#Preview {
  PrimeCountView()
}
