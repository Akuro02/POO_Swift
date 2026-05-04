print("========== INICIALIZAÇÃO ==========")
let academia = Academia()

// =============================== USUÁRIOS ===============================

let aluno1 = Aluno(nome: "Jon", email: "jon@mail.com", matricula: "1", plano: catalogoPlanos.mensal, nivel: .Iniciante)
let aluno2 = Aluno(nome: "Arya", email: "arya@mail.com", matricula: "2", plano: catalogoPlanos.trimestral, nivel: .Intermediario)
let aluno3 = Aluno(nome: "Robb", email: "robb@mail.com", matricula: "3", plano: catalogoPlanos.anual, nivel: .Avancado)

// duplicado (teste)
let alunoDuplicado = Aluno(nome: "Jon Clone", email: "jon@mail.com", matricula: "99", plano: catalogoPlanos.mensal, nivel: .Iniciante)

let instrutor1 = Instrutor(nome: "Ned", email: "ned@mail.com", especialidade: .Luta)
let instrutor2 = Instrutor(nome: "Brienne", email: "brienne@mail.com", especialidade: .Funcional)

// cadastro
academia.adicionarAluno(aluno: aluno1)
academia.adicionarAluno(aluno: aluno2)
academia.adicionarAluno(aluno: aluno3)

// teste duplicidade
academia.adicionarAluno(aluno: alunoDuplicado)

academia.adicionarInstrutor(instrutor: instrutor1)
academia.adicionarInstrutor(instrutor: instrutor2)

// =============================== EQUIPAMENTOS ===============================

let esteira = Aparelho(nome: "Esteira")
let bike = Aparelho(nome: "Bike")

academia.adicionarMaquina(maquina: esteira)
academia.adicionarMaquina(maquina: bike)

// simular falha
bike.estaFuncionando = false

print("\n========== MANUTENÇÃO ==========")
let falhas = academia.manutencaoEmLote(data: "01/01/2026")
print("Máquinas com falha: \(falhas.count)")

// =============================== AULAS ===============================

print("\n========== TURMAS ==========")

let turma = TurmaColetiva(
    instrutor: instrutor1,
    categoria: .Luta,
    min: 1,
    max: 2,
    ExpRecomendado: .Intermediario
)

academia.adicionarAula(aula: turma)

// inscrição
turma.addAluno(aluno: aluno1) // nível menor → pede confirmação
turma.addAluno(aluno: aluno2)
turma.addAluno(aluno: aluno3) // excede capacidade

// =============================== PERSONAL ===============================

print("\n========== PERSONAL ==========")

// aluno sem direito
_ = academia.agendarPersonal(
    aluno: aluno1,
    instrutor: instrutor1,
    data: "02/01/2026"
)

// aluno com direito
let treino = academia.agendarPersonal(
    aluno: aluno3,
    instrutor: instrutor1,
    data: "02/01/2026"
)

// conflito de agenda
_ = academia.agendarPersonal(
    aluno: aluno3,
    instrutor: instrutor1,
    data: "02/01/2026"
)

// =============================== POLIMORFISMO ===============================

print("\n========== POLIMORFISMO ==========")

// coleção 1: usuários
let usuarios: [Usuario] = [aluno1, aluno2, instrutor1, instrutor2]

for u in usuarios {
    u.descricao()
}

// coleção 2: aulas
var aulas: [Aula] = []
aulas.append(turma)
if let treino = treino {
    aulas.append(treino)
}

for aula in aulas {
    print("Aula: \(aula.nome) | Instrutor: \(aula.instrutor.nome)")
}
