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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        resizeFontForLabel(label1)
        resizeFontForLabel(label2)
        resizeFontForLabel(label3)
        resizeFontForLabel(label4)
        resizeFontForLabel(label5)
    }
    
    func resizeFontForLabel(label: UILabel) {
        label.font = resizeFontToRect(label.text,
            font:label.font,
            rect:label.bounds,
            maxFontSize:label.font.pointSize,
            minFontSize:label.font.pointSize * 0.2)
    }
    
}
