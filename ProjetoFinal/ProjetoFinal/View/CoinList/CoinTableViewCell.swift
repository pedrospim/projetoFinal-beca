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
    //arrumar
    var viewModel = CoinTableViewCellModel()
    // MARK: - Inicializacao
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setup(coin:CoinViewData) {
        viewModel.loadInfo(coin: coin)
        bind()
    }
    func bind() {
            print("a")
            guard let response = viewModel.viewData.value else { return }
            shortnameCoinLabel.text = response.shortname
            priceLabel.text = response.price
            if response.isFav {
                nameCoinLabel.text = response.name + " ★"
            } else {
                nameCoinLabel.text = response.name
            }
        if response.idIcon != ""{
            coinImage.carregarImagem(idIcon: response.idIcon)
            } else {
                coinImage.image = UIImage(named: "iconPlaceholder")
            }
    }
}
