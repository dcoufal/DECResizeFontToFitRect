import UIKit
import XCTest
import DECResizeFontToFitRect

class Tests: XCTestCase {
    
    func testNullStringInput() {
        
        let font = UIFont.systemFontOfSize(10.0)
        
        let calculatedFont = resizeFontToRect(nil,
            font:font,
            rect:CGRectMake(0.0, 0.0, 10.0, 10.0),
            maxFontSize:font.pointSize,
            minFontSize:1.0)
        
        XCTAssert(calculatedFont == font, "Font should not be modified with nil text input")
    }

    func testSmallStringInput() {
        
        let font = UIFont.systemFontOfSize(10.0)
        
        let calculatedFont = resizeFontToRect("a",
            font:font,
            rect:CGRectMake(0.0, 0.0, 100.0, 100.0),
            maxFontSize:font.pointSize,
            minFontSize:1.0)
        
        XCTAssert(calculatedFont.pointSize == font.pointSize, "The small string should not require a size change")
    }
    
    func testLargeStringInput() {
        
        let font = UIFont.systemFontOfSize(100.0)
        
        let calculatedFont = resizeFontToRect("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            font:font,
            rect:CGRectMake(0.0, 0.0, 100.0, 100.0),
            maxFontSize:font.pointSize,
            minFontSize:25.0)
        
        XCTAssert(calculatedFont.pointSize == 25.0, "The large string should force the size to go down to the minimum")
    }
    
}
