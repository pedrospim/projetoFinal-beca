//
//  MoedaTableViewCell.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 21/01/21.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var nameCoinLabel: UILabel!
    @IBOutlet weak var shortnameCoinLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - Variables
    var viewModel:CoinTableViewCellModel? = nil
    // MARK: - Inicializacao
    override func awakeFromNib() {
        super.awakeFromNib()
        bind()
        setup()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func bind(){
        viewModel?.viewData.bind({ (response) in
            guard let `response` = response else { return }
            self.nameCoinLabel.text = response.name
            self.shortnameCoinLabel.text = response.shortname
            self.priceLabel.text = response.price
        })
    }
    func setup() {
        coinImage.layer.cornerRadius = 25 
        coinImage.layer.masksToBounds = true
    }
}
