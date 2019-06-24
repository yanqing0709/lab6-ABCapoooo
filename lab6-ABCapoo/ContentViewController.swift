//
//  ContentViewController.swift
//  lab6-ABCapoo
//
//  Created by 陳嬿晴 on 2019/6/24.
//  Copyright © 2019 陳嬿晴. All rights reserved.
//

import UIKit
import AVFoundation

class ContentViewController: UIViewController {

    @IBOutlet weak var vocabularyLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var oppositeLabel: UILabel!
    
    var content_vocabularies = [Vocabulary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let content_v = content_vocabularies[0]
        vocabularyLabel.text = content_v.alphabet
        meaningLabel.text = content_v.meaning
        exampleLabel.text = content_v.example
        oppositeLabel.text = content_v.opposite
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func speakButtonPressed(_ sender: Any) {
        let content_v = content_vocabularies[0]
        let speechUtterance = AVSpeechUtterance(string: content_v.alphabet)
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
    
}
