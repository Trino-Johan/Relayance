import SwiftUI

struct ListClientsView: View {
    @StateObject var viewModel = ListClientsViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.clientsList, id: \.self) { client in
                NavigationLink {
                    DetailClientView(viewModel: viewModel, client: client)
                } label: {
                    Text(client.nom)
                        .font(.title3)
                }
            }
            .navigationTitle("Liste des clients")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Ajouter un client") {
                        showModal.toggle()
                    }
                    .foregroundStyle(.orange)
                    .bold()
                }
            }
            .sheet(isPresented: $showModal) {
                AjoutClientView(viewModel: viewModel, dismissModal: $showModal)
            }
        }
    }
}

#Preview {
    ListClientsView()
}
