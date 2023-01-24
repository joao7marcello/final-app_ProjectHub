//
//  ContribuirCollectionViewCell.swift
//  ProjectHub
//
//  Created by Student on 30/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class ContribuirCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ManeiraContribuirLabel: UILabel!
    
    @IBOutlet weak var imagemContribuicao: UIImageView!
    
    func setup(with contribuicao: Contribuicao) {
        imagemContribuicao.image = UIImage(systemName:contribuicao.image)
        ManeiraContribuirLabel.text = contribuicao.tipo
    }
    
}
