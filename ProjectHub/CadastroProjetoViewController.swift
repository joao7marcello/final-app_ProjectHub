//
//  CadastroProjetoViewController.swift
//  ProjectHub
//
//  Created by Student on 25/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class CadastroProjetoViewController: UIViewController {

    @IBOutlet weak var tituloCadastro: UITextField!
    
    @IBOutlet weak var breveDescricaoCadastro: UITextField!
    
    @IBOutlet weak var descricaoCompletaCadastro: UITextView!
    
    @IBOutlet weak var contatoCadastro: UITextField!
    
    @IBOutlet weak var emailCadastro: UITextField!
    
    @IBOutlet weak var estagioDoProjeto: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func criarProjeto(_ sender: Any) {
        
        self.PostAPIMeusProjetos()
        
    }
    
    
    func PostAPIMeusProjetos(){
        
        // coleta a data
        let myTime = Date()
        let format = DateFormatter()
        format.timeStyle = .short
        format.dateStyle = .short
        //--------------------------------
        
        //atribuicao de valores dos outlets
        guard let titulo = self.tituloCadastro.text else { return }
        guard let breveDescricao = self.breveDescricaoCadastro.text else { return }
        let autor = "Project Hub Inc" // valor chumbado
        guard let descricaoCompleta = self.descricaoCompletaCadastro.text else { return }
        guard let contatoCadastro = self.contatoCadastro.text else { return }
        guard let email = self.emailCadastro.text else { return }
        let dataCriacao = format.string(from: myTime)
        let contribuidores = "4" //valor chumbado
        guard let estagioDoProjeto = self.estagioDoProjeto.text else { return }
        //--------------------------------
        
        
        let url = URL(string: "https://noderedaluno01202202.kgsx7kocpw2.us-south.codeengine.appdomain.cloud/criarPostMeusProjetos")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let parameters: [String: Any] = [
            "titulo": titulo,
            "breveDescricao": breveDescricao,
            "autor": autor,
            "descricaoCompleta": descricaoCompleta,
            "contato": contatoCadastro,
            "email": email,
            "dataDeCriacao": dataCriacao,
            "contribuidores": contribuidores,
            "estagioDoProjeto": estagioDoProjeto
        ]
        
        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){(data, response, error) in
            
            guard let data = data else{
                
                if error == nil{
                    
                    print(error?.localizedDescription ?? "Unknown Error")
                }
                return
                
            }
        
            if let response = response as? HTTPURLResponse{
                
                guard (200 ... 299) ~= response.statusCode else{
                    
                    print("Status code :- \(response.statusCode)")
                    print(response)
                    return
                    
                }
                
            }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }catch let error{
                print(error.localizedDescription)
            }
        }.resume()
        
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

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
