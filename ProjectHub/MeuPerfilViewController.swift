//
//  MeuPerfilViewController.swift
//  ProjectHub
//
//  Created by Student on 25/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class MeuPerfilViewController: UIViewController {
    
    @IBOutlet weak var fotoPerfil: UIImageView!
    
    @IBOutlet weak var projetosCriados: UILabel!

    @IBOutlet weak var projetosEnvolvidos: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        fotoPerfil.image = UIImage(named: "EDDFB3")
        fotoPerfil.layer.cornerRadius = fotoPerfil.frame.size.width / 2

        
        fotoPerfil.clipsToBounds = true
        
    

        // Do any additional setup after loading the view.
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
