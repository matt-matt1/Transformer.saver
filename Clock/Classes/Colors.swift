import AppKit

struct Color {

	// MARK: - Properties

	static let darkBackground = NSColor(displayP3Red: 0.129, green: 0.125, blue: 0.141, alpha: 1)
    static let yellow = NSColor(displayP3Red: 1, green: 211.0 / 255, blue: 17.0 / 255, alpha: 1)
    static let red = NSColor(displayP3Red: 204.0 / 255, green: 29.0 / 255, blue: 26.0 / 255, alpha: 1)
	static let white = NSColor.white
	static let black = NSColor.black

	static let backgroundColor = NSColor(red: 33/255, green: 40/255, blue: 76/255, alpha: 1)
	static let lightBlue = NSColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 0.6)
	static let bgColor = NSColor(hex_rgb: 0x1F2647)				// purple
	static let outerCircleBlue = NSColor(hexString: "#2D36B1")
	static let outerCircleCyan = NSColor(hexString: "#39ADAE")
	static let outerCirclePink = NSColor(hexString: "#6F3FAE")
	static let innerCircleColor = NSColor(hexString: "#A1332F")	// red
	static let taijiRed = NSColor(hexString: "#A1332F")
	static let taijiBlue = NSColor(hexString: "#2F8096")
	static let swastikaYellow = NSColor(hexString: "#91922F")
	static let taijiBlack = NSColor(hexString: "#1F1D20")
	static let taijiWhite = NSColor(hexString: "#A29292")
	static let radiateWhite = NSColor(hexString: "#A29292")

	// MARK - Initializers

	private init() {}
}


extension NSColor {
	
	/// eg. NSColor(str_rgba: "#A1B2C3DD")
	public convenience init?(str_rgba: String) {
		let r, g, b, a: CGFloat
		
		if str_rgba.hasPrefix("#") {
			let start = str_rgba.index(str_rgba.startIndex, offsetBy: 1)
			let hexColor = String(str_rgba[start...])
			
			if hexColor.count == 8 {
				let scanner = Scanner(string: hexColor)
				var hexNumber: UInt64 = 0
				
				if scanner.scanHexInt64(&hexNumber) {
					r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
					g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
					b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
					a = CGFloat(hexNumber & 0x000000ff) / 255
					
					self.init(red: r, green: g, blue: b, alpha: a)
					return
				}
			}
		}
		return nil
	}
	
	/// eg. NSColor(red: 0xA1, green: 0xB2, blue: 0xC3) // optional add: .withAlphaComponent(0.5)
	public convenience init(red: Int, green: Int, blue: Int) {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")
		
		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	}
	
	/// eg. let darkGrey = NSColor(hexString: "#757575")
	public convenience init(hexString: String) {
		let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
		var int = UInt64()
		Scanner(string: hex).scanHexInt64(&int)
		let a, r, g, b: UInt64
		switch hex.count {
			case 3: // RGB (12-bit)
				(a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
			case 6: // RGB (24-bit)
				(a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
			case 8: // ARGB (32-bit)
				(a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
			default:
				(a, r, g, b) = (255, 0, 0, 0)
		}
		self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
	}
	
	/// eg. NSColor(hex_rgb: 0xA1B2C3)
	public convenience init(hex_rgb: Int) {
		self.init(
			red: (hex_rgb >> 16) & 0xFF,
			green: (hex_rgb >> 8) & 0xFF,
			blue: hex_rgb & 0xFF
		)
	}
	
	/// eg. NSColor(red: 0xA1, green: 0xB2, blue: 0xC3, a: 0xDD)
	public convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
		self.init(
			red: CGFloat(red) / 255.0,
			green: CGFloat(green) / 255.0,
			blue: CGFloat(blue) / 255.0,
			alpha: CGFloat(a) / 255.0
		)
	}
	
	/// eg. NSColor(hex_rgba: 0xA1B2C3DD)
	public convenience init(hex_rgba: Int) {
		self.init(
			red: (hex_rgba >> 16) & 0xFF,
			green: (hex_rgba >> 8) & 0xFF,
			blue: hex_rgba & 0xFF,
			a: (hex_rgba >> 24) & 0xFF
		)
	}
	
	
}


//based on https://www.sitepoint.com/store-uicolor-with-userdefaults-in-swift-3/
extension UserDefaults {
	
	func colorForKey(key: String) -> NSColor? {
		var color: NSColor?
		if let colorData = data(forKey: key) {
			color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? NSColor
		}
		return color ?? NSColor.clear
	}
	
	func setColor(color: NSColor?, forKey key: String) {
		var colorData: NSData?
		if let color = color {
			colorData = NSKeyedArchiver.archivedData(withRootObject: color) as NSData?
		}
		set(colorData, forKey: key)
	}


}
