//
//  PlayerListController.swift
//  ChelseaPlayers
//
//  Created by Derick Derick on 19/12/2017.
//  Copyright © 2017 indiemax. All rights reserved.
//

import UIKit

extension Player {
    var firstLetterForSort: String {
        return String(firstName.first!).uppercased()
    }
}

extension PlayersSource {
    static var sortedUniqueFirstLetters: [String] {
        let firstLetters = players.map { $0.firstLetterForSort }
        let uniqueFirstLetters = Set(firstLetters)
        return Array(uniqueFirstLetters).sorted()
    }
    
    static var sectionedPlayers: [[Player]] {
        return sortedUniqueFirstLetters.map { uniqueFirstLetter in
            let filteredPlayers = players.filter { $0.firstLetterForSort == uniqueFirstLetter }
            return filteredPlayers.sorted(by: { $0.firstName < $1.firstName } )
        }
    }
}

class PlayerListController: UITableViewController {

    //var players = PlayersSource.players
    var sectionedPlayers = PlayersSource.sectionedPlayers
    var sectionTitles = PlayersSource.sortedUniqueFirstLetters
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Data Source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionedPlayers.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionedPlayers[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let playerCell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as? PlayerCell else { fatalError() }
        
        let player = sectionedPlayers[indexPath.section][indexPath.row]
        
        playerCell.profileImageView.image = player.image
        playerCell.nameLabel.text = "\(player.firstName) \(player.lastName)"
        playerCell.numberLabel.text = player.number
        
        if player.isFavorite == true {
            playerCell.favoriteImageView.image = #imageLiteral(resourceName: "Star")
        }
        
        
        return playerCell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlayerDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let player = sectionedPlayers[indexPath.section][indexPath.row]
                
                guard let navigationController = segue.destination as? UINavigationController, let playerDetailController = navigationController.topViewController as? PlayerDetailController else { return }
                
                playerDetailController.player = player
            }
        }
    }
    
}
