//
//  TelaInicialTableViewCell.swift
//  ProjectHub
//
//  Created by Student on 25/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class TelaInicialTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloDestaque: UILabel!
    
    @IBOutlet weak var breveDescricaoDestaque: UILabel!
  
    @IBOutlet weak var autorDestaque: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
