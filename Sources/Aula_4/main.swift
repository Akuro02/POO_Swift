import Foundation

class User{
    let nome: String
    private let cpf: Int


    init(nome: String, cpf: Int){
        self.nome = nome
        self.cpf = cpf
    } 

    public func getCPF() -> Int{
        return cpf
    }
}


class Conta: User{
    private var saldo: Double
    private var score: ScoreCategory
    private var email: String
    private var limite: Double
    private var tipoConta: tipoConta
    private var senha: String

    init(nome: String, cpf: Int, email: String, tipoConta: tipoConta, senha: String){
        self.email = email
        self.senha = senha
        self.tipoConta = tipoConta
        saldo = 0.0
        score = .baixo
        limite = 0

        super.init(nome: nome, cpf: cpf)
    }

    public func getScore() -> ScoreCategory{
        return score
    }

    public func getEmail() -> String{
        return email
    }

    private func setEmail(email: String){
        self.email = email
    }

    public func setEmailSenha(senha: String, novoEmail: String){
        if(self.senha == senha){
            setEmail(email: novoEmail)
        }
    }


    public func setSenha(senhaAntiga: String, senhaNova: String){
        if senhaAntiga == self.senha{
            senha = senhaNova
        }
    }


    public func aumentarLimite(score: ScoreCategory){
        switch score{
            case .baixo:
                limite = 600
            case .medio:
                limite = 1200
            case .alto:
                limite = 2000
        }
    }

}


enum ScoreCategory{
    case baixo
    case medio
    case alto
}

enum tipoConta{
    case corrente
    case poupanca
}




var minhaConta = Conta(nome: "Matt", cpf: 123456789, email: "NelsonAndMurdock@marvelmail.com", tipoConta: .poupanca, senha: "1965")