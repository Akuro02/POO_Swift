import Foundation

// Atividade 1
print("---------------------------ATIVIDADE 1--------------------------------------")
func calcProb(numArray: [Int]){
    var aboveZero: [Int] = []
    var belowZero: [Int] = []
    var zero: [Int] = []

    for i in numArray{
        switch i{
            case let x where x > 0:
                aboveZero.append(x)
            case let x where x == 0:
                zero.append(x)
            case let x where x < 0:
                belowZero.append(x)
            default:
                break
        }
    }

    print("Processo:")
    print("Positivos: ", aboveZero.count, "(", aboveZero, ")", "->", aboveZero.count, "/", numArray.count, "=", String(format: "%.6f", (Float)(aboveZero.count) / (Float)(numArray.count)))
    print("Zeros: ", zero.count, "(", zero, ")", "->", zero.count, "/", numArray.count, "=", String(format: "%.6f", (Float)(zero.count) / (Float)(numArray.count)))
    print("Negativos: ", belowZero.count, "(", belowZero, ")", "->", belowZero.count, "/", numArray.count, "=", String(format: "%.6f", (Float)(belowZero.count) / (Float)(numArray.count)))
}


var arr: [Int] = [-4,  3,  -9 , 0 , 4 , 1 ]
calcProb(numArray: arr)


print("---------------------------ATIVIDADE 2--------------------------------------")
// Atividade 2
func obterDetalhesVoo() -> (codigo: String, destino: String, pontual: Bool){
    let tuplaRetorno = (codigo: "G3-1405", destino: "Rio de Janeiro", pontual: true)
    return tuplaRetorno
}

let detalhesDoVoo = obterDetalhesVoo()
print("O voo", detalhesDoVoo.codigo, "para", detalhesDoVoo.destino, "está com o status pontual:", detalhesDoVoo.pontual)



print("---------------------------ATIVIDADE 3--------------------------------------")
// Atividade 3
func calcularVendasDoDia() -> (produtosVendidos: Int, valorTotal: Double, clientesDestaque: String){
    let tuplaRetorno = (produtosVendidos: 235, valorTotal: 4750.80, clientesDestaque: "Supermercado ABC")
    return tuplaRetorno
}

var relatorioDeHoje = calcularVendasDoDia()
print("--- Relatório de Vendas ---")
print("Produtos vendidos:", relatorioDeHoje.produtosVendidos)
print("Valor Total:", relatorioDeHoje.valorTotal)
print("Cliente Destaque do Dia:", relatorioDeHoje.clientesDestaque)