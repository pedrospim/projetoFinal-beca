//
//  Bindable.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 22/01/21.
// swiftlint:disable identifier_name

import Foundation

public class Bindable<T> {
    typealias Listener = (T) -> Void
    // MARK: - Properties
    var listeners: [Listener] = []
    
    // MARK: - Constructors
    init(_ v: T) {
        self.value = v
    }
    // MARK: - Bind
    func bind(_ listerner: @escaping Listener) {
        self.listeners.append(listerner)
    }
    var value: T {
        didSet {
            listeners.forEach { $0(value) }
        }
    }
}
