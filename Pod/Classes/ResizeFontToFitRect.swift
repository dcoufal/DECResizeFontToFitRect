//
// Copyright (c) David Coufal 2015
// davidcoufal.com
// Released for general use under an MIT license: http://opensource.org/licenses/MIT
//

import UIKit

public func resizeFontToRect(
    text: String?,
    font: UIFont,
    rect: CGRect,
    maxFontSize maxFontSizeIn: CGFloat,
    minFontSize: CGFloat,
    fontSizeIncrement: CGFloat = 1.0,
    stringDrawingOption: NSStringDrawingOptions = .UsesLineFragmentOrigin ) -> UIFont
{
    guard maxFontSizeIn > minFontSize else {
        assertionFailure("maxFontSize should be larger than minFontSize")
        return font
    }
    guard let text = text else {
        return font
    }
    
    var maxFontSize = maxFontSizeIn
    
    let words = text.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    
    // calculate max font size based on each word
    for word in words {
        maxFontSize = getMaxFontSizeForWord(word,
            width: CGRectGetWidth(rect),
            font: font,
            maxFontSize: maxFontSize,
            minFontSize: minFontSize,
            fontSizeIncrement: fontSizeIncrement)
    }
    
    // calculate what the font size should be based on entire phrase
    var tempfont = font.fontWithSize(maxFontSize)
    
    var currentFontSize = maxFontSize
    while (currentFontSize > minFontSize) {
        tempfont = font.fontWithSize(currentFontSize)
        
        let constraintSize = CGSizeMake(rect.size.width, CGFloat.max)
        
        let labelSize = text.boundingRectWithSize(
            constraintSize,
            options: stringDrawingOption,
            attributes: [ NSFontAttributeName : tempfont ],
            context: nil)
        
        if (labelSize.height <= CGRectGetHeight(rect)) {
            break
        }
        currentFontSize -= fontSizeIncrement
    }
    
    return tempfont;
}

private func getMaxFontSizeForWord(
    word: String,
    width: CGFloat,
    font: UIFont,
    maxFontSize: CGFloat,
    minFontSize: CGFloat,
    fontSizeIncrement: CGFloat) -> CGFloat
{
    for var currentFontSize: CGFloat = maxFontSize; currentFontSize > minFontSize; currentFontSize -= fontSizeIncrement {
        let tempfont = font.fontWithSize(currentFontSize)
        let labelSize = word.sizeWithAttributes([NSFontAttributeName: tempfont])
        if (labelSize.width < width) {
            return currentFontSize
        }
    }
    return minFontSize
}
