//
//  MockData.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 3/7/22.
//

import CloudKit

struct MockData {
    
    static var location: CKRecord {
        let record = CKRecord(recordType: "PVLocations")
        record[PVLocations.kName]        = "John LB Coleman Library"
        record[PVLocations.kAdress]      = "123 Main Street"
        record[PVLocations.kDescription] = "This is a test description"
        record[PVLocations.klocation]    = CLLocation(latitude: 30.095264, longitude: -95.989301)
        record[PVLocations.kPhoneNumber] = "111-111-111"
        return record
    }
}
