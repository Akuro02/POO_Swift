import Foundation

public enum ExpAluno : String{
    case Iniciante  = "Iniciante"
    case Intermediario = "Intermediario"
    case Avancado = "Avancado"
}

public enum CategoriaAula : String{
    case Yoga = "Yoga"
    case Musculacao = "Musculação"
    case Luta = "Luta"
    case Funcional = "Funcional"
    case Spinning = "Spinning"
}

enum Funcoes : String{
    case Aluno = "Aluno"
    case Instrutor = "Instrutor"
}

struct planosAcademia{
    let nome: String
    let valorMensalidade: Double
    let inclusaoPersonal: Bool
    let limiteDeAulasColetivas: Int
    let duracao: Int

    init(nome: String, valorMensalidade: Double, inclusaoPersonal: Bool, limiteDeAulasColetivas: Int, duracao: Int){
        self.nome = nome
        self.valorMensalidade = valorMensalidade
        self.inclusaoPersonal = inclusaoPersonal
        self.limiteDeAulasColetivas = limiteDeAulasColetivas
        self.duracao = duracao
    }
}

public class Usuario{
    let nome: String
    let id: String
    let email: String
    let funcao: Funcoes

    init(nome: String, email: String, funcao: Funcoes){
        self.nome = nome
        self.email = email
        id = String(Int.random(in: 100...1000))
        self.funcao = funcao
    }

    func descricao(){
        print("Este e o aluno \(nome), com email \(email)!")
    }
}

class Aluno: Usuario{
    let matricula: String
    var plano: planosAcademia
    var nivel: ExpAluno

    init(nome: String, email: String, matricula: String, plano: planosAcademia, nivel: ExpAluno){
        self.matricula = matricula
        self.plano = plano
        self.nivel = nivel
        super.init(nome: nome, email: email, funcao: .Aluno)
        
    }

    func alterarPlano(novoPlano: planosAcademia){
        self.plano = novoPlano
    }

    func alterarNivel(novoNivel: ExpAluno){
        self.nivel = novoNivel
    }

    func getNome() -> String{
        return nome
    }

    func getID() -> String{
        return id
    }

    override func descricao() {
        print("Este e o aluno \(nome), com email \(email)! e com matricula \(matricula) - Seu plano e o \(plano.nome) e seu nivel e \(nivel)")
    }
}

class Instrutor: Usuario{
    let especialidade: CategoriaAula

    init(nome: String, email: String, especialidade: CategoriaAula){
        self.especialidade = especialidade
        super.init(nome: nome, email: email, funcao: .Instrutor)
    }

    override func descricao(){
        print("Este e o instrutor \(nome), com email \(email)! ele e especializado em \(especialidade)")
    }
}

// Planos de academia - Inicializacao na memoria
struct catalogoPlanos{
    static let anual = planosAcademia(nome: "Anual", 
                            valorMensalidade: 100.0, 
                            inclusaoPersonal: true, 
                            limiteDeAulasColetivas: 3, 
                            duracao: 12)

    static let mensal = planosAcademia(nome: "Mensal", 
                            valorMensalidade: 150.0, 
                            inclusaoPersonal: false, 
                            limiteDeAulasColetivas: 1, 
                            duracao: 1)

    static let trimestral = planosAcademia(nome: "Trimestral", 
                            valorMensalidade: 130.0, 
                            inclusaoPersonal: true, 
                            limiteDeAulasColetivas: 2, 
                            duracao: 3)

}