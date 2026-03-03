import XCTest
@testable import Relayance

final class ListClientsViewModelTests: XCTestCase {
    var viewModel: ListClientsViewModel!

    override func setUp() {
        super.setUp()
        // GIVEN 🟢 : On repart d'un ViewModel propre avant chaque test
        viewModel = ListClientsViewModel()
    }

    func testAjouterClientIntegration() {
        // GIVEN 🟢
        let nombreInitial = viewModel.clientsList.count
        let nouveauNom = "Test Integration"
        let emailValide = "integration@test.fr"
        
        // WHEN 🟡 : On simule l'ajout via l'interface (ViewModel)
        viewModel.ajouterClient(nom: nouveauNom, email: emailValide)
        
        // THEN 🔴 : On vérifie que les briques communiquent bien
        XCTAssertEqual(viewModel.clientsList.count, nombreInitial + 1)
        XCTAssertEqual(viewModel.clientsList.first?.nom, nouveauNom)
    }

    func testAjouterClientEmailInvalide() {
        // GIVEN 🟢
        let nombreInitial = viewModel.clientsList.count
        let emailInvalide = "mauvais-format"
        
        // WHEN 🟡
        viewModel.ajouterClient(nom: "Erreur", email: emailInvalide)
        
        // THEN 🔴 : La validation doit bloquer l'ajout
        XCTAssertEqual(viewModel.clientsList.count, nombreInitial)
    }

    func testSupprimerClientIntegration() {
        // GIVEN 🟢 : On prend le premier client de la liste
        let clientASupprimer = viewModel.clientsList[0]
        let nombreInitial = viewModel.clientsList.count
        
        // WHEN 🟡
        viewModel.supprimerClient(client: clientASupprimer)
        
        // THEN 🔴
        XCTAssertEqual(viewModel.clientsList.count, nombreInitial - 1)
        XCTAssertFalse(viewModel.clientsList.contains(clientASupprimer))
    }
    
    func testEmailValidationLogic() {
        // Test unitaire à l'intérieur du ViewModel pour la RegEx
        XCTAssertTrue(viewModel.estEmailValide("test@relayance.com"))
        XCTAssertFalse(viewModel.estEmailValide("test@invalide"))
    }
}
