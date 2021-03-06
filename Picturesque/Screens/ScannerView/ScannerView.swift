//
//  ScanView.swift
//  Picturesque
//
//  Created by Bruno Barbosa on 16/01/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

class ScannerView: UIViewController {

    @IBOutlet weak var messageLbl: MessageLabel!
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var secondaryBtn: LabelButton!
    
    private var isScanning: Bool = false {
        didSet {
            self.photoBtn.isEnabled = !self.isScanning
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func scanPictureTapped(_ sender: Any) {
        if isScanning {
            return
        }
        self.isScanning = true
        self.messageLbl.text = "scanning your picture"
        
        LaserView.scan(view: self.view, completion: {
//            self.isScanning = false
//            self.messageLbl.text = "ready for next picture"
//            self.secondaryBtn.setTitle("Done", for: .disabled)
//            self.secondaryBtn.setTitle("Done", for: .normal)
            
            // Mock picture scanning
            PicturesManager.scanNewPicture()
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    @IBAction func dimissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
