//
//  PVProfile.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/23/22.
//


import Foundation
import CloudKit



struct PVProfile {
    static let kFirstName            = "firstName"
    static let KLastName              = "lastName"
    static let kBio                 = "bio"
    static let kIsCheckedIn         = "isCheckedIn"
    
    let ckRecodID: CKRecord.ID
    let firstName: String
    let lastName: String
    let covidStatus: String
    let isCheckedIn: CKRecord.Reference? = nil 
  
    init(record: CKRecord) {
        ckRecodID   = record.recordID
        firstName   = record[PVProfile.kFirstName] as? String ?? "N/A"
        lastName  =  record[PVProfile.KLastName] as? String ?? "N/A"
        covidStatus = record[PVProfile.kBio] as? String ?? "N/A"
    }
}
