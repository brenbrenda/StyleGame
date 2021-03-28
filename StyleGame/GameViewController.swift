//
//  GameViewController.swift
//  CreateYourStyle
//
//  Created by chia on 2021/3/23.
//

import UIKit


class GameViewController: UIViewController {
    let imageView = UIImageView(frame: CGRect(x: 109, y: 599, width: 109, height: 109))
    let animatedImage = UIImage.animatedImageNamed("Paper-", duration: 0.5)
    let EnemyHandImage = ["Paper-1","Paper-2","Paper-3"]
    var timer = Timer()
    var timeRemain = 0.0
    var myscore = 0, computerscore = 0
    var chosenSegmented: Int!
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!

    @IBOutlet weak var headImage: UIImageView?
    @IBOutlet weak var faceImage: UIImageView?
    @IBOutlet weak var clotheImage: UIImageView?
    @IBOutlet weak var ContinueButton: UIButton!
    @IBOutlet weak var Effect: UIVisualEffectView!
    @IBOutlet weak var ScissorsButton: UIButton!
    @IBOutlet weak var MyScore: UILabel!
    @IBOutlet weak var ComputerScore: UILabel!
    @IBOutlet weak var StoneButton: UIButton!
    @IBOutlet weak var WinLoseLabel: UILabel!
    @IBOutlet weak var ChosenLoserLabel: UILabel!
    @IBOutlet weak var PaperButton: UIButton!
    @IBOutlet weak var TimerLeft: UILabel!
    @IBOutlet weak var Replay: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        headImage?.image = image1
        faceImage?.image = image2
        clotheImage?.image = image3
        ScoreReset()
        Reset()
    }
    
    @objc func countdown()
    {
        timeRemain -= 0.01
        TimerLeft.text = String(format: "%.2f", self.timeRemain)
        if timeRemain < 0.01
        {
            timer.invalidate()
            imageView.isHidden = true
            let alertController = UIAlertController(
                title: "Time is up!",
                message: "Enemy win a point",
                preferredStyle: .alert)
            
            let okButton = UIAlertAction(
                title: "ok",
                style: .default,
                handler: {(action: UIAlertAction!) -> Void in})
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)
            computerscore += 1
            ComputerScore.text = "Enemy Score is: \(computerscore)"
            imageView.alpha = 0.6
            isHiddenfalse()
        }
    }

    
    
    @IBAction func ContinuePlay(_ sender: Any) {
        Reset()
    }
    
    @IBAction func ReplayButton(_ sender: Any) {
        ScoreReset()
        Reset()
    }
    
    @IBAction func Game(_ sender: UIButton) {
        imageView.image = UIImage(named: EnemyHandImage.randomElement()!)
        switch sender {
        case PaperButton:
            if imageView.image == UIImage(named: EnemyHandImage[0]) {
                WinLoseLabel.text = "draw"
                ChosenLoserLabel.text = "draw"
            } else if imageView.image == UIImage(named: EnemyHandImage[1]) {
                WinLoseLabel.text = "lose"
                ChosenLoserLabel.text = "win"
            } else if imageView.image == UIImage(named: EnemyHandImage[2]) {
                WinLoseLabel.text = "win"
                ChosenLoserLabel.text = "lose"
            }
            score()
            ScissorsButton.isHidden = true
            StoneButton.isHidden = true
            break
        case ScissorsButton:
            if imageView.image == UIImage(named: EnemyHandImage[0]) {
                WinLoseLabel.text = "win"
                ChosenLoserLabel.text = "lose"
            } else if imageView.image == UIImage(named: EnemyHandImage[1]) {
                WinLoseLabel.text = "draw"
                ChosenLoserLabel.text = "draw"
            } else if imageView.image == UIImage(named: EnemyHandImage[2]) {
                WinLoseLabel.text = "lose"
                ChosenLoserLabel.text = "win"
            }
            score()
            PaperButton.isHidden = true
            StoneButton.isHidden = true
            break
        case StoneButton:
            if imageView.image == UIImage(named: EnemyHandImage[0]) {
                WinLoseLabel.text = "lose"
                ChosenLoserLabel.text = "win"
            } else if imageView.image == UIImage(named: EnemyHandImage[1]) {
                WinLoseLabel.text = "win"
                ChosenLoserLabel.text = "lose"
            } else if imageView.image == UIImage(named: EnemyHandImage[2]) {
                WinLoseLabel.text = "draw"
                ChosenLoserLabel.text = "draw"
            }
            score()
            PaperButton.isHidden = true
            ScissorsButton.isHidden = true
            break
        default:
            break
        }
        switch chosenSegmented {
        case 0:
            let alertController = UIAlertController(
                title: WinLoseLabel.text,
                message: ":)",
                preferredStyle: .alert)
            let okButton = UIAlertAction(
                title: "ok",
                style: .default,
                handler: {(action: UIAlertAction!) -> Void in})
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)
        case 1:
            let alertController = UIAlertController(
                title: ChosenLoserLabel.text,
                message: ":)",
                preferredStyle: .alert)
            let okButton = UIAlertAction(
                title: "ok",
                style: .default,
                handler: {(action: UIAlertAction!) -> Void in})
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)
        default:
            break
        }
        imageView.alpha = 0.6
        isHiddenfalse()
    }
    
    func Reset() {
        imageView.isHidden = false
        imageView.image = animatedImage
        timeRemain = 5
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(GameViewController.countdown), userInfo: nil, repeats: true)
        Replay.isHidden = true
        Effect.isHidden = true
        ContinueButton.isHidden = true
        PaperButton.isHidden = false
        ScissorsButton.isHidden = false
        StoneButton.isHidden = false
        
    }
    func  isHiddenfalse() {
        timer.invalidate()
        Replay.isHidden = false
        Effect.isHidden = false
        ContinueButton.isHidden = false
    }
    
    func ScoreReset() {
        myscore = 0
        computerscore = 0
        MyScore.text = "Your score is: \(myscore)"
        ComputerScore.text = "Enemy Score is: \(computerscore)"
    }
    
    func score(){
        switch chosenSegmented {
        case 0:
            if WinLoseLabel.text == "win" {
                myscore += 1
                MyScore.text = "Your score is: \(myscore)"
            } else if WinLoseLabel.text == "lose" {
                computerscore += 1
                ComputerScore.text = "Enemy Score is: \(computerscore)"
            }
        case 1:
            if WinLoseLabel.text == "lose" {
                myscore += 1
                MyScore.text = "Your score is: \(myscore)"
            } else if WinLoseLabel.text == "win" {
                computerscore += 1
                ComputerScore.text = "Enemy Score is: \(computerscore)"
            }
        default:
            break
        }
        
        if myscore >= 5 || computerscore >= 5 // time's up
       {
           //timer.invalidate()
            self.performSegue(withIdentifier: "ShowResult", sender: Any?.self)
            ContinueButton.isHidden = true
       }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ResultVC = segue.destination as? ResultScoreViewController {
            ResultVC.EnemyScore = computerscore
            ResultVC.MyScore = myscore
        }

    }
    @IBAction func unwindSegue(_ sender : UIStoryboardSegue) {
        ScoreReset()
        Reset()
    }


}
