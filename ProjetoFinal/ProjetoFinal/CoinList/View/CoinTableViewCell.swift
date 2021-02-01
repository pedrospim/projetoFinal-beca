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
    // arrumar
    var viewModel:CoinTableViewCellModel?
    // MARK: - Inicializacao
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setup(viewModel:CoinTableViewCellModel) {
        self.viewModel = viewModel
        bind()
    }
    func bind() {
        guard let data = viewModel?.viewData.value else { return }
        shortnameCoinLabel.text = data.shortname
        priceLabel.text = data.price
        if data.isFav {
            nameCoinLabel.text = data.name + " ★"
            nameCoinLabel.accessibilityLabel = data.name + " favoritado"
        } else {
            nameCoinLabel.text = data.name
            nameCoinLabel.accessibilityValue = data.name
        }
        if data.idIcon != "" {
            coinImage.carregarImagem(idIcon: data.idIcon)
        } else {
            coinImage.image = UIImage(named: "iconPlaceholder")
        }
        setupAcessibilityCell()
    }
}
