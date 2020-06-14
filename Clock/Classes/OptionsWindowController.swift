//
//  OptionsWindowController.swift
//  Clock
//
//  Created by Yuma Technical Inc. on 2020-06-11.
//  Copyright © 2020 Yuma Technical Inc.. All rights reserved.
//

import AppKit
import ScreenSaver

final class OptionsWindowController: NSWindowController, NSTabViewDelegate, NSControlTextEditingDelegate {
	
	// MARK: - Properties
	
	private var toggleTabs = true
	
	@IBOutlet weak var labelOverrideColorScheme: NSTextField!
	@IBOutlet weak var popupOverrideColorScheme: NSPopUpButton!
	@IBOutlet weak var defaultOverrideColorScheme: NSTextField!
	@IBOutlet weak var labelWARNING: NSTextField!
	@IBOutlet weak var btnOK: NSButton!
	@IBOutlet weak var tabView: NSTabView!
	@IBOutlet weak var tabItemBackground: NSTabViewItem!
	@IBOutlet weak var tabItemBase: NSTabViewItem!
	@IBOutlet weak var tabItemCenter: NSTabViewItem!
	@IBOutlet weak var tabItemCurved: NSTabViewItem!
	@IBOutlet weak var tabItemYinYang: NSTabViewItem!
	@IBOutlet weak var btnReset: FlatButton!
	//background
	@IBOutlet weak var labelBackgroundColor: NSTextField!
	@IBOutlet weak var wellBackgroundColor: NSColorWell!
	@IBOutlet weak var defaultBackgroundColor: NSImageView!
	@IBOutlet weak var labelDisplayRays: NSButton!
	@IBOutlet weak var defaultDisplayRays: NSTextField!
	@IBOutlet weak var labelNumStars: NSTextField!
	@IBOutlet weak var fieldNumStars: NSTextField!
	@IBOutlet weak var stepNumStarsInit: NSStepper!
	@IBOutlet weak var defaultNumStars: NSTextField!
	@IBOutlet weak var labelMaxStarSize: NSTextField!
	@IBOutlet weak var fieldMaxStarSize: NSTextField!
	@IBOutlet weak var stepMaxStarSizeInit: NSStepper!
	@IBOutlet weak var defaultMaxStarSize: NSTextField!
	@IBOutlet weak var labelThesholdStarSize: NSTextField!
	@IBOutlet weak var stepThesholdStarSizeControl: NSStepper!
	@IBOutlet weak var fieldThesholdStarSize: NSTextField!
	@IBOutlet weak var defaultThesholdStarSize: NSTextField!
	@IBOutlet weak var labelThesholdCirular: NSTextField!
	@IBOutlet weak var labelThesholdStarShaped: NSTextField!
	@IBOutlet weak var sliderTheshold: NSSlider!
	@IBOutlet weak var labelColorSchemeStar: NSTextField!
	@IBOutlet weak var popupColorSchemeStar: NSPopUpButton!
	//	@IBOutlet weak var popupColorSchemeStar: NSButton!
	@IBOutlet weak var defaultColorSchemeStar: NSTextField!
	//base
	@IBOutlet weak var labelBaseRadius: NSTextField!
	@IBOutlet weak var fieldBaseRadius: NSTextField!
	@IBOutlet weak var stepBaseRadiusInit: NSStepper!
	@IBOutlet weak var defaultBaseRadius: NSTextField!
	@IBOutlet weak var labelBaseFillColor: NSTextField!
	@IBOutlet weak var wellBaseFillColor: NSColorWell!
	@IBOutlet weak var defaultBaseFillColor: NSImageView!
	@IBOutlet weak var labelBaseStrokeWidth: NSTextField!
	@IBOutlet weak var fieldBaseStrokeWidth: NSTextField!
	@IBOutlet weak var stepBaseStrokeWidthInit: NSStepper!
	@IBOutlet weak var defaultBaseStrokeWidth: NSTextField!
	@IBOutlet weak var labelBaseStrokeColor: NSTextField!
	@IBOutlet weak var wellBaseStrokeColor: NSColorWell!
	@IBOutlet weak var defaultBaseStrokeColor: NSImageView!
	@IBOutlet weak var labelBaseShadow: NSButton!
	@IBOutlet weak var defaultBaseShadow: NSTextField!
	//center
	@IBOutlet weak var labelCenterDiscRadius: NSTextField!
	@IBOutlet weak var fieldCenterDiscRadius: NSTextField!
	@IBOutlet weak var stepCenterDiscRadiusInit: NSStepper!
	@IBOutlet weak var defaultCenterDiscRadius: NSTextField!
	@IBOutlet weak var labelCenterDiscFill: NSTextField!
	@IBOutlet weak var wellCenterDiscFill: NSColorWell!
	@IBOutlet weak var defaultCenterDiscFill: NSImageView!
	@IBOutlet weak var labelCenterDiscStrokeWidth: NSTextField!
	@IBOutlet weak var fieldCenterDiscStrokeWidth: NSTextField!
	@IBOutlet weak var stepCenterDiscStrokeWidthInit: NSStepper!
	@IBOutlet weak var defaultCenterDiscStrokeWidth: NSTextField!
	@IBOutlet weak var labelCenterDiscStroke: NSTextField!
	@IBOutlet weak var wellCenterDiscStroke: NSColorWell!
	@IBOutlet weak var defaultCenterDiscStroke: NSImageView!
	@IBOutlet weak var labelCenterSymbolCornerRadius: NSTextField!
	@IBOutlet weak var fieldCenterSymbolCornerRadius: NSTextField!
	@IBOutlet weak var stepCenterSymbolCornerRadiusInit: NSStepper!
	@IBOutlet weak var defaultCenterSymbolCornerRadius: NSTextField!
	@IBOutlet weak var labelCenterSymbolFill: NSTextField!
	@IBOutlet weak var wellCenterSymbolFill: NSColorWell!
	@IBOutlet weak var defaultCenterSymbolFill: NSImageView!
	@IBOutlet weak var labelCenterSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var fieldCenterSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var stepCenterSymbolStrokeWidthInit: NSStepper!
	@IBOutlet weak var defaultCenterSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var labelCenterSymbolStroke: NSTextField!
	@IBOutlet weak var wellCenterSymbolStroke: NSColorWell!
	@IBOutlet weak var defaultCenterSymbolStroke: NSImageView!
	@IBOutlet weak var labelCenterSymbolThickness: NSTextField!
	@IBOutlet weak var fieldCenterSymbolThickness: NSTextField!
	@IBOutlet weak var stepCenterSymbolThicknessInit: NSStepper!
	@IBOutlet weak var defaultCenterSymbolThickness: NSTextField!
	//curved
	@IBOutlet weak var labelCurvedSymbolsRadius: NSTextField!
	@IBOutlet weak var fieldCurvedSymbolsRadius: NSTextField!
	@IBOutlet weak var stepCurvedSymbolsRadiusInit: NSStepperCell!
	@IBOutlet weak var defaultCurvedSymbolsRadius: NSTextField!
	@IBOutlet weak var labelCurvedSymbolThickness: NSTextField!
	@IBOutlet weak var fieldCurvedSymbolThickness: NSTextField!
	@IBOutlet weak var stepCurvedSymbolThicknessInit: NSStepper!
	@IBOutlet weak var defaultCurvedSymbolThickness: NSTextField!
	@IBOutlet weak var labelCurvedSymbolFill: NSTextField!
	@IBOutlet weak var wellCurvedSymbolFill: NSColorWell!
	@IBOutlet weak var defaultCurvedSymbolFill: NSImageView!
	@IBOutlet weak var labelCurvedSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var fieldCurvedSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var stepCurvedSymbolStrokeWidthInit: NSStepper!
	@IBOutlet weak var defaultCurvedSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var labelCurvedSymbolStroke: NSTextField!
	@IBOutlet weak var wellCurvedSymbolStroke: NSColorWell!
	@IBOutlet weak var defaultCurvedSymbolStroke: NSImageView!
	//yin-yang
	@IBOutlet weak var labelYYSymbolRadius: NSTextField!
	@IBOutlet weak var fieldYYSymbolRadius: NSTextField!
	@IBOutlet weak var stepYYSymbolRadiusInit: NSStepper!
	@IBOutlet weak var defaultYYSymbolRadius: NSTextField!
	@IBOutlet weak var labelYYSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var fieldYYSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var stepYYSymbolStrokeWidthInit: NSStepper!
	@IBOutlet weak var defaultYYSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var labelYYSymbolStroke: NSTextField!
	@IBOutlet weak var wellYYSymbolStroke: NSColorWell!
	@IBOutlet weak var defaultYYSymbolStroke: NSImageView!
	@IBOutlet weak var labelYYPriFill: NSTextField!
	@IBOutlet weak var wellYYPriFill: NSColorWell!
	@IBOutlet weak var defaultYYPriFill: NSImageView!
	@IBOutlet weak var labelYYSecFill: NSTextField!
	@IBOutlet weak var wellYYSecFill: NSColorWell!
	@IBOutlet weak var defaultYYSecFill: NSImageView!
	@IBOutlet weak var labelYYDotRadius: NSTextField!
	@IBOutlet weak var fieldYYDotRadius: NSTextField!
	@IBOutlet weak var stepYYDotRadiusInit: NSStepper!
	@IBOutlet weak var defaultYYDotRadius: NSTextField!
	@IBOutlet weak var labelYYPriDotFill: NSTextField!
	@IBOutlet weak var wellYYPriDotFill: NSColorWell!
	@IBOutlet weak var defaultYYPriDotFill: NSImageView!
	@IBOutlet weak var labelYYPriDotStrokeWidth: NSTextField!
	@IBOutlet weak var fieldYYPriDotStrokeWidth: NSTextField!
	@IBOutlet weak var stepYYPriDotStrokeWidthInit: NSStepper!
	@IBOutlet weak var defaultYYPriDotStrokeWidth: NSTextField!
	@IBOutlet weak var labelYYPriDotStroke: NSTextField!
	@IBOutlet weak var wellYYPriDotStroke: NSColorWell!
	@IBOutlet weak var defaultYYPriDotStroke: NSImageView!
	@IBOutlet weak var labelYYSecDotFill: NSTextField!
	@IBOutlet weak var wellYYSecDotFill: NSColorWell!
	@IBOutlet weak var defaultYYSecDotFill: NSImageView!
	@IBOutlet weak var labelYYSecDotStrokeWidth: NSTextField!
	@IBOutlet weak var fieldYYSecDotStrokeWidth: NSTextField!
	@IBOutlet weak var stepYYSecDotStrokeWidthInit: NSStepper!
	@IBOutlet weak var defaultYYSecDotStrokeWidth: NSTextField!
	@IBOutlet weak var labelYYSecDotStroke: NSTextField!
	@IBOutlet weak var wellYYSecDotStroke: NSColorWell!
	@IBOutlet weak var defaultYYSecDotStroke: NSImageView!
	
	
	override var windowNibName: NSNib.Name? {
//		return "OptionsWindowController"
		return "Preferences"
	}
	
	private let preferences = Prefs()
	
	// MARK: - NSObject
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
//		NotificationCenter.default.addObserver(self, selector: #selector(modelDidChange), name: .ModelDidChange,
//											   object: nil)
		
//		stylePopUpButton.removeAllItems()
//
//		let styles = preferences.model.styles
//		stylePopUpButton.addItems(withTitles: styles.map({ $0.description }))
//
//		let index = styles.map { $0.rawValue }.firstIndex(of: preferences.styleName) ?? styles.startIndex
//		stylePopUpButton.selectItem(at: index)
		setDefaults()
		setValues()
		tabView.delegate = self
	}
	
	
	// MARK: - Actions
	
//	@IBAction func selectStyle(_ sender: Any?) {
//		preferences.styleName = preferences.model.styles[stylePopUpButton.indexOfSelectedItem].rawValue
//	}
	@IBAction func fieldBaseRadiusAction(_ sender: Any) {
	}
	@IBAction func popupOverrideColorSchemeAction(_ sender: Any) {
		//		preferences.schemeName = preferences.scheme.styles[popupOverrideColorScheme.indexOfSelectedItem].rawValue
		preferences.schemeName = popupOverrideColorScheme.itemTitles[popupOverrideColorScheme.indexOfSelectedItem]
		toggleTabs = preferences.schemeName == "custom"
	}
	//background
	@IBAction func wellBackgroundColorAction(_ sender: Any) {
		//		FalunView.setNeedsDisplay(FalunView)
	}
	@IBAction func checkDisplayRays(_ sender: Any) {
	}
	@IBAction func stepNumStars(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldNumStars.floatValue = control.floatValue
			stepNumStarsInit.floatValue = control.floatValue
		}
	}
	@IBAction func stepMaxStarSize(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldMaxStarSize.floatValue = control.floatValue
			preferences.maxStarSize = control.floatValue
			sliderTheshold.maxValue = Double(preferences.maxStarSize)
			stepThesholdStarSizeControl.maxValue = Double(preferences.maxStarSize)
			sliderTheshold.numberOfTickMarks = Int(preferences.maxStarSize)
			if fieldThesholdStarSize.floatValue >= control.floatValue {
				fieldThesholdStarSize.floatValue = control.floatValue
			}
		}
	}
	@IBAction func sliderThesholdAction(_ sender: Any) {
		fieldThesholdStarSize.integerValue = sliderTheshold.integerValue
		stepThesholdStarSizeControl.integerValue = sliderTheshold.integerValue
	}
	@IBAction func stepThesholdStarSize(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldThesholdStarSize.floatValue = control.floatValue
			sliderTheshold.integerValue = control.integerValue
		}
	}
	@IBAction func popupColorSchemeStarAction(_ sender: Any) {
		//		preferences.starColorScheme = preferences.scheme.styles[popupColorSchemeStar.indexOfSelectedItem].rawValue
	}
	//base
	@IBAction func stepBaseRadius(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldBaseRadius.floatValue = control.floatValue
			stepBaseRadiusInit.floatValue = control.floatValue
		}
	}
	@IBAction func wellBaseFillColorAction(_ sender: Any) {
	}
	@IBAction func stepBaseStrokeWidth(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldBaseStrokeWidth.floatValue = control.floatValue
			stepBaseStrokeWidthInit.floatValue = control.floatValue
		}
	}
	@IBAction func wellBaseStrokeColorAction(_ sender: Any) {
	}
	@IBAction func checkBaseShadow(_ sender: Any) {
//		if let control = sender as? NSStepper {
//			bases.integerValue += control.integerValue
//		}
	}
	//center
	@IBAction func stepCenterDiscRadius(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldCenterDiscRadius.floatValue = control.floatValue
			stepCenterDiscRadiusInit.floatValue = control.floatValue
		}
	}
	@IBAction func wellCenterDiscFillAction(_ sender: Any) {
	}
	@IBAction func stepCenterDiscStrokeWidth(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldCenterDiscStrokeWidth.floatValue = control.floatValue
			stepCenterDiscStrokeWidthInit.floatValue = control.floatValue
		}
	}
	@IBAction func wellCenterDiscStrokeAction(_ sender: Any) {
	}
	@IBAction func stepCenterSymbolCornerRadius(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldCenterSymbolCornerRadius.floatValue = control.floatValue
			stepCenterSymbolCornerRadiusInit.floatValue = control.floatValue
		}
	}
	@IBAction func wellCenterSymbolFillAction(_ sender: Any) {
	}
	@IBAction func stepCenterSymbolStrokeWidth(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldCenterSymbolStrokeWidth.floatValue = control.floatValue
			stepCenterSymbolStrokeWidthInit.floatValue = control.floatValue
		}
	}
	@IBAction func wellCenterSymbolStrokeAction(_ sender: Any) {
	}
	@IBAction func stepCenterSymbolThickness(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldCenterSymbolThickness.floatValue = control.floatValue
			stepCenterSymbolThicknessInit.floatValue = control.floatValue
		}
	}
	//curved
	@IBAction func stepCurvedSymbolsRadius(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldCurvedSymbolsRadius.floatValue = control.floatValue
			stepCurvedSymbolsRadiusInit.floatValue = control.floatValue
		}
	}
	@IBAction func stepCurvedSymbolThickness(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldCurvedSymbolThickness.floatValue = control.floatValue
			stepCurvedSymbolThicknessInit.floatValue = control.floatValue
		}
	}
	@IBAction func wellCurvedSymbolFillAction(_ sender: Any) {
	}
	@IBAction func stepCurvedSymbolStrokeWidth(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldCurvedSymbolStrokeWidth.floatValue = control.floatValue
			stepCurvedSymbolStrokeWidthInit.floatValue = control.floatValue
		}
	}
	@IBAction func wellCurvedSymbolStrokeAction(_ sender: Any) {
	}
	//yin-yang
	@IBAction func stepYYSymbolRadius(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldYYSymbolRadius.floatValue = control.floatValue
			stepYYSymbolRadiusInit.floatValue = control.floatValue
		}
	}
	@IBAction func stepYYSymbolStrokeWidth(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldYYSymbolStrokeWidth.floatValue = control.floatValue
			stepYYSymbolStrokeWidthInit.floatValue = control.floatValue
		}
	}
	@IBAction func wellYYSymbolStrokeAction(_ sender: Any) {
	}
	@IBAction func wellYYPriFillAction(_ sender: Any) {
	}
	@IBAction func wellYYSecFillAction(_ sender: Any) {
	}
	@IBAction func stepYYDotRadius(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldYYDotRadius.floatValue = control.floatValue
			stepYYDotRadiusInit.floatValue = control.floatValue
		}
	}
	@IBAction func wellYYPriDotFillAction(_ sender: Any) {
	}
	@IBAction func stepYYPriDotStrokeWidth(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldYYPriDotStrokeWidth.floatValue = control.floatValue
			stepYYPriDotStrokeWidthInit.floatValue = control.floatValue
		}
	}
	@IBAction func wellYYPriDotStrokeAction(_ sender: Any) {
	}
	@IBAction func wellYYSecDotFillAction(_ sender: Any) {
	}
	@IBAction func stepYYSecDotStrokeWidth(_ sender: Any) {
		if let control = sender as? NSStepper {
			fieldYYSecDotStrokeWidth.floatValue = control.floatValue
			stepYYSecDotStrokeWidthInit.floatValue = control.floatValue
		}
	}
	@IBAction func wellYYSecDotStrokeAction(_ sender: Any) {
	}
	//buttons
	@IBAction func btnResetAction(_ sender: Any) {
//		preferences.defaults.attributeKeys.forEach { (key) in
//			preferences.defaults.removeObject(forKey: key)
//		}
		preferences.defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
		preferences.defaults.synchronize()
	}
	@IBAction func close(_ sender: Any?) {
		guard let window = window else { return }
		
		if let parent = window.sheetParent {
			parent.endSheet(window)
		} else {
			window.close()
		}
	}
	
	func controlTextDidEndEditing(_ obj: Notification) {
		if let textField = obj.object as? NSTextField {
			if textField == fieldBaseRadius {
				stepBaseRadiusInit.floatValue = fieldBaseRadius.floatValue
				fieldBaseRadius.stringValue = "DONE"
//				let alert = NSAlert()
//				alert.messageText = "field finished editing..."
//				alert.alertStyle = .warning
//				alert.addButton(withTitle: "OK")
//				alert.addButton(withTitle: "Cancel")
//				alert.runModal()
			}
//			print(textField.stringValue)
			//do what you need here
		}
	}

	// MARK: - Private
	
//	@objc private func modelDidChange(_ notification: NSNotification?) {
//		stylePopUpButton.removeAllItems()
//		stylePopUpButton.addItems(withTitles: preferences.model.styles.map { $0.description })
//		
//		stylePopUpButton.selectItem(at: 0)
//		selectStyle(stylePopUpButton)
//	}
	
	func tabView(_ tabView: NSTabView, shouldSelect tabViewItem: NSTabViewItem?) -> Bool {
		return toggleTabs
	}
	
	func setDefaults() {
		defaultOverrideColorScheme.stringValue = preferences.defaultSchemeName
		
		defaultBackgroundColor.wantsLayer = true
		defaultBackgroundColor.layer?.backgroundColor = preferences.defaultScheme.setting.backgroundColor.cgColor
		
		defaultDisplayRays.stringValue = preferences.defaultScheme.setting.displayRays ? "ON" : "OFF"
		
		defaultNumStars.integerValue = preferences.defaultScheme.setting.numStars
		
		defaultMaxStarSize.floatValue = preferences.defaultScheme.setting.maxStarSize
		
		defaultThesholdStarSize.integerValue = preferences.defaultScheme.setting.thesholdStarSize
		
		defaultColorSchemeStar.stringValue = preferences.defaultScheme.setting.starColorScheme
		
		defaultBaseRadius.floatValue = preferences.defaultScheme.setting.baseRadius
		
		defaultBaseFillColor.wantsLayer = true
		defaultBaseFillColor.layer?.backgroundColor = preferences.defaultScheme.setting.baseFillColor.cgColor
		
		defaultBaseStrokeWidth.floatValue = preferences.defaultScheme.setting.baseStrokeWidth
		
		defaultBackgroundColor.wantsLayer = true
		
		defaultBaseStrokeColor.layer?.backgroundColor = preferences.defaultScheme.setting.baseStrokeColor.cgColor
		
		defaultBaseShadow.stringValue = preferences.defaultScheme.setting.baseShadow ? "ON" : "OFF"
		
		defaultCenterDiscRadius.floatValue = preferences.defaultScheme.setting.centerDiscRadius
		
		defaultCenterDiscFill.wantsLayer = true
		defaultCenterDiscFill.layer?.backgroundColor = preferences.defaultScheme.setting.centerDiscFill.cgColor
		
		defaultCenterDiscStrokeWidth.floatValue = preferences.defaultScheme.setting.centerDiscStrokeWidth
		
		defaultCenterDiscStroke.wantsLayer = true
		defaultCenterDiscStroke.layer?.backgroundColor = preferences.defaultScheme.setting.centerDiscStroke.cgColor
		
		defaultCenterSymbolCornerRadius.floatValue = preferences.defaultScheme.setting.centerSymbolCornerRadius
		
		defaultCenterSymbolFill.wantsLayer = true
		defaultCenterSymbolFill.layer?.backgroundColor = preferences.defaultScheme.setting.centerSymbolFill.cgColor
		
		defaultCenterSymbolStrokeWidth.floatValue = preferences.defaultScheme.setting.centerSymbolStrokeWidth
		
		defaultCenterSymbolStroke.wantsLayer = true
		defaultCenterSymbolStroke.layer?.backgroundColor = preferences.defaultScheme.setting.centerSymbolStroke.cgColor
		
		defaultCenterSymbolThickness.floatValue = preferences.defaultScheme.setting.centerSymbolThickness
		
		defaultCurvedSymbolsRadius.floatValue = preferences.defaultScheme.setting.curvedSymbolRadius
		
		defaultCurvedSymbolThickness.floatValue = preferences.defaultScheme.setting.curvedSymbolThickness
		
		defaultCurvedSymbolFill.wantsLayer = true
		defaultCurvedSymbolFill.layer?.backgroundColor = preferences.defaultScheme.setting.curvedSymbolFill.cgColor
		
		defaultCurvedSymbolStrokeWidth.floatValue = preferences.defaultScheme.setting.curvedSymbolStrokeWidth
		
		defaultCurvedSymbolStroke.wantsLayer = true
		defaultCurvedSymbolStroke.layer?.backgroundColor = preferences.defaultScheme.setting.curvedSymbolStroke.cgColor
		
		defaultYYSymbolRadius.floatValue = preferences.defaultScheme.setting.yySymbolRadius
		
		defaultYYSymbolStrokeWidth.floatValue = preferences.defaultScheme.setting.yySymbolStrokeWidth
		
		defaultYYSymbolStroke.wantsLayer = true
		defaultYYSymbolStroke.layer?.backgroundColor = preferences.defaultScheme.setting.yySymbolStroke.cgColor
		
		defaultYYPriFill.wantsLayer = true
		defaultYYPriFill.layer?.backgroundColor = preferences.defaultScheme.setting.yyPriFill.cgColor
		
		defaultYYSecFill.wantsLayer = true
		defaultYYSecFill.layer?.backgroundColor = preferences.defaultScheme.setting.yySecFill.cgColor
		
		defaultYYDotRadius.floatValue = preferences.defaultScheme.setting.yyDotRadius
		
		defaultYYPriDotFill.wantsLayer = true
		defaultYYPriDotFill.layer?.backgroundColor = preferences.defaultScheme.setting.yyPriDotFill.cgColor
		
		defaultYYPriDotStrokeWidth.floatValue = preferences.defaultScheme.setting.yyPriDotStrokeWidth
		
		defaultYYPriDotStroke.wantsLayer = true
		defaultYYPriDotStroke.layer?.backgroundColor = preferences.defaultScheme.setting.yySecDotStroke.cgColor
		
		defaultYYSecDotFill.wantsLayer = true
		defaultYYSecDotFill.layer?.backgroundColor = preferences.defaultScheme.setting.yySecDotFill.cgColor
		
		defaultYYSecDotStrokeWidth.floatValue = preferences.defaultScheme.setting.yySecDotStrokeWidth
		
		defaultYYSecDotStroke.wantsLayer = true
		defaultYYSecDotStroke.layer?.backgroundColor = preferences.defaultScheme.setting.yySecDotStroke.cgColor
	}
	
	func setValues() {
		popupOverrideColorScheme.removeAllItems()
//		let optsOverrideColorScheme = preferences.schemes
//		optsOverrideColorScheme.forEach { (item) in
//			popupOverrideColorScheme.addItem(withTitle: item.schemeName)
//		}
		popupOverrideColorScheme.addItems(withTitles: preferences.schemeNames)
//		popupOverrideColorScheme.addItems(withTitles: optsOverrideColorScheme.map { $0.schemeName })
/*		let indexColorScheme = optsOverrideColorScheme.map { $0.schemeName }.firstIndex(of: preferences.schemeName) ?? optsOverrideColorScheme.startIndex
//		let indexColorScheme = optsOverrideColorScheme.map { $0.rawValue }.firstIndex(of: preferences.schemeName) ?? optsOverrideColorScheme.startIndex
		popupOverrideColorScheme.selectItem(at: indexColorScheme)*/
//		let indexColorScheme = optsOverrideColorScheme.map { $0.schemeName }.firstIndex(of: preferences.schemeName) ?? optsOverrideColorScheme.startIndex
//		popupOverrideColorScheme.selectItem(at: indexColorScheme)
		
		wellBackgroundColor.color = preferences.backgroundColor
		
		labelDisplayRays.state = preferences.displayRays ? NSControl.StateValue.on : NSControl.StateValue.off
		
		fieldNumStars.integerValue = preferences.numStars
		stepNumStarsInit.integerValue = preferences.numStars
//		stepNumStarsInit.maxValue = 10000
		
		fieldMaxStarSize.floatValue = preferences.maxStarSize
		stepMaxStarSizeInit.floatValue = preferences.maxStarSize
		
		fieldThesholdStarSize.integerValue = preferences.thesholdStarSize
		sliderTheshold.integerValue = preferences.thesholdStarSize
		sliderTheshold.maxValue = fieldMaxStarSize.doubleValue//Double(preferences.maxStarSize)
		sliderTheshold.numberOfTickMarks = Int(preferences.maxStarSize)
		sliderTheshold.allowsTickMarkValuesOnly = true
		stepThesholdStarSizeControl.maxValue = fieldMaxStarSize.doubleValue//Double(preferences.maxStarSize)
		stepThesholdStarSizeControl.integerValue = preferences.thesholdStarSize
		
		popupColorSchemeStar.removeAllItems()
//		let schemeNames = preferences.schemes.map { $0.schemeName }
//		preferences.starSchemes.forEach { (scheme) in
//			popupColorSchemeStar.addItem(withTitle: scheme.rawValue)
//		}
//		popupColorSchemeStar.addItems(withTitles: schemeNames/*(preferences.scheme.self).schemeName.setting.starColorSchemes*/)
		popupColorSchemeStar.addItems(withTitles: Vibrant.setting.starColorSchemes)
/*		let optsColorSchemeStar = preferences.scheme.ColorSchemeStar.allCases//Vibrant.ColorSchemeStar.allCases
		popupColorSchemeStar.addItems(withTitles: optsColorSchemeStar.map({ $0.rawValue }))
		let indexColorSchemeStar = optsColorSchemeStar.map { $0.rawValue }.firstIndex(of: preferences.starColorScheme) ?? optsColorSchemeStar.startIndex
		popupColorSchemeStar.selectItem(at: indexColorSchemeStar)
		*/
		
		fieldBaseRadius.floatValue = preferences.baseRadius
		stepBaseRadiusInit.floatValue = preferences.baseRadius
//		stepBaseRadiusInit.maxValue = 10000
		
		wellBaseFillColor.color = preferences.baseFillColor
		
		fieldBaseStrokeWidth.floatValue = preferences.baseStrokeWidth
		stepBaseStrokeWidthInit.floatValue = preferences.baseStrokeWidth
//		stepBaseStrokeWidthInit.maxValue = 100
		stepBaseStrokeWidthInit.increment = 0.1

		wellBaseStrokeColor.color = preferences.baseStrokeColor
		
		labelBaseShadow.state = preferences.baseShadow ? NSControl.StateValue.on : NSControl.StateValue.off
		
		fieldCenterDiscRadius.floatValue = preferences.centerDiscRadius
		stepCenterDiscRadiusInit.floatValue = preferences.centerDiscRadius
		stepCenterDiscRadiusInit.maxValue = 1
		stepCenterDiscRadiusInit.increment = 0.1
		
		wellCenterDiscFill.color = preferences.centerDiscFill
		
		fieldCenterDiscStrokeWidth.floatValue = preferences.centerDiscStrokeWidth
		stepCenterDiscStrokeWidthInit.floatValue = preferences.centerDiscStrokeWidth
//		stepCenterDiscStrokeWidthInit.maxValue = 100
		stepCenterDiscStrokeWidthInit.increment = 0.1

		wellCenterDiscStroke.color = preferences.centerDiscStroke
		
		fieldCenterSymbolCornerRadius.floatValue = preferences.centerSymbolCornerRadius
		stepCenterSymbolCornerRadiusInit.floatValue = preferences.centerSymbolCornerRadius
//		stepCenterSymbolCornerRadiusInit.maxValue = fieldCenterSymbolThickness.doubleValue//Double(preferences.centerSymbolThickness / 2)//
		stepCenterSymbolCornerRadiusInit.increment = 0.1

		wellCenterSymbolFill.color = preferences.centerSymbolFill
		
		fieldCenterSymbolStrokeWidth.floatValue = preferences.centerSymbolStrokeWidth
		stepCenterSymbolStrokeWidthInit.floatValue = preferences.centerSymbolStrokeWidth
//		stepCenterSymbolStrokeWidthInit.maxValue = 100
		stepCenterSymbolStrokeWidthInit.increment = 0.1

		wellCenterSymbolStroke.color = preferences.centerSymbolStroke
		
		fieldCenterSymbolThickness.floatValue = preferences.centerSymbolThickness
		stepCenterSymbolThicknessInit.floatValue = preferences.centerSymbolThickness
		stepCenterSymbolThicknessInit.maxValue = fieldCenterDiscRadius.doubleValue//Double(preferences.centerDiscRadius)
		stepCenterSymbolThicknessInit.increment = 0.1
		
		fieldCurvedSymbolsRadius.floatValue = preferences.curvedSymbolRadius
		stepCurvedSymbolsRadiusInit.floatValue = preferences.curvedSymbolRadius
		stepCurvedSymbolsRadiusInit.maxValue = 1
		stepCurvedSymbolsRadiusInit.increment = 0.1

		fieldCurvedSymbolThickness.floatValue = preferences.curvedSymbolThickness
		stepCurvedSymbolThicknessInit.floatValue = preferences.curvedSymbolThickness
//		stepCurvedSymbolThicknessInit.maxValue = fieldCurvedSymbolsRadius.doubleValue//Double(preferences.curvedSymbolRadius)//
		stepCurvedSymbolThicknessInit.increment = 0.1

		wellCurvedSymbolFill.color = preferences.curvedSymbolFill
		
		fieldCurvedSymbolStrokeWidth.floatValue = preferences.curvedSymbolStrokeWidth
		stepCurvedSymbolStrokeWidthInit.floatValue = preferences.curvedSymbolStrokeWidth
//		stepCurvedSymbolStrokeWidthInit.maxValue = 100
		stepCurvedSymbolStrokeWidthInit.increment = 0.1

		wellCurvedSymbolStroke.color = preferences.curvedSymbolStroke
		
		fieldYYSymbolRadius.floatValue = preferences.yySymbolRadius
		stepYYSymbolRadiusInit.floatValue = preferences.yySymbolRadius
		stepYYSymbolRadiusInit.maxValue = 1
		stepYYSymbolRadiusInit.increment = 0.1
		
		fieldYYSymbolStrokeWidth.floatValue = preferences.yySymbolStrokeWidth
		stepYYSymbolStrokeWidthInit.floatValue = preferences.yySymbolStrokeWidth
		stepYYSymbolStrokeWidthInit.maxValue = 1
		stepYYSymbolStrokeWidthInit.increment = 0.1
		
		wellYYSymbolStroke.color = preferences.yySymbolStroke
		wellYYPriFill.color = preferences.yyPriFill
		wellYYSecFill.color = preferences.yySecFill
		
		fieldYYDotRadius.floatValue = preferences.yyDotRadius
		stepYYDotRadiusInit.floatValue = preferences.yyDotRadius
		stepYYDotRadiusInit.maxValue = 1
		stepYYDotRadiusInit.increment = 0.1
		
		wellYYPriDotFill.color = preferences.yyPriDotFill
		
		fieldYYPriDotStrokeWidth.floatValue = preferences.yyPriDotStrokeWidth
		stepYYPriDotStrokeWidthInit.floatValue = preferences.yyPriDotStrokeWidth
//		stepYYPriDotStrokeWidthInit.maxValue = 100
		stepYYPriDotStrokeWidthInit.increment = 0.1

		wellYYPriDotStroke.color = preferences.yyPriDotStroke
		
		wellYYSecDotFill.color = preferences.yySecDotFill
		
		fieldYYSecDotStrokeWidth.floatValue = preferences.yySecDotStrokeWidth
		stepYYSecDotStrokeWidthInit.floatValue = preferences.yySecDotStrokeWidth
//		stepYYSecDotStrokeWidthInit.maxValue = 100
		stepYYSecDotStrokeWidthInit.increment = 0.1

		wellYYSecDotStroke.color = preferences.yySecDotStroke
	}


}
