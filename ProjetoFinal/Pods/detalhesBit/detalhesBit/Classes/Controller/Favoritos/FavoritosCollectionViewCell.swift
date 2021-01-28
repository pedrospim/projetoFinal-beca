//
//  FavoritosCollectionViewCell.swift
//  detalhesBit
//
//  Created by Mathias Almeida Nonohay on 1/26/21.
//

import UIKit

class FavoritosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nomeBit: UILabel!
    @IBOutlet weak var imageBit: UIImageView!
    @IBOutlet weak var idBit: UILabel!
    @IBOutlet weak var valorBit: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        celulaLayout()
    }
    
    func celulaLayout() {
        self.layer.cornerRadius = 10
    }

}
