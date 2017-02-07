//
//  ViewController.swift
//  TextRecognition
//
//  Created by mariko on 2017/01/20.
//  Copyright © 2017年 zuccha. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tesseract = G8Tesseract(language: "eng") {
            tesseract.delegate = self
            guard let image = UIImage(named: "demoText.jpg") else {
                print("input file not found")
                return
            }
            tesseract.image = image.g8_blackAndWhite()
            tesseract.recognize()
            textView.text = tesseract.recognizedText
        }
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition Progress \(tesseract.progress) %")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

