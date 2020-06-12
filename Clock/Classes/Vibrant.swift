//
//  Vibrant.swift
//  Clock
//
//  Created by Yuma Technical Inc. on 2020-06-11.
//  Copyright © 2020 Yuma Technical Inc.. All rights reserved.
//

import AppKit


class Vibrant: FalunView/*, FalunStyle*/ {
	
	struct setting: FalunStyle {
//		var description: String = "Vibrant"
//		
//		var rawValue: String = "Vibrant"
		
		static var backgroundColor: NSColor = NSColor.purple
		static var displayRays: Bool = true
		static var numStars: Float = 400
		static var maxStarSize: Float = 20
		static var thesholdStarSize: Float = 6
		static var starColorSchemes: [String] = ["All White", "All Yellow", "All Pale Blue", "random", "Blues"]
		static var starColorScheme: String = "random"
		static var baseRadius: Float = 360
		static var baseFillColor: NSColor = NSColor.orange
		static var baseStrokeWidth: Float = 0
		static var baseStrokeColor: NSColor = NSColor.clear
		static var baseShadow: Bool = true
		static var centerDiscRadius: Float = 0.5
		static var centerDiscFill: NSColor = NSColor.red
		static var centerDiscStrokeWidth: Float = 0
		static var centerDiscStroke: NSColor = NSColor.clear
		static var centerSymbolCornerRadius: Float = 0.15
		static var centerSymbolFill: NSColor = NSColor.yellow
		static var centerSymbolStrokeWidth: Float = 0
		static var centerSymbolStroke: NSColor = NSColor.clear
		static var curvedSymbolThickness: Float = 10
		static var curvedSymbolFill: NSColor = NSColor.yellow
		static var curvedSymbolStrokeWidth: Float = 0
		static var curvedSymbolStroke: NSColor = NSColor.clear
		static var yySymbolRadius: Float = 0.2
		static var yySymbolStrokeWidth: Float = 0
		static var yySymbolStroke: NSColor = NSColor.clear
		static var yyPriFill: NSColor = NSColor.black
		static var yySecFill: NSColor = NSColor.red
		static var yyDotRadius: Float = 0.1
		static var yyPriDotFill: NSColor = NSColor.white
		static var yyPriDotStrokeWidth: Float = 0
		static var yyPriDotStroke: NSColor = NSColor.clear
		static var yySecDotFill: NSColor = NSColor.white
		static var yySecDotStrokeWidth: Float = 0
		static var yySecDotStroke: NSColor = NSColor.clear
	}
//	static var `default`: FalunStyle {
//		return FalunStyle.self
//	}
	
	var rawValue: String = ""
	
	
	// MARK: - Types
	/*
	public enum Style: String, FalunStyle, CaseIterable {
		
		case bkbkg = "BKBKG"
		case whbrg = "WHBRG"
		
		var description: String {
			switch self {
				case .bkbkg:
					return "Black"
				case .whbrg:
					return "Brown"
			}
		}
		/*
		var backgroundColor: NSColor {
			switch self {
				case .bkbkg:
					return Color.darkBackground
				case .whbrg:
					return NSColor(displayP3Red: 0.298, green: 0.231, blue: 0.204, alpha: 1)
			}
		}
		
		var faceColor: NSColor {
			switch self {
				case .bkbkg:
					return backgroundColor
				case .whbrg:
					return NSColor(white: 0.996, alpha: 1)
			}
		}
		
		var hourColor: NSColor {
			switch self {
				case .bkbkg:
					return NSColor(white: 0.7, alpha: 1)
				case .whbrg:
					return NSColor(white: 0.3, alpha: 1)
			}
		}
		
		var minuteColor: NSColor {
			switch self {
				case .bkbkg:
					return Color.white
				case .whbrg:
					return Color.black
			}
		}
		
		var secondColor: NSColor {
			return Color.yellow
		}
		
		var logoColor: NSColor {
			return minuteColor
		}
		*/
		public var backgroundColor: NSColor {
			return NSColor.purple
		}
		var displayRays: Bool {
			return true
		}
		var numStars: Float {
			return 400
		}
		var maxStarSize: Float {
			return 20
		}
		var thesholdStarSize: Float {
			return 6
		}
		var starColorSchemes: [String] {
			return ["All White", "All Yellow", "All Pale Blue", "random", "Blues"]
		}
		var starColorScheme: String {
			return "random"
		}
		var baseRadius: Float {
			return 360
		}
		var baseFillColor: NSColor {
			return NSColor.orange
		}
		var baseStrokeWidth: Float {
			return 0
		}
		var baseStrokeColor: NSColor {
			return NSColor.clear
		}
		var baseShadow: Bool {
			return true
		}
		var centerDiscRadius: Float {
			return 0.5
		}
		var centerDiscFill: NSColor {
			return NSColor.red
		}
		var centerDiscStrokeWidth: Float {
			return 0
		}
		var centerDiscStroke: NSColor {
			return NSColor.clear
		}
		var centerSymbolCornerRadius: Float {
			0.15
		}
		var centerSymbolFill: NSColor {
			return NSColor.yellow
		}
		var centerSymbolStrokeWidth: Float {
			return 0
		}
		var centerSymbolStroke: NSColor {
			return NSColor.clear
		}
		var curvedSymbolThickness: Float {
			return 10
		}
		var curvedSymbolFill: NSColor {
			return NSColor.yellow
		}
		var curvedSymbolStrokeWidth: Float {
			return 0
		}
		var curvedSymbolStroke: NSColor {
			return NSColor.clear
		}
		var yySymbolRadius: Float {
			return 0.2
		}
		var yySymbolStrokeWidth: Float {
			return 0
		}
		var yySymbolStroke: NSColor {
			return NSColor.clear
		}
		var yyPriFill: NSColor {
			return NSColor.black
		}
		var yySecFill: NSColor {
			return NSColor.red
		}
		var yyDotRadius: Float {
			return 0.1
		}
		var yyPriDotFill: NSColor {
			return NSColor.white
		}
		var yyPriDotStrokeWidth: Float {
			return 0
		}
		var yyPriDotStroke: NSColor {
			return NSColor.clear
		}
		var yySecDotFill: NSColor {
			return NSColor.white
		}
		var yySecDotStrokeWidth: Float {
			return 0
		}
		var yySecDotStroke: NSColor {
			return NSColor.clear
		}

		static var `default`: FalunStyle {
			return Style.bkbkg
		}
	}
	*/
// //	 MARK: - ClockView
	/*
	override class var schemeName: String {
		return "Vibrant"
	}
	
	override var styleName: String {
		set {
			style = Style(rawValue: newValue) ?? Style.default
		}
		
		get {
			return style.description
		}
	}
	
	override class var styles: [FalunStyle] {
		return Style.allCases
	}
	
	override func initialize() {
		super.initialize()
		style = Style.default
	}*/
	/*
	override func drawTicks() {
		let color = style.minuteColor
		drawTicks(minorColor: color.withAlphaComponent(0.5), minorLength: 0.05, minorThickness: 0.003,
				  majorColor: color, majorLength: 0.09, majorThickness: 0.006)
	}
	
	override func drawNumbers() {
		drawNumbers(fontSize: 0.06, radius: 0.39)
	}
*/
//	enum starSchemes: ColorSchemeStar {
//		typealias RawValue = String.Type
//		
//		case a
//	}
//	enum starSchemes: ColorSchemeStar/*, String, CaseIterable*/ {
//		init?(rawValue: String) {
//		}
//		
//		var rawValue: String
//		
//		typealias RawValue = String
//		
//		case white = "All White"
//		case yellow = "All Yellow"
//		case blue = "All pale Blue"
//		case random = "random"
//	}
	
//	class var starSchemes {
//		return ColorSchemeStar.allCases
//	}


}

