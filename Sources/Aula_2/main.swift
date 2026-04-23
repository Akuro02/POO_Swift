import Foundation

//Atividade 1
print("---------------------------ATIVIDADE 1--------------------------------------")

struct Livro{
    let titulo: String
    let autor: String
    let anoPublicacao: Int

    func exibirDetalhes(){
        print("Titulo:", titulo, ", Autor:", autor, ", Ano:", anoPublicacao)
    }
}

let meuLivro = Livro(titulo: "O guia do Mochileiro das Galaxias", autor: "Douglas Adams", anoPublicacao: 1979)
meuLivro.exibirDetalhes()
let meuLivro2 = Livro(titulo: "Duna", autor: "Frank Herbert", anoPublicacao: 1965)
meuLivro2.exibirDetalhes()

// Atividade 2
print("---------------------------ATIVIDADE 2--------------------------------------")

enum EstacaoDoAno{
    case Primavera
    case Verao
    case Outono
    case Inverno
}

class Calendario{
    func getMensagem(estacao: EstacaoDoAno) -> String{
        switch estacao{
            case .Primavera:
                return "Primavera"
            case .Verao:
                return "Verao"
            case .Outono:
                return "Outono"
            case .Inverno:
                return "Inverno"
        }
    }
}

let mensagemVerao: String = Calendario().getMensagem(estacao: .Verao)
print(mensagemVerao)

// Atividade 3
print("---------------------------ATIVIDADE 3--------------------------------------")

class Pedido{
    let id: Int
    let descricao: String
    var status: StatusPedido

    init(id: Int, descricao: String, status: StatusPedido){
        self.id = id
        self.descricao = descricao
        self.status = status
    }

    func atualizarStatus(novoStatus: StatusPedido){
        self.status = novoStatus
         print("Status do pedido \(self.id) atualizado para: \(self.status)")
    }

    func show(){
        print("Status do pedido \(self.id): \(self.status)")
    }
}

enum StatusPedido{
    case Recebido
    case Processando
    case Enviado
    case Entregue
}

let meuPedido = Pedido(id: 101, descricao: "Camiseta", status: .Processando)
meuPedido.atualizarStatus(novoStatus: .Enviado)
let meuPedido2 = Pedido(id: 110, descricao: "Livro", status: .Recebido)
meuPedido2.atualizarStatus(novoStatus: .Processando)
meuPedido.atualizarStatus(novoStatus: .Entregue)
meuPedido2.atualizarStatus(novoStatus: .Enviado)

meuPedido.show()
meuPedido2.show()

