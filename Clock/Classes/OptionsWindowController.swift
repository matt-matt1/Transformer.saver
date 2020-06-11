//
//  OptionsWindowController.swift
//  Clock
//
//  Created by Yuma Technical Inc. on 2020-06-11.
//  Copyright © 2020 Yuma Technical Inc.. All rights reserved.
//

import AppKit
import ScreenSaver

final class OptionsWindowController: NSWindowController {
	
	// MARK: - Properties
	
	@IBOutlet weak var labelOverrideColorScheme: NSTextField!
	@IBOutlet weak var popupOverrideColorScheme: NSPopUpButton!
	@IBOutlet weak var defaultOverrideColorScheme: NSTextField!
	@IBOutlet weak var labelWARNING: NSTextField!
	@IBOutlet weak var btnOK: NSButton!
	@IBOutlet weak var tabView: NSTabView!
	//	@IBOutlet weak var stylePopUpButton: NSPopUpButton!
	//background
	@IBOutlet weak var labelBackgroundColor: NSTextField!
	@IBOutlet weak var wellBackgroundColor: NSColorWell!
	@IBOutlet weak var defaultBackgroundColor: NSImageView!
	@IBOutlet weak var labelDisplayRays: NSButton!
	@IBOutlet weak var defaultDisplayRays: NSTextField!
	@IBOutlet weak var labelNumStars: NSTextField!
	@IBOutlet weak var fieldNumStars: NSTextField!
	@IBOutlet weak var defaultNumStars: NSTextField!
	@IBOutlet weak var labelMaxStarSize: NSTextField!
	@IBOutlet weak var fieldMaxStarSize: NSTextField!
	@IBOutlet weak var defaultMaxStarSize: NSTextField!
	@IBOutlet weak var labelThesholdStarSize: NSTextField!
	@IBOutlet weak var fieldThesholdStarSize: NSTextField!
	@IBOutlet weak var defaultThesholdStarSize: NSTextField!
	@IBOutlet weak var labelColorSchemeStar: NSTextField!
	@IBOutlet weak var popupColorSchemeStar: NSButton!
	@IBOutlet weak var defaultColorSchemeStar: NSTextField!
	//base
	@IBOutlet weak var labelBaseRadius: NSTextField!
	@IBOutlet weak var fieldBaseRadius: NSTextField!
	@IBOutlet weak var defaultBaseRadius: NSTextField!
	@IBOutlet weak var labelBaseFillColor: NSTextField!
	@IBOutlet weak var wellBaseFillColor: NSColorWell!
	@IBOutlet weak var defaultBaseFillColor: NSImageView!
	@IBOutlet weak var labelBaseStrokeWidth: NSTextField!
	@IBOutlet weak var fieldBaseStrokeWidth: NSTextField!
	@IBOutlet weak var defaultBaseStrokeWidth: NSTextField!
	@IBOutlet weak var labelBaseStrokeColor: NSTextField!
	@IBOutlet weak var wellBaseStrokeColor: NSColorWell!
	@IBOutlet weak var defaultBaseStrokeColor: NSImageView!
	@IBOutlet weak var labelBaseShadow: NSButton!
	@IBOutlet weak var defaultBaseShadow: NSTextField!
	//center
	@IBOutlet weak var labelCenterDiscRadius: NSTextField!
	@IBOutlet weak var fieldCenterDiscRadius: NSTextField!
	@IBOutlet weak var defaultCenterDiscRadius: NSTextField!
	@IBOutlet weak var labelCenterDiscFill: NSTextField!
	@IBOutlet weak var wellCenterDiscFill: NSColorWell!
	@IBOutlet weak var defaultCenterDiscFill: NSImageView!
	@IBOutlet weak var labelCenterDiscStrokeWidth: NSTextField!
	@IBOutlet weak var fieldCenterDiscStrokeWidth: NSTextField!
	@IBOutlet weak var defaultCenterDiscStrokeWidth: NSTextField!
	@IBOutlet weak var labelCenterDiscStroke: NSTextField!
	@IBOutlet weak var wellCenterDiscStroke: NSColorWell!
	@IBOutlet weak var defaultCenterDiscStroke: NSImageView!
	@IBOutlet weak var labelCenterSymbolCornerRadius: NSTextField!
	@IBOutlet weak var fieldCenterSymbolCornerRadius: NSTextField!
	@IBOutlet weak var defaultCenterSymbolCornerRadius: NSTextField!
	@IBOutlet weak var labelCenterSymbolFill: NSTextField!
	@IBOutlet weak var wellCenterSymbolFill: NSColorWell!
	@IBOutlet weak var defaultCenterSymbolFill: NSImageView!
	@IBOutlet weak var labelCenterSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var fieldCenterSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var defaultCenterSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var labelCenterSymbolStroke: NSTextField!
	@IBOutlet weak var wellCenterSymbolStroke: NSColorWell!
	@IBOutlet weak var defaultCenterSymbolStroke: NSImageView!
	//curved
	@IBOutlet weak var labelCurvedSymbolThickness: NSTextField!
	@IBOutlet weak var fieldCurvedSymbolThickness: NSTextField!
	@IBOutlet weak var defaultCurvedSymbolThickness: NSTextField!
	@IBOutlet weak var labelCurvedSymbolFill: NSTextField!
	@IBOutlet weak var wellCurvedSymbolFill: NSColorWell!
	@IBOutlet weak var defaultCurvedSymbolFill: NSImageView!
	@IBOutlet weak var labelCurvedSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var fieldCurvedSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var defaultCurvedSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var labelCurvedSymbolStroke: NSTextField!
	@IBOutlet weak var wellCurvedSymbolStroke: NSColorWell!
	@IBOutlet weak var defaultCurvedSymbolStroke: NSImageView!
	//yin-yang
	@IBOutlet weak var labelYYSymbolRadius: NSTextField!
	@IBOutlet weak var fieldYYSymbolRadius: NSTextField!
	@IBOutlet weak var defaultYYSymbolRadius: NSTextField!
	@IBOutlet weak var labelYYSymbolStrokeWidth: NSTextField!
	@IBOutlet weak var fieldYYSymbolStrokeWidth: NSTextField!
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
	@IBOutlet weak var defaultYYDotRadius: NSTextField!
	@IBOutlet weak var labelYYPriDotFill: NSTextField!
	@IBOutlet weak var wellYYPriDotFill: NSColorWell!
	@IBOutlet weak var defaultYYPriDotFill: NSImageView!
	@IBOutlet weak var labelYYPriDotStrokeWidth: NSTextField!
	@IBOutlet weak var fieldYYPriDotStrokeWidth: NSTextField!
	@IBOutlet weak var defaultYYPriDotStrokeWidth: NSTextField!
	@IBOutlet weak var labelYYPriDotStroke: NSTextField!
	@IBOutlet weak var wellYYPriDotStroke: NSColorWell!
	@IBOutlet weak var defaultYYPriDotStroke: NSImageView!
	@IBOutlet weak var labelYYSecDotFill: NSTextField!
	@IBOutlet weak var wellYYSecDotFill: NSColorWell!
	@IBOutlet weak var defaultYYSecDotFill: NSImageView!
	@IBOutlet weak var labelYYSecDotStrokeWidth: NSTextField!
	@IBOutlet weak var fieldYYSecDotStrokeWidth: NSTextField!
	@IBOutlet weak var defaultYYSecDotStrokeWidth: NSTextField!
	@IBOutlet weak var labelYYSecDotStroke: NSTextField!
	@IBOutlet weak var wellYYSecDotStroke: NSColorWell!
	@IBOutlet weak var defaultYYSecDotStroke: NSImageView!

	//actions
	@IBAction func popupOverrideColorSchemeAction(_ sender: Any) {
		// TODO: disable tabview if not "custom"
//		tabView.ena.tabViewItems.forEach { (item) in
//			item.view.ena
//		}
	}
	//background
	@IBAction func wellBackgroundColorAction(_ sender: Any) {
	}
	@IBAction func checkDisplayRays(_ sender: Any) {
	}
	@IBAction func stepNumStars(_ sender: Any) {
	}
	@IBAction func stepMaxStarSize(_ sender: Any) {
	}
	@IBAction func stepThesholdStarSize(_ sender: Any) {
	}
	@IBAction func popupColorSchemeStarAction(_ sender: Any) {
	}
	//base
	@IBAction func stepBaseRadius(_ sender: Any) {
	}
	@IBAction func wellBaseFillColorAction(_ sender: Any) {
	}
	@IBAction func stepBaseStrokeWidth(_ sender: Any) {
	}
	@IBAction func wellBaseStrokeColorAction(_ sender: Any) {
	}
	@IBAction func checkBaseShadow(_ sender: Any) {
	}
	//center
	@IBAction func stepCenterDiscRadius(_ sender: Any) {
	}
	@IBAction func wellCenterDiscFillAction(_ sender: Any) {
	}
	@IBAction func stepCenterDiscStrokeWidth(_ sender: Any) {
	}
	@IBAction func wellCenterDiscStrokeAction(_ sender: Any) {
	}
	@IBAction func stepCenterSymbolCornerRadius(_ sender: Any) {
	}
	@IBAction func wellCenterSymbolFillAction(_ sender: Any) {
	}
	@IBAction func stepCenterSymbolStrokeWidth(_ sender: Any) {
	}
	@IBAction func wellCenterSymbolStrokeAction(_ sender: Any) {
	}
	//curved
	@IBAction func stepCurvedSymbolThickness(_ sender: Any) {
	}
	@IBAction func wellCurvedSymbolFillAction(_ sender: Any) {
	}
	@IBAction func stepCurvedSymbolStrokeWidth(_ sender: Any) {
	}
	@IBAction func wellCurvedSymbolStrokeAction(_ sender: Any) {
	}
	//yin-yang
	@IBAction func stepYYSymbolRadius(_ sender: Any) {
	}
	@IBAction func stepYYSymbolStrokeWidth(_ sender: Any) {
	}
	@IBAction func wellYYSymbolStrokeAction(_ sender: Any) {
	}
	@IBAction func wellYYPriFillAction(_ sender: Any) {
	}
	@IBAction func wellYYSecFillAction(_ sender: Any) {
	}
	@IBAction func stepYYDotRadius(_ sender: Any) {
	}
	@IBAction func wellYYPriDotFillAction(_ sender: Any) {
	}
	@IBAction func stepYYPriDotStrokeWidth(_ sender: Any) {
	}
	@IBAction func wellYYPriDotStrokeAction(_ sender: Any) {
	}
	@IBAction func wellYYSecDotFillAction(_ sender: Any) {
	}
	@IBAction func stepYYSecDotStrokeWidth(_ sender: Any) {
	}
	@IBAction func wellYYSecDotStrokeAction(_ sender: Any) {
	}

	
	override var windowNibName: NSNib.Name? {
//		return "OptionsWindowController"
		return "Preferences"
	}
	
	private let preferences = Preferences()
	
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
	}
	
	
	// MARK: - Actions
	
//	@IBAction func selectStyle(_ sender: Any?) {
//		preferences.styleName = preferences.model.styles[stylePopUpButton.indexOfSelectedItem].rawValue
//	}
	
	@IBAction func close(_ sender: Any?) {
		guard let window = window else { return }
		
		if let parent = window.sheetParent {
			parent.endSheet(window)
		} else {
			window.close()
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


}
