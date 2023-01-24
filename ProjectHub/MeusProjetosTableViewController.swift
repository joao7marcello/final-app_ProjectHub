//
//  MeusProjetosTableViewController.swift
//  ProjectHub
//
//  Created by Student on 30/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class MeusProjetosTableViewController: UITableViewController {
     lazy var faButton: UIButton = {
            let button = UIButton(frame: .zero)
            button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.setPreferredSymbolConfiguration(.init(pointSize: 60), forImageIn: .normal)
        
            button.addTarget(self, action: #selector(fabTapped(_:)), for: .touchUpInside)
            return button
        }()
    
    var meusProjetos = [DestaquesAPI]()

        override func viewDidLoad() {
            super.viewDidLoad()
            downloadJSON {
                self.tableView.reloadData()
                print("success")
            }
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if let view = UIApplication.shared.keyWindow {
                view.addSubview(faButton)
                setupButton()
            }
            
        
    }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            if let view = UIApplication.shared.keyWindow, faButton.isDescendant(of: view) {
                faButton.removeFromSuperview()
            }
            
        }


        func setupButton() {
            NSLayoutConstraint.activate([
                faButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                faButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -56),
                faButton.heightAnchor.constraint(equalToConstant: 80),
                faButton.widthAnchor.constraint(equalToConstant: 80)
                ])
            faButton.layer.cornerRadius = 40
            faButton.layer.masksToBounds = true
            //faButton.layer.borderColor = UIColor.white.cgColor
            //faButton.layer.borderWidth = 1
        }
        @objc func pushGameViewController() {
            let destinationVC = storyboard?.instantiateViewController(withIdentifier: "CadastroProjeto") as! CadastroProjetoViewController
    //trocar esse identifier e nome da view
            navigationController?.pushViewController(destinationVC, animated: true)
        }

        @objc func fabTapped(_ button: UIButton) {
            print("button tapped")
            pushGameViewController()
            
        }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meusProjetos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projetos", for: indexPath)

          if let projetosCell = cell as? MeusProjetosTableViewCell {
                   let projetoArray = meusProjetos[indexPath.row]
                   projetosCell.meuTitulo.text = projetoArray.titulo
                   projetosCell.meuDescricao.text = projetoArray.breveDescricao
            projetosCell.meuDataDescricao.text = projetoArray.dataDeCriacao
                   
                   return projetosCell
               }

               return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           if segue.identifier == "descricaoSegue2"{
                      if let novaView = segue.destination as? DescricaoViewController {
                          let celulaSelecionada = tableView.indexPathForSelectedRow?.row
                          let destaqueDaCelula = meusProjetos[celulaSelecionada!]
                          novaView.destaqueaux = destaqueDaCelula
                      }
                  }
           
       }
    
    
    
    func downloadJSON(completed: @escaping () -> ()){
        
        let url = URL(string: "https://noderedaluno01202202.kgsx7kocpw2.us-south.codeengine.appdomain.cloud/lerPostMeusProjetos")
        
        URLSession.shared.dataTask(with: url!) { data, response, err in
            
            if err == nil {
                
                do{
                    
                    self.meusProjetos = try JSONDecoder().decode([DestaquesAPI].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                }
                
                catch {
                    
                    print("error fetching data from api")
                    
                }
                
            }
            
        }.resume()
        
    }

}
