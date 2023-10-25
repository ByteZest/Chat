//
//  Created by Alisa Mylnikova on 20.04.2022.
//

import SwiftUI

extension Color {
	static let gray100 = Color("Grayscale100")
	static let gray200 = Color("Grayscale200")
	static let gray300 = Color("Grayscale300")
	static let gray400 = Color("Grayscale400")
	static let gray500 = Color("Grayscale500")
	static let gray600 = Color("Grayscale600")
	static let gray700 = Color("Grayscale700")
	static let gray800 = Color("Grayscale800")
	static let gray900 = Color("Grayscale900")
	static let red500 = Color("Red500")
	static let green200 = Color("Green200")
	static let green300 = Color("Green300")
	static let green400 = Color("Green400")
	static let green500 = Color("Green500")
	static let green600 = Color("Green600")
	
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
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
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255
        )
    }
}
