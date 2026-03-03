import SwiftUI

struct AjoutClientView: View {
    @ObservedObject var viewModel: ListClientsViewModel
    @Binding var dismissModal: Bool
    @State var nom: String = ""
    @State var email: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Nouveau client").font(.largeTitle).bold()
            TextField("Nom", text: $nom).textFieldStyle(.roundedBorder)
            TextField("Email", text: $email).textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
            
            Button("Ajouter") {
                viewModel.ajouterClient(nom: nom, email: email)
                dismissModal.toggle() // Retour à l'écran précédent
            }
            .disabled(nom.isEmpty || !viewModel.estEmailValide(email))
            .buttonStyle(.borderedProminent).tint(.orange)
        }
        .padding()
    }
}

