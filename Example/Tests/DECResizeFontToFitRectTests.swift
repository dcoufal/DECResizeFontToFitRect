import UIKit
import XCTest
import DECResizeFontToFitRect

class Tests: XCTestCase {
    
    func testNullStringInput() {
        
        let font = UIFont.systemFont(ofSize: 10.0)
        
        let calculatedFont = resize(font: font,
                                    toRect: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0),
                                    forString: nil,
                                    withMaxFontSize: font.pointSize,
                                    withMinFontSize: 1.0)
        
        XCTAssert(calculatedFont == font, "Font should not be modified with nil text input")
    }

    func testSmallStringInput() {
        
        let font = UIFont.systemFont(ofSize: 10.0)
        
        let calculatedFont = resize(font: font,
                                    toRect: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0),
                                    forString: "a",
                                    withMaxFontSize: font.pointSize,
                                    withMinFontSize: 1.0)
        
        XCTAssert(calculatedFont.pointSize == font.pointSize, "The small string should not require a size change")
    }
    
    func testLargeStringInput() {
        
        let font = UIFont.systemFont(ofSize: 100.0)
        
        let calculatedFont = resize(font: font,
                                    toRect: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0),
                                    forString: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                    withMaxFontSize: font.pointSize,
                                    withMinFontSize: 25.0)
        
        XCTAssert(calculatedFont.pointSize == 25.0, "The large string should force the size to go down to the minimum")
    }
    
}
