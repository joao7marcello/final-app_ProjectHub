//
//  MeusProjetosTableViewCell.swift
//  ProjectHub
//
//  Created by Student on 30/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class MeusProjetosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var meuTitulo: UILabel!
    
    @IBOutlet weak var meuDescricao: UILabel!
    
    @IBOutlet weak var meuDataDescricao: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
