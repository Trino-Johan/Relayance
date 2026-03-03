//
//  DetailClientView.swift
//  Relayance
//
//  Created by Amandine Cousin on 10/07/2024.
//

import SwiftUI

struct DetailClientView: View {
    @ObservedObject var viewModel: ListClientsViewModel
    @Environment(\.dismiss) var dismiss // Plus moderne que presentationMode
    var client: Client
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle").resizable().frame(width: 100, height: 100).foregroundStyle(.orange)
            Text(client.nom).font(.title)
            Text(client.email).font(.title3)
            Text(client.formatDateVersString()).font(.caption)
            Spacer()
        }
        .toolbar {
            Button("Supprimer") {
                viewModel.supprimerClient(client: client)
                dismiss() // Retour à l'écran précédent
            }
            .foregroundStyle(.red).bold()
        }
    }
}

