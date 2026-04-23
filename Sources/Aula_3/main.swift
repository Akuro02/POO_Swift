import Foundation

class Cofre{
    private var saldo: Double

    init(){
        self.saldo = 0
    }


    public func depositar(quantia: Double){
        if (quantia <= 0) {
            print("Erro ao depositar - Quantia <= 0")
            return
        }

        self.saldo += quantia
    }

    public func sacar(quantia: Double){
        if(quantia > self.saldo) {
            print("Erro ao sacar - Quantia > saldo")
            return
        }

        self.saldo -= quantia
    }

    public func getSaldo() -> Double{
        return self.saldo
    }
}

print("Criando um cofre válido:")
let meuCofre = Cofre()
print("Saldo inicial: \(meuCofre.getSaldo())")
meuCofre.depositar(quantia: 100.0)
print("Saldo apos saque: \(meuCofre.getSaldo())")
meuCofre.depositar(quantia: -100.0)
meuCofre.sacar(quantia: 200.0)