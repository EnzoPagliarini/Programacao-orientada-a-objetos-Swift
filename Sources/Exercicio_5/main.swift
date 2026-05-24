// O Perfil de Usuário
import Foundation


class PerfilUsuario{
    public let id: UUID
    public let dataDecadastro: Date
    public var nomeDeExibicao: String
    private var hashDaSenha: String
    
    init(nomeDeExibicao: String, senha: String) {
        id = UUID()
        dataDecadastro = Date()
        self.nomeDeExibicao = nomeDeExibicao
        self.hashDaSenha = senha + "_hashed"
    }
    
    
    public func alterarSenha(novaSenha: String) -> Bool{
        if novaSenha.count < 8 {
            print("Nova Senha deve ter pelo menos 8 caracteres")
            return false
        }
        hashDaSenha = novaSenha + "_hashed"
        return true
    }
    
    
    public func autenticar(senha: String) -> Bool {
        return (senha + "_hashed") == hashDaSenha
    }
}

// --- Casos de Teste ---
let usuario = PerfilUsuario(nomeDeExibicao: "Alex", senha:"senhaSegura123")
print("Usuário \(usuario.nomeDeExibicao) criado com ID: \(usuario.id)")
// Isto deve causar um ERRO
print("\n--- Autenticação ---")
print("Login com senha correta: \(usuario.autenticar(senha:"senhaSegura123"))")
// Esperado: true
print("Login com senha incorreta: \(usuario.autenticar(senha:"senhaErrada"))")
// Esperado: false


print("\n--- Alteração de Senha ---")
let sucesso = usuario.alterarSenha(novaSenha: "novaSenhaForte456")
print("Alteração de senha bem-sucedida: \(sucesso)")
// Esperado: true
print("Login com senha antiga: \(usuario.autenticar(senha:"senhaSegura123"))")
// Esperado: false
print("Login com nova senha: \(usuario.autenticar(senha:"novaSenhaForte456"))")
// Esperado: true
let falha = usuario.alterarSenha(novaSenha: "fraca")
print("Alteração de senha bem-sucedida: \(falha)")
// Esperado: false & mensagem de erro
print("Login com nova senha (deve ser a antiga ainda): \(usuario.autenticar(senha: "novaSenhaForte456"))")
// Esperado: true
