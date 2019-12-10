//
//  ViewController.swift
//  ImagesLab
//
//  Created by Adam Diaz on 12/10/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var stepperControl: UIStepper!
    
    
    @IBOutlet weak var textfield: UITextField!
    
    
    @IBOutlet weak var pageNum: UILabel!
    
    @IBOutlet weak var comicTitleLabel: UILabel!
    
    var stepperValue: Double = 614.0 {
        didSet {
            pageNum.text = String(format: "%.01f", stepperControl.value)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comicNetworkData()
        stepperControlValue()
        pageNum.text = String(format: "%.01f", stepperControl.value)
        
    }
    
    func comicNetworkData() {
        ComicApi.comicData(comicNum: Int(stepperValue)) { (result) in
            switch result {
            case .failure(let dataError):
                print("data error: \(dataError)")
            case .success(let comicData):
                DispatchQueue.main.async {
                    self.comicTitleLabel.text = comicData.title
                    self.comicNetworkImage(imageURLString: comicData.img)
                }
            }
        }
    }
    
    func comicNetworkImage(imageURLString: String) {
        ComicApi.comicImage(comicImage: imageURLString) { (result) in
            switch result {
                case .failure(let imageFail):
                    print("data error: \(imageFail)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
    }
    
    func stepperControlValue() {
        stepperControl.minimumValue = 0.0
        stepperControl.maximumValue = 614.0
        stepperControl.stepValue = 1.0
        stepperControl.value = 614.0
    }
    
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperValue = sender.value
        comicNetworkData()
    }
    
    
    @IBAction func textfieldWritten(_ sender: UITextField) {
    }
    
    
    @IBAction func randomButton(_ sender: UIButton) {
        
    }
    
    @IBAction func mostRecentButton(_ sender: UIButton) {
    }
    
}

