//
//  StartView.swift
//  Picturesque
//
//  Created by Bruno Barbosa on 16/01/19.
//  Copyright © 2019 Bruno Barbosa. All rights reserved.
//

import UIKit

class StartView: UIViewController {

    @IBOutlet weak var cameraView: MockCameraView!
    @IBOutlet weak var messageLabel: MessageLabel!
    @IBOutlet weak var picturesCollection: PicturesCollectionView!
    
    private var selectedCount: Int = 0 {
        didSet {
            if selectedCount <= 0 {
                self.messageLabel.text = "choose a picture"
            } else {
                self.messageLabel.text = "position picture on the wall"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cameraView.startCamera()
        self.picturesCollection.picturesDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.picturesCollection.reloadPictures()
    }
}

extension StartView: PicturesCollectionDelegate {
    func scanNewPicture() {
        self.performSegue(withIdentifier: "scanPictureSegue", sender: nil)
    }
    
    func selected(picture: Picture) {
        self.cameraView.add(picture: picture)
        self.selectedCount += 1
    }
    
    func deselected(picture: Picture) {
        self.cameraView.remove(picture: picture)
        self.selectedCount -= 1
    }
}
