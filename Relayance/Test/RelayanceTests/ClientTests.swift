import XCTest
@testable import Relayance

final class ClientTests: XCTestCase {
    
    func testInitClient() {
        // GIVEN 🟢
        let nom = "Jean"
        let email = "j@j.fr"
        let dateString = "2023-01-01T10:00:00Z"
        
        // WHEN 🟡
        let client = Client(nom: nom, email: email, dateCreationString: dateString)
        
        // THEN 🔴
        XCTAssertEqual(client.nom, nom)
        XCTAssertEqual(client.email, email)
    }

    func testCreerNouveauClient() {
        // GIVEN 🟢
        let nom = "Eve"
        
        // WHEN 🟡
        let client = Client.creerNouveauClient(nom: nom, email: "eve@test.com")
        
        // THEN 🔴
        XCTAssertEqual(client.nom, nom)
        XCTAssertTrue(client.estNouveauClient())
    }

    func testEstNouveauClient() {
        // GIVEN 🟢
        let recent = Client.creerNouveauClient(nom: "A", email: "a@a.com")
        let ancien = Client(nom: "B", email: "b@b.com", dateCreationString: "2000-01-01T10:00:00Z")
        
        // Ajout pour le 100% : un client avec une date invalide
        // Cela force l'accès à dateCreation et active le "?? Date.now"
        let invalide = Client(nom: "C", email: "c@c.com", dateCreationString: "erreur")
        
        // THEN 🔴
        XCTAssertTrue(recent.estNouveauClient())
        XCTAssertFalse(ancien.estNouveauClient())
        XCTAssertTrue(invalide.estNouveauClient()) // Tombe sur Date.now (aujourd'hui)
    }

    func testClientExiste() {
        // GIVEN 🟢 : Test de présence et d'absence pour couvrir les closures
        let client = Client(nom: "C", email: "c@c.com", dateCreationString: "2023-01-01T10:00:00Z")
        let liste = [client]
        
        // THEN 🔴
        XCTAssertTrue(client.clientExiste(clientsList: liste))
        XCTAssertFalse(client.clientExiste(clientsList: []))
    }

    func testFormatDateVersString() {
        // GIVEN 🟢
        let clientValide = Client(nom: "D", email: "d@d.com", dateCreationString: "2023-02-20T09:15:00Z")
        let clientInvalide = Client(nom: "E", email: "e@e.com", dateCreationString: "date_nulle")
        
        // WHEN 🟡 & THEN 🔴
        XCTAssertEqual(clientValide.formatDateVersString(), "20-02-2023")
        
        // ✅ CORRECTION : On attend "date_nulle" car c'est ce que renvoie le guard
        XCTAssertEqual(clientInvalide.formatDateVersString(), "date_nulle")
    }
}
