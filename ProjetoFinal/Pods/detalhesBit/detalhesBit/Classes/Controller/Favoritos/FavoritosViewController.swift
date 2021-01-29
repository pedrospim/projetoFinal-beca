//
//  FavoritosViewController.swift
//  detalhesBit
//
//  Created by Mathias Almeida Nonohay on 1/22/21.
//

import UIKit
import Commons

public class FavoritosViewController: UIViewController {

    @IBOutlet weak var collectionViewFavoritos: UICollectionView!
    
    private let celulaFavoritosIdentifier = "celulaFavoritos"
    private var arrStrin: Array<Any> = []
    
    // MARK: - Atributos
    private var listFavorites:[String:[String:String]] = [:]
    // MARK: - Contructor
    
    // Favoritos precisam pegar umas lista de coins para listar corretamente
    // No momento só pega um e lista X vezes aquele coin
    public init() {
        super.init(nibName: "FavoritosViewController", bundle: Bundle(for: FavoritosViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func viewDidAppear(_ animated: Bool) {
        listFavorites = sharedFavorites.getFavorites()
        collectionViewFavoritos.reloadData()
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        collectionViewFavoritos.dataSource = self
        collectionViewFavoritos.delegate = self
        let nibCelula = UINib(nibName: "FavoritosCollectionViewCell", bundle: Bundle(for: FavoritosViewController.self))
        collectionViewFavoritos.register(nibCelula, forCellWithReuseIdentifier: celulaFavoritosIdentifier)
        collectionViewFavoritos.reloadData()
    }
}

extension FavoritosViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listFavorites.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: celulaFavoritosIdentifier, for: indexPath) as!
            FavoritosCollectionViewCell
        
        let idCoin = Array(listFavorites.keys.sorted())[indexPath.row]
        let dictCoin = listFavorites[idCoin]
        
        celula.nomeBit.text = dictCoin?["name"]
        celula.idBit.text = idCoin
        
        celula.valorBit.text = dictCoin?["price"]
        celula.imageBit.carregarImagem(idIcon: dictCoin?["idIcon"] ?? "")
        
        return celula
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let idCoin = Array(listFavorites.keys.sorted())[indexPath.row]
        guard let dictCoin = listFavorites[idCoin] else { return }
        
        guard let price = dictCoin["price"] else { return }
        guard let name = dictCoin["name"] else { return }
        guard let valorHora = dictCoin["valueHour"] else { return }
        guard let valorDia = dictCoin["valueDay"] else { return }
        guard let valorMes = dictCoin["valueMonth"] else { return }
        guard let idIcon = dictCoin["idIcon"] else { return }
        
        let controller = DetalhesBitCoinViewController(idCoin, price, name, valorHora, valorMes, valorDia, idIcon, true)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
