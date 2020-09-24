//
//  StatsViewController.swift
//  PokenDex
//
//  Created by Sabih on 27/8/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var pokemonHP: UILabel!
    @IBOutlet weak var pokemonAttack: UILabel!
    @IBOutlet weak var pokemonDefense: UILabel!
    @IBOutlet weak var pokemonSpecialAttack: UILabel!
    @IBOutlet weak var pokemonSpecialDefense: UILabel!
    @IBOutlet weak var pokemonSpeed: UILabel!
    @IBOutlet weak var HPProgress: UIProgressView!
    @IBOutlet weak var attackProgress: UIProgressView!
    @IBOutlet weak var defenseProgress: UIProgressView!
    @IBOutlet weak var specialAttackProgress: UIProgressView!
    @IBOutlet weak var specialDefenseProgress: UIProgressView!
    @IBOutlet weak var speedProgress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting Height of UIProgressView since there is no way to do it in storyboard.
        HPProgress.transform = HPProgress.transform.scaledBy(x: 1, y: 3)
        attackProgress.transform = attackProgress.transform.scaledBy(x: 1, y: 3)
        defenseProgress.transform = defenseProgress.transform.scaledBy(x: 1, y: 3)
        specialAttackProgress.transform = specialAttackProgress.transform.scaledBy(x: 1, y: 3)
        specialDefenseProgress.transform = specialDefenseProgress.transform.scaledBy(x: 1, y: 3)
        speedProgress.transform = speedProgress.transform.scaledBy(x: 1, y: 3)
    }
    
}
