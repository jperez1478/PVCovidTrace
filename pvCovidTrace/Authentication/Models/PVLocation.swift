//
//  PVLocation.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 3/6/22.
//

import CloudKit
import UIKit

//had to call it PVLocations extaclty as the maunal data
struct PVLocations: Identifiable {
    
    //creating constants
    static let kName = "name"
    static let kDescription = "description"
    static let kSquareAsset = "squareAsset"
    static let kBannerAsset = "bannerAsset"
    static let kAdress     = "adress"
    static let kPhoneNumber = "phoneNumber"
    static let klocation   = "location"
    
    
    let id: CKRecord.ID //reference to our pvProfile  to our location to checj in recordid imp
    let name: String
    let description: String
    let squareAsset: CKAsset! //unwrapping will handle or nill error with the imgs
    let bannerAsset: CKAsset! //unwrapping will handle or nill error with the imgs
    let adresss: String
    let location: CLLocation
    let phoneNumber: String
    

    init(record: CKRecord) {
        id = record.recordID
        name  = record[PVLocations.kName] as? String ?? "N/A"
        description = record[PVLocations.kDescription] as? String ?? "N/A"
        squareAsset = record[PVLocations.kSquareAsset] as? CKAsset
        bannerAsset = record[PVLocations.kBannerAsset] as? CKAsset
        adresss = record[PVLocations.kAdress] as? String ?? "N/A"
        location = record[PVLocations.klocation] as? CLLocation ?? CLLocation(latitude: 0, longitude: 0)
        phoneNumber = record[PVLocations.kPhoneNumber] as? String ?? "N/A"
        
    }
    
    func createSquareImage() -> UIImage  {
        guard let asset = squareAsset else { return PlaceholderImage.square }
        return asset.convertToUIImage(in: .square)
        
    }
    func createBannerImage() -> UIImage  {
        guard let asset = bannerAsset else { return PlaceholderImage.banner }
        return asset.convertToUIImage(in: .banner)
        
    }
    
}


