//
//  CloudKitManager.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 3/7/22.
//

import CloudKit

struct CloudKitManager {
    ///get locations(network call)
    static func  getLocations(completed: @escaping (Result<[PVLocations], Error>) -> Void) {
        let sortDescriptor = NSSortDescriptor(key: PVLocations.kName, ascending: true) ///alphaebtic order
        let query = CKQuery(recordType: RecordType.location, predicate: NSPredicate(value: true))
        query.sortDescriptors = [sortDescriptor]
        
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            guard error == nil else {
                completed(.failure(error!))
                return
            }
            
            guard let records = records else { return }
            
            let locations = records.map { $0.convertToPVLocations() } //as iterating to array
            completed(.success(locations))
        }
    }
}

