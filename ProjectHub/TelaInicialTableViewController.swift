//
//  TelaInicialTableViewController.swift
//  ProjectHub
//
//  Created by Student on 25/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class TelaInicialTableViewController: UITableViewController {
    
    var destaques = [DestaquesAPI]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadJSON {
                   self.tableView.reloadData()
                   print("sucess")
               }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return destaques.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "destaques", for: indexPath)

        if let destaquesCell = cell as? TelaInicialTableViewCell {
            let destaqueArray = destaques[indexPath.row]
            destaquesCell.tituloDestaque.text = destaqueArray.titulo
            destaquesCell.breveDescricaoDestaque.text = destaqueArray.breveDescricao
            destaquesCell.autorDestaque.text = destaqueArray.autor
            
            return destaquesCell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "descricaoSegue"{
                   if let novaView = segue.destination as? DescricaoViewController {
                       let celulaSelecionada = tableView.indexPathForSelectedRow?.row
                       let destaqueDaCelula = destaques[celulaSelecionada!]
                       novaView.destaqueaux = destaqueDaCelula
                   }
               }
        
    }
    
    func downloadJSON(completed: @escaping () -> ()){
        
        let url = URL(string: "https://noderedaluno01202202.kgsx7kocpw2.us-south.codeengine.appdomain.cloud/lerPostDestaque")
        
        URLSession.shared.dataTask(with: url!) { data, response, err in
            
            if err == nil {
                
                do{
                    
                    self.destaques = try JSONDecoder().decode([DestaquesAPI].self, from: data!)
                    
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
