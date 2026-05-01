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


protocol Aula{
    var nome: String {get}
    var instrutor: String {get}
    var categoria: String {get}
    var descricao: String {get}
}

class TurmaColetiva: Aula {
    let nome: String
    let instrutor: String
    let categoria: String
    let descricao: String

    let capacidadeMinima: Int
    let capacidadeMaxima: Int

    private(set) var inscritos: [String] = []

    init(nome: String, instrutor: String, categoria: String, descricao: String, min: Int, max: Int) {
        self.nome = nome
        self.instrutor = instrutor
        self.categoria = categoria
        self.descricao = descricao
        self.capacidadeMinima = min
        self.capacidadeMaxima = max
    }

    func inscrever(aluno: String){
        if inscritos.contains(aluno) {
            print("Aluno \(aluno) ja inscrito")
            return
        }

        if inscritos.count >= capacidadeMaxima {
            print("Erro ao adicionar - Capacidade maxima ja atingida")
            return
        }

        inscritos.append(aluno)
        print("Sucesso, \(aluno) esta inscrito na \(nome)")
    }

    func remover(aluno: String) {
        inscritos.removeAll { $0 == aluno }
    }
}

class TreinoPersonal: Aula {
    let nome: String
    let instrutor: String
    let categoria: String
    let descricao: String

    let aluno: String
    let horario: String

    init(nome: String, instrutor: String, categoria: String, descricao: String, aluno: String, horario: String) {
        self.nome = nome
        self.instrutor = instrutor
        self.categoria = categoria
        self.descricao = descricao
        self.aluno = aluno
        self.horario = horario
    }
}

let col1 = TurmaColetiva(nome: "Aula de luta", instrutor: "Ned Stark", categoria: "Luta", descricao: "Aula de luta", min: 1, max: 5)
col1.inscrever(aluno: "Jon")
col1.inscrever(aluno: "Robb")
col1.inscrever(aluno: "Arya")
col1.inscrever(aluno: "Sansa")
col1.inscrever(aluno: "Rickon")
col1.inscrever(aluno: "Jon")
col1.inscrever(aluno: "Theon")