//
// Copyright (c) David Coufal 2015
// davidcoufal.com
// Released for general use under an MIT license: http://opensource.org/licenses/MIT
//

import UIKit
import DECResizeFontToFitRect

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        resizeFontForLabel(label1)
        resizeFontForLabel(label2)
        resizeFontForLabel(label3)
        resizeFontForLabel(label4)
        resizeFontForLabel(label5)
        resizeFontForLabel(label6)
        resizeFontForLabel(label7)
        resizeFontForLabel(label8)
    }
    
    func resizeFontForLabel(_ label: UILabel) {
        label.font = resize(font: label.font,
                            toRect: label.bounds,
                            forString: label.text,
                            withMaxFontSize: label.font.pointSize,
                            withMinFontSize:label.font.pointSize * 0.2)
    }
    
}

