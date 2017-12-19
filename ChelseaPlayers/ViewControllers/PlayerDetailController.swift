//
//  PlayerDetailController.swift
//  ChelseaPlayers
//
//  Created by Derick Derick on 19/12/2017.
//  Copyright © 2017 indiemax. All rights reserved.
//

import UIKit

class PlayerDetailController: UITableViewController {

    var player: Player?
    
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    func configureView() {
        guard let player = player else { return }
        
        nationalityLabel.text = player.nationality
        ageLabel.text = player.age
        roleLabel.text = player.role
        numberLabel.text = player.number
        nameLabel.text = "\(player.firstName) \(player.lastName)"
        imageView.image = player.image
    }
}
