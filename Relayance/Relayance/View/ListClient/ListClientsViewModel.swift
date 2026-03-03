import Foundation

class ListClientsViewModel: ObservableObject {
    // "Observable" pour mettre à jour les vues automatiquement
    @Published var clientsList: [Client] = ModelData.chargement("Source.json")
    
    // Fonction d'ajout (Logique d'intégration)
    func ajouterClient(nom: String, email: String) {
        guard estEmailValide(email) else { return }
        let nouveau = Client.creerNouveauClient(nom: nom, email: email)
        clientsList.insert(nouveau, at: 0) // On l'ajoute en haut de liste
    }
    
    // Fonction de suppression (Logique d'intégration)
    func supprimerClient(client: Client) {
        if let index = clientsList.firstIndex(of: client) {
            clientsList.remove(at: index)
        }
    }
    
    // Validation d'email (Test unitaire du ViewModel)
    func estEmailValide(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
