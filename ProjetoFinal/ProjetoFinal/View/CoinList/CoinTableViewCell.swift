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
    var viewModel:CoinTableViewCellModel = CoinTableViewCellModel()
    // MARK: - Inicializacao
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setup(coin:CoinViewData) {
        bind()
        viewModel.loadInfo(coin: coin)
        config()
    }
    func bind() {
        viewModel.viewData.bind({ (response) in
            guard let `response` = response else { return }
            self.shortnameCoinLabel.text = response.shortname
            self.priceLabel.text = response.price
            if response.isFav {
                self.nameCoinLabel.text = response.name + " ★"
            } else {
                self.nameCoinLabel.text = response.name
            }
            self.coinImage.carregarImagem(url: response.linkImage)
        })
    }
    func config() {
        coinImage.layer.cornerRadius = 25 
        coinImage.layer.masksToBounds = true
    }
}
