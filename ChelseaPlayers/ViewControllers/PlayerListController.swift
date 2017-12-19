//
//  PlayerListController.swift
//  ChelseaPlayers
//
//  Created by Derick Derick on 19/12/2017.
//  Copyright © 2017 indiemax. All rights reserved.
//

import UIKit

class PlayerListController: UITableViewController {

    var players = PlayersSource.players
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        
        let player = players[indexPath.row]
        cell.textLabel?.text = "\(player.firstName) \(player.lastName)"
        cell.imageView?.image = player.image
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlayerDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let player = players[indexPath.row]
                
                guard let navigationController = segue.destination as? UINavigationController, let playerDetailController = navigationController.topViewController as? PlayerDetailController else { return }
                
                playerDetailController.player = player
            }
        }
    }
    
}
