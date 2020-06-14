/*
//
//  ExtendButtonBGColor.swift
//  Clock
//
//  Created by Yuma Technical Inc. on 2020-06-14.
//  Copyright © 2020 Sam Soffes. All rights reserved.
//

import AppKit
import ObjectiveC

extension NSButton {
	private func setTitleColor(color: NSColor/*, style: NSParagraphStyle, font: NSFont = NSFont.systemFont(ofSize: 18)*/) {
//		if let mutableAttributedTitle = self.attributedTitle.mutableCopy() as? NSMutableAttributedString {
//			mutableAttributedTitle.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: mutableAttributedTitle.length))
//			self.attributedTitle = mutableAttributedTitle
//		}
		self.attributedTitle = NSMutableAttributedString(string: self.title, attributes: [
			NSAttributedString.Key.foregroundColor: color,
/*			NSAttributedString.Key.paragraphStyle: style,
			NSAttributedString.Key.font: font*/])
	}
	
	private func setBackgroundColor(state: NSControl.StateValue, color: CGColor?) {
		self.wantsLayer = true
		if let color = color {
			self.layer?.backgroundColor = color
		}
	}
	
	@IBInspectable
	var textColor: NSColor? {
		get {
			if let color = objc_getAssociatedObject(self, &textColorHandle) as? NSColor {
				return color
			}
			return nil
		}
		set {
			if let color = newValue {
				self.setTitleColor(color: color)
				objc_setAssociatedObject(self, &textColorHandle, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
			}
		}
	}

	@IBInspectable
	var backgroundColorOffState: NSColor? {
		get {
			if let color = objc_getAssociatedObject(self, &backgroundColorOffStateHandle) as? NSColor {
				return color
			}
			return nil
		}
		set {
			if let color = newValue {
				self.setBackgroundColor(state: NSControl.StateValue.off, color: color.cgColor)
				objc_setAssociatedObject(self, &backgroundColorOffStateHandle, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
			} else {
				self.setBackgroundColor(state: NSControl.StateValue.off, color: nil)
				objc_setAssociatedObject(self, &backgroundColorOffStateHandle, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
			}
		}
	}
	
	@IBInspectable
	var backgroundColorOnState: NSColor? {
		get {
			if let color = objc_getAssociatedObject(self, &backgroundColorOnStateHandle) as? NSColor {
				return color
			}
			return nil
		}
		set {
			if let color = newValue {
				self.setBackgroundColor(state: NSControl.StateValue.on, color: color.cgColor)
				objc_setAssociatedObject(self, &backgroundColorOnStateHandle, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
			} else {
				self.setBackgroundColor(state: NSControl.StateValue.on, color: nil)
				objc_setAssociatedObject(self, &backgroundColorOnStateHandle, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
			}
		}
	}
}
*/
/*****************************************

//import UIKit
//import ObjectiveC

// Declare a global var to produce a unique address as the assoc object handle
var disabledColorHandle: UInt8 = 0
var highlightedColorHandle: UInt8 = 0
var selectedColorHandle: UInt8 = 0

extension NSButton {
	// https://stackoverflow.com/questions/14523348/how-to-change-the-background-color-of-a-uibutton-while-its-highlighted
	private func image(withColor color: NSColor) -> CGImage? {
		let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
		if let context = NSGraphicsContext.current?.cgContext {
//			context.fra NSGraphicsBeginImageContext(rect.size)
//			let context = NSGraphicsGetCurrentContext()
			
			context.setFillColor(color.cgColor)
			context.fill(rect)
			
//			let image = NSGraphicsGetImageFromCurrentImageContext()
			return context.makeImage()
//		UIGraphicsEndImageContext()
		}
		return nil
	}
	
//	func setBackgroundColor(_ color: NSColor, for state: NSControl.StateValue) {
//		self.setBackgroundColor(color, for: state)//.setBackgroundImage(image(withColor: color), for: state)
//	}
	
	@IBInspectable
	var disabledColor: NSColor? {
		get {
			if let color = objc_getAssociatedObject(self, &disabledColorHandle) as? NSColor {
				return color
			}
			return nil
		}
		set {
			if let color = newValue {
				self.state.setBackgroundColor(color, for: NSControl.StateValue.off/*.disabled*/)
				objc_setAssociatedObject(self, &disabledColorHandle, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
			} else {
				self.setBackgroundImage(nil, for: .disabled)
				objc_setAssociatedObject(self, &disabledColorHandle, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
			}
		}
	}
	
	@IBInspectable
	var highlightedColor: NSColor? {
		get {
			if let color = objc_getAssociatedObject(self, &highlightedColorHandle) as? NSColor {
				return color
			}
			return nil
		}
		set {
			if let color = newValue {
				self.setBackgroundColor(color, for: .highlighted)
				objc_setAssociatedObject(self, &highlightedColorHandle, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
			} else {
				self.setBackgroundImage(nil, for: .highlighted)
				objc_setAssociatedObject(self, &highlightedColorHandle, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
			}
		}
	}
	
	@IBInspectable
	var selectedColor: NSColor? {
		get {
			if let color = objc_getAssociatedObject(self, &selectedColorHandle) as? NSColor {
				return color
			}
			return nil
		}
		set {
			if let color = newValue {
				self.setBackgroundColor(color, for: .selected)
				objc_setAssociatedObject(self, &selectedColorHandle, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
			} else {
				self.setBackgroundImage(nil, for: .selected)
				objc_setAssociatedObject(self, &selectedColorHandle, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
			}
		}
	}


}
*/
