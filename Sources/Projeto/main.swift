import Foundation

class Pessoa{
    fileprivate var nome: String
    fileprivate var email: String
    fileprivate var telefone: String
    fileprivate var endereco: String
    fileprivate let cpf: String
    fileprivate let sexo: String
    
    init(nome: String, email: String, telefone: String, endereco: String, cpf: String, sexo: String) {
        self.nome = nome
        self.email = email
        self.telefone = telefone
        self.endereco = endereco
        self.cpf = cpf
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
    case perderPeso
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
    private var cref: String
    
    
    init(especialidade: String, formcacao: String, nome: String, email: String, telefone: String, cpf: String, endereco: String, sexo: String, cref: String) {
        self.especialidade = especialidade
        self.formcacao = formcacao
        self.cref = cref
        super.init(nome: nome, email: email, telefone: telefone, endereco: endereco,cpf: cpf,  sexo: sexo)
    }
    
    override func getDescricao() -> String{
        return super.getDescricao() + "\nespecialidade = \(especialidade)\nformação = \(formcacao)"
    }
    
    public func getCref() -> String{
        return cref
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
    
    public func getIncluiPersonal() -> Bool{
        return incluiPersonal
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
            return "Não foi possível começar a aula pois não há alunos o suficiente."
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
    
    public func marcarTreino(aluno: Aluno) -> String{
        if aluno.plano.incluiPersonal{
            return "Treino marcado com o instrutor(a): \(instrutor)"
        }
        return "Seu plano não inclui treinos com personal."
    }
}


class Academia{
    private var nome: String
    private let cnpj: String
    private var endereco: String
    private var tamanho: Float
    private var telefone: String
    private  var urlSite: String
    private var instutores: [String: Instrutor]
    private var alunos: [String: Aluno]
    private var aulas: [String: Aula]
    
    
    init(nome: String, cnpj: String, endereco: String, tamanho: Float, telefone: String, urlSite: String, instutores: [String : Instrutor], alunos: [String : Aluno], aulas: [String : Aula]) {
        self.nome = nome
        self.cnpj = cnpj
        self.endereco = endereco
        self.tamanho = tamanho
        self.telefone = telefone
        self.urlSite = urlSite
        self.instutores = [:]
        self.alunos = [:]
        self.aulas = [:]
    }
    
    public func getDetails() -> String{
       return "Nome da academia: \(nome)\nCNPJ: \(cnpj)\nEndereço: \(endereco)\nTamanho da academia: \(tamanho)\nTelefone: \(telefone)\nUrl do Site: \(urlSite)"
    }
    
    public func cadastrarInstrutor(instrutor: Instrutor) -> String{
        let id = String(instrutor.getCref())
        if instutores[id] != nil{
            return "Instrutor ja cadastrado"
        }
        instutores[id] = instrutor
        return "Intrutor cadastrado!"
    }
    
    public func cadastrarAluno(aluno: Aluno) -> String{
        let id = String(aluno.getMatricula())
        if alunos[id] != nil{
            return "Aluno ja cadastrado"
        }
        alunos[id] = aluno
        return "Aluno cadastrado!"
    }
    
    func removerAluno(matricula: Int) -> String {
        let key = String(matricula)
        guard alunos.removeValue(forKey: key) != nil else {
            return "Aluno não encontrado"
        }
        return "Aluno removido"
    }

    func removerInstrutor(cref: String) -> String {
        guard instutores.removeValue(forKey: cref) != nil else {
            return "Instrutor não encontrado"
        }
        return "Instrutor removido"
    }

    func cadastrarAula(id: String, aula: Aula) -> String {
        if aulas[id] != nil {
            return "Aula já cadastrada"
        }
        aulas[id] = aula
        return "Aula cadastrada!"
    }

    func removerAula(id: String) -> String {
        guard aulas.removeValue(forKey: id) != nil else {
            return "Aula não encontrada"
        }
        return "Aula removida"
    }

    func contemAluno(matricula: Int) -> Bool {
        alunos[String(matricula)] != nil
    }

    func contemInstrutor(cref: String) -> Bool {
        instutores[cref] != nil
    }
    

    func totalDeAlunos() -> Int {
        alunos.count
    }
    func totalDeInstrutores() -> Int {
        instutores.count
    }
    
    func totalDeAulas() -> Int{
        aulas.count
    }
}


//TESTES

var pessoa: Pessoa = Pessoa(nome: "Enzo", email: "Email@", telefone: "49928922", endereco: "Mackenzie", cpf: "44412309", sexo: "Masculino")

var instrutor: Instrutor = Instrutor(especialidade: "Agachamento", formcacao: "Educação Física", nome: "Juliana", email: "Emzil", telefone: "123123123", cpf: "01029831", endereco: "Meu coração", sexo: "Feminino", cref: "12341351")

var instrutor2: Instrutor = Instrutor(especialidade: "Spinning", formcacao: "Educação Física", nome: "Carlos", email: "carlos@gym.com", telefone: "99999999", cpf: "09876543", endereco: "SP", sexo: "Masculino", cref: "CREF-002")

var aluno: Aluno = Aluno(plano: Plano(nome: "Black", valorMensalidade: 300.0, incluiPersonal: true, limiteAulas: 30, duracaoPlano: .anual), biometria: "123441", objetivo: .ganharMassa, peso: 60.5, altura: 1.70, nome: "João", email: "Email", telefone: "12778653", cpf: "41241298", endereco: "mackenzie alphaville", nivel: .iniciante, sexo: "Masculino")

var aluno1: Aluno = Aluno(plano: Plano(nome: "Gold", valorMensalidade: 150.0, incluiPersonal: false, limiteAulas: 15, duracaoPlano: .trimestral), biometria: "222222", objetivo: .ganharMassa, peso: 65.0, altura: 1.65, nome: "Maria", email: "maria@m.com", telefone: "99887766", cpf: "55556666", endereco: "SP", nivel: .intermediario, sexo: "Feminino")

var aluno2: Aluno = Aluno(plano: Plano(nome: "Básico", valorMensalidade: 80.0, incluiPersonal: false, limiteAulas: 8, duracaoPlano: .mensal), biometria: "333333", objetivo: .altaPerformance, peso: 80.0, altura: 1.80, nome: "Lucas", email: "lucas@m.com", telefone: "11223344", cpf: "77778888", endereco: "SP", nivel: .avancado, sexo: "Masculino")

var aluno3: Aluno = Aluno(plano: Plano(nome: "Básico", valorMensalidade: 80.0, incluiPersonal: false, limiteAulas: 8, duracaoPlano: .mensal), biometria: "444444", objetivo: .poliesportivo, peso: 55.0, altura: 1.60, nome: "Ana", email: "ana@m.com", telefone: "55443322", cpf: "99990000", endereco: "SP", nivel: .iniciante, sexo: "Feminino")

var academia = Academia(nome: "SmartFit", cnpj: "12412455", endereco: "Paulista", tamanho: 240.5, telefone: "52346601", urlSite: "www.smartfit.com", instutores: [:], alunos: [:], aulas: [:])

print("=== CADASTROS ===")
print(academia.cadastrarInstrutor(instrutor: instrutor))
print(academia.cadastrarInstrutor(instrutor: instrutor2))
print(academia.cadastrarAluno(aluno: aluno))
print(academia.cadastrarAluno(aluno: aluno1))
print(academia.cadastrarAluno(aluno: aluno2))
print(academia.cadastrarAluno(aluno: aluno3))
print("Total de alunos: \(academia.totalDeAlunos())")
print("Total de instrutores: \(academia.totalDeInstrutores())")

print("\n=== DUPLICAÇÃO ===")
print(academia.cadastrarInstrutor(instrutor: instrutor))
print(academia.cadastrarAluno(aluno: aluno))

let turmaSpin = turmasColetivas(nome: "Spinning Matinal", categoria: .spinning, descricao: "Alta intensidade", instrutor: instrutor2, capacidade: 3)
let treinoPersonal = treinosComPersonal(nome: "Hipertrofia", categoria: .musculacao, descricao: "Treino personalizado", instrutor: instrutor)

print(academia.cadastrarAula(id: "SPIN-01", aula: turmaSpin))
print(academia.cadastrarAula(id: "PERS-01", aula: treinoPersonal))

print("\n=== SUPERLOTAÇÃO ===")
print(turmaSpin.inscreverAluno(aluno: aluno))
print(turmaSpin.inscreverAluno(aluno: aluno1))
print(turmaSpin.inscreverAluno(aluno: aluno2))
print(turmaSpin.inscreverAluno(aluno: aluno3))


print("\n=== PERSONAL SEM PLANO ===")
print(treinoPersonal.marcarTreino(aluno: aluno))
print(treinoPersonal.marcarTreino(aluno: aluno1))
print(treinoPersonal.marcarTreino(aluno: aluno2))
print("\n=== EQUIPAMENTOS ===")
let esteira   = Aparelho(nomeItem: "Esteira 01")
let bicicleta = Aparelho(nomeItem: "Bicicleta Ergométrica 02")
let halter    = Aparelho(nomeItem: "Halter 20kg")


bicicleta.historico.append("Manutenção não realizada")


print("\n=== Instrutor + Aluno como [Pessoa] ===")
let pessoas: [Pessoa] = [instrutor, instrutor2, aluno, aluno1, aluno2, aluno3]
for p in pessoas {
    print("---")
    print(p.getDescricao())
}

print("\n=== Aulas agrupadas pelo protocolo Aula ===")
let todasAulas: [Aula] = [turmaSpin, treinoPersonal]
for a in todasAulas {
    print("--- \(a.nome) | categoria: \(a.categoria) | descrição: \(a.descricao)")
}

print("\n=== Totais ===")
print("Total de alunos: \(academia.totalDeAlunos())")
print("Total de instrutores: \(academia.totalDeInstrutores())")
print("Total de aulas: \(academia.totalDeAulas())")



