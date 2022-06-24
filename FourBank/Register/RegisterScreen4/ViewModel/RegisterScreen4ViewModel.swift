import Foundation

class RegisterScreen4ViewModel {
    
    
    func checkPassword(password: String, confirmPassword: String) -> Bool {
        
        if password == confirmPassword {
            
            return true
        }
        return false
    }
}
