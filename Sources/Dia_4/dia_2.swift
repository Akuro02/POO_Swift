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
    private(set) var id: String
    var estaFuncionando: Bool = true

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
        return estaFuncionando
    }
    
}


protocol Aula{
    var nome: String {get}
    var instrutor: Instrutor {get}
    var categoria: CategoriaAula {get}
    var descricao: String {get}
    var ExpRecomendado: ExpAluno {get}
    var data: String? {get}
}

class TurmaColetiva: Aula {
    let nome: String
    let instrutor: Instrutor
    let categoria: CategoriaAula
    var descricao: String
    var ExpRecomendado: ExpAluno

    let capacidadeMinima: Int
    let capacidadeMaxima: Int

    var data: String? = nil

    private(set) var inscritos: [Aluno] = []

    init(instrutor: Instrutor, categoria: CategoriaAula, min: Int, max: Int, ExpRecomendado: ExpAluno) {
        nome = "Aula de \(categoria.rawValue)"
        self.instrutor = instrutor
        self.categoria = categoria
        capacidadeMinima = min
        capacidadeMaxima = max
        self.ExpRecomendado = ExpRecomendado
        descricao = "Aula de \(categoria.rawValue) com o instrutor \(instrutor.nome)!"
    }

    public func setDescricao(descricao: String){
        self.descricao = descricao
    }

    public func addAluno(aluno: Aluno){

        if(inscritos.count >= capacidadeMaxima){
            print("A turma já atingiu a capacidade máxima!")
            return
        }

        if(inscritos.contains(where: {$0.getID() == aluno.getID()})){
            print("O aluno \(aluno.getNome()) já está inscrito nesta aula!")
            return
        }

        print("Adicionando \(aluno.getNome())")
        if(aluno.nivel != ExpRecomendado){
            print("O Nivel do aluno é diferente do recomendado para esta aula, deseja adiciona-lo mesmo assim? (S/N)")
            let entrada = readLine()
            if let entrada = entrada{
                if(entrada.uppercased() == "N"){
                    print("Aluno não adicionado")
                    return
                }
            }
        }

        inscritos.append(aluno)
        print("Aluno \(aluno.getNome()) adicionado com sucesso!")
    }

    public func removerAluno(aluno: Aluno){
        print("Removendo \(aluno.getNome())")
        if let index = inscritos.firstIndex(where: {$0.getID() == aluno.getID()}){
            inscritos.remove(at: index)
            print("Aluno \(aluno.getNome()) removido com sucesso!")
        } else {
            print("O aluno \(aluno.getNome()) não está inscrito nesta aula!")
        }
    }
}

class TreinoPersonal: Aula {
    let nome: String
    let instrutor: Instrutor
    let categoria: CategoriaAula
    let descricao: String
    let ExpRecomendado: ExpAluno

    let aluno: Aluno
    let data: String?

    init(nome: String, instrutor: Instrutor, categoria: CategoriaAula, descricao: String, ExpRecomendado: ExpAluno, aluno: Aluno, data: String) {
        self.nome = nome
        self.instrutor = instrutor
        self.categoria = categoria
        self.descricao = descricao
        self.ExpRecomendado = ExpRecomendado
        self.aluno = aluno
        self.data = data
    }
}
