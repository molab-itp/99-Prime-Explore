//
//  Colors.swift
//  PrimeExplore
//
//  Created by jht2 on 10/18/26.
//

import SwiftUI
import UIKit

extension UIColor {
  static var gold: UIColor { // Computed property
    UIColor(red: 1, green: 215.0/255.0, blue: 0.0, alpha: 1)
  }
}
// https://color-term.com/color/gold-ffd700/
// 255, 215, 0
// https://color-term.com/color/lego-chrome-gold-bba53d/
// RGB(187, 165, 61) // Chrome Gold

extension Color {
  static var gold: Color {
    .init(UIColor.gold)
  }
}

let colorPalette: [Color] = [.red, .green, .gold]
var colorIndex = 0;



