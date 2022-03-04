//
//  PVLocations.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/23/22.
//

import Foundation
import CloudKit



struct PVLocation {
    static let kName            = "name"
    static let KDescription     = "description"
    static let kSquareAsset     = "squareAsset"
    static let kBannerAsset     = "bannerAsset"
    static let KAdress          = "address"
    static let kLocation        = "location"
    static let kWebsiteUrl      = "websiteURL"
    static let kPhoneNumber     = "phoneNumber"
    
    let ckRecodID: CKRecord.ID
    let name: String
    let description: String
    let squareAsset: CKAsset!
    let bannerAsset: CKAsset!
    let adress: String
    let location: CLLocation
    let webisteURL: String
    let phoneNumber: String
    
  
    init(record: CKRecord) {
        ckRecodID   = record.recordID
        name        = record[PVLocation.kName] as? String ?? "N/A"
        description = record[PVLocation.KDescription] as? String ?? "N/A"
        squareAsset = record[PVLocation.kSquareAsset] as?  CKAsset
        bannerAsset = record[PVLocation.kBannerAsset] as? CKAsset
        adress     = record[PVLocation.KAdress] as? String ?? "N/A"
        location   = record[PVLocation.kLocation] as? CLLocation ?? CLLocation(latitude: 0,  longitude: 0)
        phoneNumber = record[PVLocation.kPhoneNumber] as? String ?? "N/A"
        webisteURL = record[PVLocation.kWebsiteUrl] as? String ?? "N/A"
    }
}
