//
//  ViewController.swift
//  StyleGame
//
//  Created by chia on 2021/3/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var head: UIImageView!
    @IBOutlet weak var facehead: UIImageView!
    @IBOutlet weak var posehead: UIImageView!
    @IBOutlet weak var faceemoji: UIImageView!
    @IBOutlet weak var poseemoji: UIImageView!
    @IBOutlet weak var Pose: UIImageView!
    @IBOutlet weak var finalhead: UIImageView!
    @IBOutlet weak var finalemoji: UIImageView!
    @IBOutlet weak var finalpose: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func SelectedHead(_ sender: UIButton) {
        head.image = sender.currentImage
        facehead.image = sender.currentImage
        posehead.image = sender.currentImage
        finalhead.image = sender.currentImage
    }
    
    @IBAction func SelectedFaceEmoji(_ sender: UIButton) {
        faceemoji.image = sender.currentImage
        poseemoji.image = sender.currentImage
        finalemoji.image = sender.currentImage
    }
    
    @IBAction func SelectedPose(_ sender: UIButton) {
        Pose.image = sender.currentImage
        finalpose.image = sender.currentImage
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let GameVC = segue.destination as? GameViewController {
            GameVC.image1 = facehead.image
            GameVC.image2 = faceemoji.image
            GameVC.image3 = Pose.image
        }
    }
    @IBAction func backtoMainSegue(_ sender : UIStoryboardSegue) {
        
    }

}

