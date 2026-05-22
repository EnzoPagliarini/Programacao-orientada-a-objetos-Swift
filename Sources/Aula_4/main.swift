class User{
    let nome: String
    let email: String

    init(nome: String, email: String){
        self.nome = nome
        self.email = email
    }


    func getDescricao() -> String{
        return"nome: \(nome) ,email: \(email)"
    }
}

//class UserComPagamento: User{
  //   func processarPagamento() -> String{
    //    fatalError("Subclasses devem implementar a forma de pagamento")
    //}
//}

protocol Pagavel {
    func processarPagamento() -> String
}

class Aluno: Pagavel{
    let user: User
    let matricula: Int
    let valorPlano: Int

    init(user: User, valorPlano: Int){
        self.valorPlano = valorPlano
        matricula = Int.random(in: 1000...4000)
        self.user = user
    }
    
     func processarPagamento() -> String{
        return "Mensalidade do plano \(valorPlano) feita por \(user.nome)"
    }


}

class Influenciadores: Pagavel{
    func processarPagamento() -> String{
        return "O influenciador não faz pagamento"
    }
}

class Instrutor: Pagavel{
    let user: User
    let cref: String
    let especialidade: String


    init(user:User, especialidade: String, cref: String){
        self.especialidade = especialidade
        self.cref = cref
        self.user = user
    }

    func processarPagamento() -> String{
        return "Crédito de salário feito para \(user.nome)"
    }

}

protocol Influ{
    func postagemINst() -> String
}

class Nutricionista: Pagavel, Influ{
    let user: User
    let crn: String
    let valorSessao: Int
    //let total = Int
    let numSessions: Int

    init(user: User, crn: String, valorSessao: Int, numSessions: Int){
        self.crn = crn
        self.valorSessao = valorSessao
        self.user = user
        self.numSessions = numSessions
    }

    func postagemINst() -> String{
        return "Postagens mensais"
    }
    

    func processarPagamento() -> String{
        let total = valorSessao * numSessions 
        return "O valor de \(total) para as \(numSessions) feitas"
    }
}


let aluno = Aluno(
    user: User(nome: "Enzo", email: "email"), valorPlano: 300
)

let instrutor = Instrutor(
    user: User(nome: "Jonas", email: "Email "), especialidade: "musculacao",cref:"102983"
)

let pagaveis: [Pagavel] = [aluno, instrutor]

for p in pagaveis{
    print(p.processarPagamento())
}
