import Foundation

enum ExpAluno{
    case Iniciante 
    case Intermediario 
    case Avancado
}

enum CategoriaAula : String{
    case Yoga = "Yoga"
    case Musculacao = "Musculação"
    case Luta = "Luta"
    case Funcional = "Funcional"
    case Spinning = "Spinning"
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

class Usuario{
    let nome: String
    let id: String
    let email: String

    init(nome: String, email: String){
        self.nome = nome
        self.email = email
        id = String(Int.random(in: 100...1000))
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
        super.init(nome: nome, email: email)
        
    }

    func alterarPlano(novoPlano: planosAcademia){
        self.plano = novoPlano
    }

    func alterarNivel(novoNivel: ExpAluno){
        self.nivel = novoNivel
    }

    override func descricao() {
        print("Este e o aluno \(nome), com email \(email)! e com matricula \(matricula) - Seu plano e o \(plano.nome) e seu nivel e \(nivel)")
    }
}

class Instrutor: Usuario{
    let especialidade: CategoriaAula

    init(nome: String, email: String, especialidade: CategoriaAula){
        self.especialidade = especialidade
        super.init(nome: nome, email: nome)
    }

    override func descricao(){
        print("Este e o instrutor \(nome), com email \(email)! ele e especializado em \(especialidade)")
    }
}


// Planos academia
let anual = planosAcademia(nome: "Anual", 
                            valorMensalidade: 100.0, 
                            inclusaoPersonal: true, 
                            limiteDeAulasColetivas: 3, 
                            duracao: 12)

let mensal = planosAcademia(nome: "Mensal", 
                            valorMensalidade: 150.0, 
                            inclusaoPersonal: false, 
                            limiteDeAulasColetivas: 1, 
                            duracao: 1)

let trimestral = planosAcademia(nome: "Trimestral", 
                            valorMensalidade: 130.0, 
                            inclusaoPersonal: true, 
                            limiteDeAulasColetivas: 2, 
                            duracao: 3)

// Cadastro de individuos 
var Aluno1 = Aluno(nome: "Jon", email: "JonSnow@email.com", matricula: "123", plano: anual, nivel: .Avancado)

var Instrutor1 = Instrutor(nome: "Ned", email: "NedStark@email.com", especialidade: .Luta)

Aluno1.descricao()
print() 
Aluno1.alterarPlano(novoPlano: mensal)
print() 
Aluno1.descricao()
print()
Instrutor1.descricao()