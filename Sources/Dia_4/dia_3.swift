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
