import XCTest
@testable import Relayance

final class DateExtensionTests: XCTestCase {
    let isoString = "2023-02-20T09:15:00Z"
    lazy var dateReference = Date.dateFromString(isoString)!

    func testDateFromString() {
        // GIVEN 🟢 & WHEN 🟡
        let valide = Date.dateFromString(isoString)
        let invalide = Date.dateFromString("Ceci n'est pas une date")
        
        // THEN 🔴 : On teste le succès et l'échec (retour nil)
        XCTAssertNotNil(valide)
        XCTAssertNil(invalide)
    }

    func testStringFromDate() {
        // WHEN 🟡
        let resultat = Date.stringFromDate(dateReference)
        
        // THEN 🔴
        XCTAssertEqual(resultat, "20-02-2023")
    }

    func testGetDateComponents() {
        // THEN 🔴 : On couvre getDay, getMonth et getYear
        XCTAssertEqual(dateReference.getDay(), 20)
        XCTAssertEqual(dateReference.getMonth(), 2)
        XCTAssertEqual(dateReference.getYear(), 2023)
    }
}
