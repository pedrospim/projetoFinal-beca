//
//  FavoritosViewController.swift
//  detalhesBit
//
//  Created by Mathias Almeida Nonohay on 1/22/21.
//

import UIKit

public class FavoritosViewController: UIViewController {

    @IBOutlet weak var collectionViewFavoritos: UICollectionView!
    
    private let celulaFavoritosIdentifier = "celulaFavoritos"
    private var arrStrin: Array<Any> = []
    
    // MARK: - Atributos
    private var valor: String!
    private var nome: String!
    private var valorHora: String!
    private var valorMes: String!
    private var valorAno: String!
    private var favorito: Bool!
    private var numCelula: Int!

    // MARK: - Contructor
    
    // Favoritos precisam pegar umas lista de coins para listar corretamente
    // No momento só pega um e lista X vezes aquele coin
    public init(_ valor: String, _ nome: String, _ valorHora: String, _ valorMes: String, _ valorAno: String, _ favorito: Bool, _ numCelula: Int) {
        self.valor = valor
        self.nome = nome
        self.valorHora = valorHora
        self.valorMes = valorMes
        self.valorAno = valorAno
        self.favorito = favorito
        self.numCelula = numCelula
        super.init(nibName: "FavoritosViewController", bundle: Bundle(for: FavoritosViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        return self.numCelula
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: celulaFavoritosIdentifier, for: indexPath) as!
            FavoritosCollectionViewCell
        guard let nome = self.nome else { return celula }
        guard let valor = self.valor else { return celula }
        celula.nomeBit.text = nome
        celula.idBit.text = nome
        
        celula.valorBit.text = valor
//        celula.imageBit.image = self.imageBit
        
        return celula
    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let str = arrStrin[indexPath.row]
        let controller = DetalhesBitCoinViewController(self.valor, self.nome, self.valorHora, self.valorMes, self.valorAno, self.favorito, self.numCelula)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
