import Foundation

class Pessoa{
    fileprivate var nome: String
    fileprivate var email: String
    fileprivate var telefone: String
    fileprivate var endereco: String
    fileprivate let cpf: String
    //fileprivate let dataDeNascimento: Date
    fileprivate let sexo: String
    
    init(nome: String, email: String, telefone: String, endereco: String, cpf: String, sexo: String) {
        self.nome = nome
        self.email = email
        self.telefone = telefone
        self.endereco = endereco
        self.cpf = cpf
//        self.dataDeNascimento = dataDeNascimento
        self.sexo = sexo
    }
    
    public func getDescricao() -> String{
        return "nome = \(nome)\nemail = \(email)\ntelefone = \(telefone)\ncpf = \(cpf)\nendereço = \(endereco)\nsexo = \(sexo)"
    }
}

enum NivelAluno{
    case iniciante
    case intermediario
    case avancado
}

enum CategoriasAulas{
    case musculacao
    case spinning
    case yoga
    case funcional
    case luta
}

enum Objetivo{
    case perderBeso
    case ganharMassa
    case altaPerformance
    case poliesportivo
}

class Aluno: Pessoa{
    private var matricula: Int
    private var nivel: NivelAluno
    private(set) var plano: Plano
    private var biometria: String
    private var objetivo: Objetivo
    private var peso: Float
    private var altura: Float
    
    init(plano: Plano, biometria: String, objetivo: Objetivo, peso: Float, altura: Float, nome: String, email: String, telefone: String, cpf: String, endereco: String, nivel: NivelAluno, sexo: String) {
        self.plano = plano
        self.biometria = biometria
        self.objetivo = objetivo
        self.peso = peso
        self.altura = altura
        self.nivel = nivel
        self.matricula = Int.random(in: 1000...4000)
        super.init(nome: nome, email: email, telefone: telefone, endereco: endereco,cpf: cpf,sexo: sexo)
    }
    
    public func trocarPlano(novoPlano: Plano){
        self.plano = novoPlano
    }
    
    public func trocarNivelAluno(novoNivelAluno: NivelAluno){
        self.nivel = novoNivelAluno
    }
    
    public func getMatricula() -> Int{
        return matricula
    }
 
    public func pagamento() -> String{
        return "O aluno \(self.nome) realizou o pagamento com sucesso"
    }
    
    override func getDescricao() -> String{
        return super.getDescricao() + "\nplano = \(plano)\nbiometria\(biometria)\nobjetivo = \(objetivo)\npeso = \(peso)\naltura = \(altura)\nmatricula = \(matricula)"
    }
}

class Instrutor: Pessoa{
    private var especialidade: String
    private var formcacao: String
    
    
    init(especialidade: String, formcacao: String, nome: String, email: String, telefone: String, cpf: String, endereco: String, sexo: String) {
        self.especialidade = especialidade
        self.formcacao = formcacao
        super.init(nome: nome, email: email, telefone: telefone, endereco: endereco,cpf: cpf,  sexo: sexo)
    }
    
    override func getDescricao() -> String{
        return super.getDescricao() + "\nespecialidade = \(especialidade)\nformação = \(formcacao)"
    }
}

enum Catalago{
    case mensal
    case trimestral
    case anual
}


class Plano{
    let nome: String
    var valorMensalidade: Double
    let incluiPersonal: Bool
    var limiteAulas: Int
    var duracaoPlano: Catalago
    var valorTotal: Double
    
    
    init(nome: String, valorMensalidade: Double, incluiPersonal: Bool, limiteAulas: Int, duracaoPlano: Catalago) {
        self.nome = nome
        self.valorMensalidade = valorMensalidade
        self.incluiPersonal = incluiPersonal
        self.limiteAulas = limiteAulas
        self.duracaoPlano = duracaoPlano
        self.valorTotal = 0.0
    }
    
    public func calcularPrecoPlano(duracaoPlano: Catalago,valorMensalidade: Double) -> Double{
        switch duracaoPlano{
        case .mensal:
            self.valorTotal = valorMensalidade
            return valorTotal
        case .trimestral:
            self.valorTotal = valorMensalidade * 3
            return valorTotal
        case .anual:
            self.valorTotal = (valorMensalidade * 12) * 0.8
            return valorTotal
        }
    }
}


protocol Manutencao{
    var nomeItem: String {get set}
    var historico: [String] {get set}
    var dataUltimManutencao: String {get}
    
    func realizarManutencao() -> Bool
}


class Aparelho: Manutencao{
    public var nomeItem: String
    private(set) var dataUltimManutencao: String
    var historico: [String]
    
    init(nomeItem: String){
        self.nomeItem = nomeItem
        dataUltimManutencao = ""
        historico = []
    }
    
    func realizarManutencao() -> Bool {
        print("Realizando manutenção...")
        let manutencaoRealizada = Bool.random()
        if manutencaoRealizada == true{
            print("Manutenção realizada com sucesso")
            dataUltimManutencao = "12/06/2026"
            historico.append("Manutenção feita")
            return true
        }
        print("Manutenção sem sucesso")
        historico.append("Manutenção não realizada")
        return false
    }
    
//    public func getHistorico() -> [String]{
//        return historico
//    }
}



protocol Aula{
    var nome: String { get set }
    var instrutor: Instrutor { get set }
    var categoria: CategoriasAulas { get set }
    var descricao: String { get set }
}


class turmasColetivas: Aula{
    var nome: String
    var instrutor: Instrutor
    var categoria: CategoriasAulas
    private var inscritos: [Aluno] = []
    private var matriculasInscritas: Set<Int> = []
    var descricao: String
    var capacidade: Int
    
    init(nome: String, categoria: CategoriasAulas, descricao: String, instrutor: Instrutor, capacidade: Int) {
        self.nome = nome
        self.categoria = categoria
        self.descricao = descricao
        self.instrutor = instrutor
        self.capacidade = capacidade
    }
    
    
    public func inscreverAluno(aluno: Aluno) -> String {
        if matriculasInscritas.contains(aluno.getMatricula()) {
            return "Aluno já está inscrito."
        }

        if inscritos.count >= capacidade {
            return "Turma lotada."
        }

        inscritos.append(aluno)
        matriculasInscritas.insert(aluno.getMatricula())
        return "Aluno inscrito com sucesso."
    }
    
    public func comcecarAula() -> String{
        if inscritos.count < (capacidade * 30) / 100{
            return "Não foi possível começar a aula pois não há alunos o suficiente"
        }
        
        return "Começando a aula de \(nome), com \(inscritos.count) alunos com o instrutor \(instrutor)."
    }
}


class treinosComPersonal: Aula{
    var nome: String
    var instrutor: Instrutor
    var categoria: CategoriasAulas
    var descricao: String
    
    init(nome: String, categoria: CategoriasAulas, descricao: String, instrutor: Instrutor) {
        self.nome = nome
        self.categoria = categoria
        self.descricao = descricao
        self.instrutor = instrutor
    }
    
    public func marcarTreino() -> String{
        return "Treino marcado com o instrutor(a): \(instrutor)"
    }
    
}

var pessoa: Pessoa = Pessoa(nome: "Enzo", email: "Email@", telefone: "49928922", endereco: "Mackenzie", cpf: "44412309",  sexo: "Masculino")


var instrutor: Instrutor = Instrutor(especialidade: "Agachamento", formcacao: "Educação Física", nome: "Juliana", email: "Emzil", telefone: "123123123", cpf: "01029831", endereco: "Meu coração", sexo: "Feminino")


var aluno: Aluno = Aluno(plano: Plano(nome: "Black", valorMensalidade: 300.0, incluiPersonal: true, limiteAulas: 30, duracaoPlano: .anual), biometria: "123441", objetivo: .ganharMassa, peso: 60.5, altura: 1.70, nome: "João", email: "Email", telefone: "12778653", cpf: "41241298", endereco: "mackenzie alphaville", nivel: .iniciante, sexo: "Masculino")


print(pessoa.getDescricao())
print(instrutor.getDescricao())
print(aluno.getDescricao())
