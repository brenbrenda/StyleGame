//
//  ResultScoreViewController.swift
//  CreateYourStyle
//
//  Created by chia on 2021/3/25.
//

import UIKit

class ResultScoreViewController: UIViewController {

    var EnemyScore: Int = 0
    var MyScore: Int = 0
    var Result = ""
    @IBOutlet weak var EnemyLabel: UILabel!
    @IBOutlet weak var YourLabel: UILabel!
    @IBOutlet weak var WinLoseLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

  
         if EnemyScore < MyScore {
             //win
             WinLoseLabel.text = "You have Won"
         } else if EnemyScore > MyScore {
             //lose
            WinLoseLabel.text = "You Have Lost \n Your Score is \(MyScore)"
         }
        // Do any additional setup after loading the view.
        EnemyLabel.text = "\(EnemyScore) : \(MyScore)"
    }

    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
