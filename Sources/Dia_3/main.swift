import Foundation


class Academia{

    private var alunosID: [String: Aluno] = [:]
    private var alunosEmail: [String: Aluno] = [:]
    private var instrutoresID: [String: Instrutor] = [:]
    private var maquinas: [String: Aparelho] = [:]
    private var aulas: [Aula] = []

    func adicionarAluno(aluno: Aluno){
        if alunosID[aluno.getID()] != nil || alunosEmail[aluno.email] != nil {
            print("Aluno com ID ou email já existe!")
            return
        }
        alunosID[aluno.getID()] = aluno
        alunosEmail[aluno.email] = aluno
        print("Aluno \(aluno.getNome()) adicionado com sucesso!")
        return
    }

    func adicionarInstrutor(instrutor: Instrutor){
        if instrutoresID[instrutor.getID()] != nil {
            print("Instrutor com ID já existe!")
            return
        }
        instrutoresID[instrutor.getID()] = instrutor
        print("Instrutor \(instrutor.nome) adicionado com sucesso!")
        return
    }

    func adicionarMaquina(maquina: Aparelho){
        if maquinas[maquina.id] != nil {
            print("Máquina com nome já existe!")
            return
        }
        maquinas[maquina.id] = maquina
        print("Máquina \(maquina.nomeMaquina) adicionada com sucesso!")
        return
    }

    func adicionarAula(aula: Aula){
        aulas.append(aula)
        print("Aula \(aula.nome) adicionada com sucesso!")
        return
    }

    func manutencaoMaquina(maquina: Aparelho, data: String) -> Bool {
        if !maquina.realizarManutencao(data: data) {
            print("Manutenção da máquina \(maquina.nomeMaquina) falhou!")
            return false
        }
        print("Manutenção da máquina \(maquina.nomeMaquina) realizada com sucesso!")
        return true
    }

    func manutencaoEmLote(data: String) -> [Aparelho] {
        var falhas: [Aparelho] = []
        for maquina in maquinas.values {
            if !manutencaoMaquina(maquina: maquina, data: data) {
                falhas.append(maquina)
            }
        }
        print("Manutenção em lote realizada com sucesso!")
        print("Numero de máquinas com falha: \(falhas.count)")
        return falhas
    }

    func agendarPersonal(aluno: Aluno, instrutor: Instrutor, data: String) -> TreinoPersonal? {
        
        if(aluno.plano.inclusaoPersonal == false){
            print("O aluno \(aluno.getNome()) não tem direito a personal trainer!")
            return nil
        }

        if(aulas.contains(where: { aula in aula.instrutor.getID() == instrutor.getID() && aula.data == data})){
            print("O instrutor \(instrutor.nome) já tem uma aula agendada!")
            return nil
        }

        let treino = TreinoPersonal(nome: "Treino Personal de \(aluno.getNome())",
                                    instrutor: instrutor, 
                                    categoria: instrutor.especialidade, 
                                    descricao: "Treino personalizado para \(aluno.getNome())", 
                                    ExpRecomendado: aluno.nivel, 
                                    aluno: aluno, 
                                    data: data)

        aulas.append(treino)

        print("Personal agendado para o aluno \(aluno.getNome()) com o instrutor \(instrutor.nome) na data \(data)")
        return treino
    }
}

// =============================== Testes ===============================

let academia = Academia()

// =============================== ALUNO DUPLICADO ===============================
print("=== Teste: Aluno Duplicado ===")
let aluno1 = Aluno(
    nome: "Jon Snow",
    email: "jon@winterfell.com",
    matricula: "123",
    plano: catalogoPlanos.mensal,
    nivel: .Iniciante
)

let alunoDuplicadoEmail = Aluno(
    nome: "Jon 2",
    email: "jon@winterfell.com",
    matricula: "999",
    plano: catalogoPlanos.mensal,
    nivel: .Iniciante
)

academia.adicionarAluno(aluno: aluno1)
academia.adicionarAluno(aluno: alunoDuplicadoEmail) // output: Aluno com ID ou email já existe!
print("")

// =============================== INSTRUTOR DUPLICADO ===============================

print("=== Teste: Instrutor Duplicado ===")

let instrutor1 = Instrutor(
    nome: "Ned Stark",
    email: "ned@winterfell.com",
    especialidade: .Luta
)

academia.adicionarInstrutor(instrutor: instrutor1)
academia.adicionarInstrutor(instrutor: instrutor1) // output: Instrutor com ID já existe!

print("")

// =============================== MAQUINA QUEBRADA ===============================

print("=== Teste: Máquina Quebrada ===")

let maquina1 = Aparelho(nome: "Esteira")
let maquina2 = Aparelho(nome: "Bike")

academia.adicionarMaquina(maquina: maquina1)
academia.adicionarMaquina(maquina: maquina2)

// simular falha manual
maquina2.estaFuncionando = false

let falhas = academia.manutencaoEmLote(data: "01/01/2026")

print("Falhas esperadas: 1 → \(falhas.count)")

print("")


// =============================== ALUNO SEM PERSONAL ===============================

print("=== Teste: Aluno Sem Personal ===")

let alunoSemPersonal = Aluno(
    nome: "Arya",
    email: "arya@winterfell.com",
    matricula: "456",
    plano: catalogoPlanos.mensal,
    nivel: .Intermediario
)

let resultado1 = academia.agendarPersonal(
    aluno: alunoSemPersonal,
    instrutor: instrutor1,
    data: "01/01/2026"
)

print("")

// ================ ALUNO COM PERSONAL ===============================

print("=== Teste: Aluno Com Personal ===")


let alunoComPersonal = Aluno(
    nome: "Robb",
    email: "robb@winterfell.com",
    matricula: "789",
    plano: catalogoPlanos.anual,
    nivel: .Avancado
)

let treino1 = academia.agendarPersonal(
    aluno: alunoComPersonal,
    instrutor: instrutor1,
    data: "01/01/2026"
)

print("")


// ================ CONFLITO DE AGENDAMENTO ===============================

print("=== Teste: Conflito de Agendamento ===")


let treino2 = academia.agendarPersonal(
    aluno: alunoComPersonal,
    instrutor: instrutor1,
    data: "01/01/2026"
)
