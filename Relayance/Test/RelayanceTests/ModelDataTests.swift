import XCTest
@testable import Relayance

final class ModelDataTests: XCTestCase {
    func testChargementSource() {
        // GIVEN 🟢
        let nomFichier = "Source.json"
        
        // WHEN 🟡
        let clients: [Client] = ModelData.chargement(nomFichier)
        
        // THEN 🔴
        XCTAssertFalse(clients.isEmpty)
        XCTAssertEqual(clients.count, 8)
    }
}
