import Foundation

class User{
    var nome: String
    var email: String
    
    init (nome: String, email: String){
        self.nome = nome
        self.email = email
    }

    func getDescricao() -> String{
        return "Nome \(nome) e email: \(email)"
    }

    func processarPagamento() -> String{
        fatalError ("Subclasses devem implementar seu tipo de pagamento")
    }
}

class Nutricionista: User{
    let crn: String
    let valorSessao: Int
    
    init(nome: String, email: String, crn: String, valorSessao: Int){
        self.crn = crn
        self.valorSessao = valorSessao
        super.init(nome: nome, email: email)

    }


}

class Aluno: User{
    let matricula: Int
    let plano: String


    init(nome: String, email: String, plano: String){
        matricula = Int.random(in: 100...2000)
        self.plano = plano
        super.init(nome: nome, email: email)

    }



    override func getDescricao() -> String{
        return "Nome: \(nome), Email \(email), matricula \(matricula), plano \(plano)"
    }

    override func processarPagamento() -> String{
        return "Debito da mensalidade do plano \(plano) feito por \(nome)"
    }
}





class Instrutor: User{
    var cref: String
    let especialidade: String

    init(nome: String, email: String, cref: String, especialidade: String){
        self.cref = cref
        self.especialidade = especialidade
        super.init(nome: nome, email: email)

    }


    override func processarPagamento() -> String{
        return "Credito do salario debitado para o instrutor \(nome)"
    }
}



var aluno = Aluno(nome: "Enzo", email:"email@email", plano: "Plano black")
var instrutor = Instrutor(nome: "joao", email:"email@email", cref: "129837", especialidade:"musculacao")
var Nutricionista = Nutricionista(nome: "Enzo", email:"email@email", crn: "121212", valorSessao: 150)
//print(aluno.processarPagamento())
//print(instrutor.getDescricao())

let usuarios: [User] = [aluno, instrutor, nutricionista]

for user in usuarios{
    print(user.processarPagamento())
}