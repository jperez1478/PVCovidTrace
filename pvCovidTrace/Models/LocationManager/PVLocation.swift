//
//  PVLocation.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 3/6/22.
//

import CloudKit

//had to call it PVLocations extaclty as the maunal data
struct PVLocations {
    //creating constants
    static let kName = "name"
    static let kDescription = "description"
    static let kSquareAsset = "squareAsset"
    
    
    let ckRecordID: CKRecord.ID //reference to our pvProfile  to our location to checj in recordid imp
    let name: String
    let description: String
    let squareAsset: CKAsset! //unwrapping will handle or nill error with the imgs
    let bannerAsset: CKAsset! //unwrapping will handle or nill error with the imgs
    let adresss: String
    let location: CLLocation
    let phoneNumber: String
    
 
    init(record: CKRecord) {
        ckRecordID = record.recordID
        name = record[PVLocation.kName] as? String ?? "N/A"
        description = record["descirption"] as? String ?? "N/A"
        squareAsset = record[PVLocation.kSquareAsset] as? CKAsset ?? CKAsset(
    }
}
