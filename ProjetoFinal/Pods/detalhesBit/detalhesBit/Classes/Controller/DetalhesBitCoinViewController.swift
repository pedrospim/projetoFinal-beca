//
//  DetalhesBitCoinViewController.swift
//  detalhesBit
//
//  Created by Mathias Almeida Nonohay on 1/21/21.
//

import UIKit

public class DetalhesBitCoinViewController: UIViewController {
    
    @IBOutlet weak var labelCoinValor: UILabel!
    @IBOutlet weak var labelCoinNome: UILabel!
    @IBOutlet weak var labelValorHor: UILabel!
    @IBOutlet weak var labelValorMes: UILabel!
    @IBOutlet weak var labelValorAno: UILabel!
    @IBOutlet weak var botaoAddRem: UIButton!
    @IBOutlet weak var favImage: UILabel!
    @IBOutlet weak var labelEstrela: UILabel!
    
    // MARK: - Atributos
    private var valor: String!
    private var nome: String!
    private var valorHora: String!
    private var valorMes: String!
    private var valorAno: String!
    private var favorito: Bool!
    private var numCelula: Int!

    // MARK: - Contructor
    
    // Detalhe pode pegar só os valores sem problemas
    public init(_ valor: String, _ nome: String, _ valorHora: String, _ valorMes: String, _ valorAno: String, _ favorito: Bool, _ numCelula: Int) {
        self.valor = valor
        self.nome = nome
        self.valorHora = valorHora
        self.valorMes = valorMes
        self.valorAno = valorAno
        self.favorito = favorito
        self.numCelula = numCelula
        
        super.init(nibName: "DetalhesBitCoinViewController", bundle: Bundle(for: DetalhesBitCoinViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        coinDetalhes(self.valor, self.nome, self.valorHora, self.valorMes, self.valorAno, self.favorito)
    }
    
    private func coinDetalhes(_ valor: String, _ nome: String, _ valorHora: String, _ valorMes: String, _ valorAno: String, _ favorito: Bool) {
        labelCoinValor.text = "$ \(valor)"
        labelCoinNome.text = nome
        labelValorHor.text = "$ \(valorHora)"
        labelValorMes.text = "$ \(valorMes)"
        labelValorAno.text = "$ \(valorAno)"
        if favorito == true {
            botaoAddRem.setTitle("REMOVER", for: .normal)
            labelEstrela.text = "("
            
        } else {
            botaoAddRem.setTitle("ADICIONAR", for: .normal)
            labelEstrela.text = ""
        }
    }
    @IBAction func botaoFavorito(_ sender: UIButton) {
        if self.favorito == true{
            self.favorito = false
        } else {
            self.favorito = true
        }
        coinDetalhes(self.valor, self.nome, self.valorHora, self.valorMes, self.valorAno, self.favorito)
    }
}