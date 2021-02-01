//
//  DetalhesBitCoinViewController.swift
//  detalhesBit
//
//  Created by Mathias Almeida Nonohay on 1/21/21.
//

import UIKit
import Commons

public class DetalhesBitCoinViewController: UIViewController {
    
    @IBOutlet weak var labelCoinValor: UILabel!
    @IBOutlet weak var labelCoinNome: UILabel!
    @IBOutlet weak var labelValorHor: UILabel!
    @IBOutlet weak var labelValorMes: UILabel!
    @IBOutlet weak var labelValorAno: UILabel!
    @IBOutlet weak var botaoAddRem: UIButton!
    @IBOutlet weak var favImage: UILabel!
    @IBOutlet weak var labelEstrela: UILabel!
    @IBOutlet weak var imageBit: UIImageView!
    
    // MARK: - Atributos
    private var valor: String!
    private var nome: String!
    private var shortname: String!
    private var valorHora: String!
    private var valorMes: String!
    private var valorAno: String!
    private var favorito: Bool!
    private var idIcon: String!
    // MARK: - Contructor
    public init(_ shortname: String, _ valor: String, _ nome: String, _ valorHora: String, _ valorMes: String, _ valorAno: String, _ idIcon:String, _ favorito: Bool) {
        self.valor = valor
        self.nome = nome
        self.valorHora = valorHora
        self.valorMes = valorMes
        self.valorAno = valorAno
        self.favorito = favorito
        self.shortname = shortname
        self.idIcon = idIcon
        
        super.init(nibName: "DetalhesBitCoinViewController", bundle: Bundle(for: DetalhesBitCoinViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    public override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        setupNavigationBar()
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        coinDetalhes(self.shortname, self.valor, self.nome, self.valorHora, self.valorMes, self.valorAno, self.idIcon, self.favorito)
    }
    private func setupNavigationBar(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 139/255, green: 152/255, blue: 91/255, alpha: 1)
    }
    private func coinDetalhes(_ shortname:String, _ valor: String, _ nome: String, _ valorHora: String, _ valorMes: String, _ valorAno: String, _ idIcon:String, _ favorito: Bool) {
        labelCoinValor.text = "\(valor)"
        labelCoinNome.text = nome
//        self.navigationController?.navigationBar.topItem?.title = shortname
        labelValorHor.text = "\(valorHora)"
        labelValorMes.text = "\(valorMes)"
        labelValorAno.text = "\(valorAno)"
        imageBit.carregarImagem(idIcon: self.idIcon)
        botaoAddRem.backgroundColor = .clear
        botaoAddRem.layer.cornerRadius = 10
        botaoAddRem.layer.borderWidth = 1
        botaoAddRem.layer.borderColor = UIColor.white.cgColor
        if favorito == true {
            botaoAddRem.setTitle("REMOVER", for: .normal)
            labelEstrela.text = "★"
            
        } else {
            botaoAddRem.setTitle("ADICIONAR", for: .normal)
            labelEstrela.text = ""
        }
    }
    @IBAction func botaoFavorito(_ sender: UIButton) {
        sharedFavorites.toggleFavorite(shortname: self.shortname, name: self.nome, price: self.valor, idIcon: self.idIcon, valueHour: self.valorHora, valueDay: self.valorAno, valueMonth: self.valorMes)
        
        if self.favorito == true{
            
            self.favorito = false
        } else {
            self.favorito = true
        }
        
        coinDetalhes(self.shortname, self.valor, self.nome, self.valorHora, self.valorMes, self.valorAno, self.idIcon, self.favorito)
    }
}
