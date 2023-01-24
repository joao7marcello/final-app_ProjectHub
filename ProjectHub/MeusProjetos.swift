//
//  MeusProjetos.swift
//  ProjectHub
//
//  Created by Student on 26/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import Foundation

struct MeusProjetosAPI: Decodable{
    
    let titulo: String
    let breveDescricao: String
    let autor: String
    let descricaoCompleta: String
    let contato: String
    let email: String
    let dataDeCriacao: String
    let contribuidores: String
    let estagioDoProjeto: String
    
}


class MeusProjetos {
    
    let titulo: String
    let breveDescricao: String
    let autor: String
    let descricaoCompleta: String
    let contato: String
    let email: String
    let dataDeCriacao: String
    let contribuidores: String
    let estagioDoProjeto: String
    
    init(json: [String: AnyObject]) {
        self.titulo = json["titulo"] as? String ?? ""
        self.breveDescricao = json["breveDescricao"] as? String ?? ""
        self.autor = json["autor"] as? String ?? ""
        self.descricaoCompleta = json["descricaoCompleta"] as? String ?? ""
        self.contato = json["contato"] as? String ?? ""
        self.email = json["email"] as? String ?? ""
        self.dataDeCriacao = json["dataDeCriacao"] as? String ?? ""
        self.contribuidores = json["contribuidores"] as? String ?? ""
        self.estagioDoProjeto = json["estagioDoProjeto"] as? String ?? ""
    }
}
