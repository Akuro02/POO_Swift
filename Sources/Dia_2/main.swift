import Foundation

protocol Manutencao{
    var nomeMaquina: String {get}
    var historico: [String]{get}

    func realizarManutencao(data: String) -> Bool
    func status() -> Bool
}


class Aparelho: Manutencao{
    let nomeMaquina: String
    private(set) var historico: [String] = []
    private let id: String
    private(set) var estaFuncionando: Bool = true

    init(nome: String){
        id = String(Int.random(in: 100...1000))
        self.nomeMaquina = nome
    }

    func realizarManutencao(data: String) -> Bool {
        guard estaFuncionando else{
            print("A maquina \(nomeMaquina) esta quebrada!")
            return false
        }

        historico.append(data)
        print("Manutencao feita com sucesso")
        return true
    }

    func status() -> Bool{
        return true // TODO
    }
    
}