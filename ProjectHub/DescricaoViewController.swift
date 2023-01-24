//
//  DescricaoViewController.swift
//  ProjectHub
//
//  Created by Student on 25/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class DescricaoViewController: UIViewController {
    
    var destaqueaux: DestaquesAPI?
    
    
    @IBOutlet weak var tituloDescricao: UILabel!
    
    @IBOutlet weak var descricaoCompletaDescricao: UILabel!
    
    @IBOutlet weak var contatoDescricao: UILabel!
    
    @IBOutlet weak var emailDescricao: UILabel!
    
    @IBOutlet weak var dataDeCriacaoDescricao: UILabel!
    
    @IBOutlet weak var donoDoProjetoDescricao: UILabel!
    
    @IBOutlet weak var contribuidoresDescricao: UILabel!
    
    @IBOutlet weak var estagioDoProjetoDescricao: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tituloDescricao.text = destaqueaux?.titulo
        
        descricaoCompletaDescricao.text = destaqueaux?.descricaoCompleta
        
        contatoDescricao.text = destaqueaux?.contato
        
        emailDescricao.text = destaqueaux?.email
        
        dataDeCriacaoDescricao.text = destaqueaux?.dataDeCriacao
        
        donoDoProjetoDescricao.text = destaqueaux?.autor
        
        contribuidoresDescricao.text = destaqueaux?.contribuidores
        
        estagioDoProjetoDescricao.text = destaqueaux?.estagioDoProjeto
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "descricaoParaContribuir"{
            if segue.destination is ContribuicaoViewController{
                
            }
            
        }
        
    }
    

}
