//
//  ContribuicaoViewController.swift
//  ProjectHub
//
//  Created by Student on 30/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class ContribuicaoViewController: UIViewController {

    @IBOutlet weak var ContribuicaoCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ContribuicaoCollection.dataSource = self
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



extension ContribuicaoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "competenciaCell1", for: indexPath) as! ContribuirCollectionViewCell

        cell.setup(with: contribuicoes[indexPath.row])
        return cell
    }
}
