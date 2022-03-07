//
//  CKRecord+Ext.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 3/7/22.
//

import CloudKit

extension CKRecord {
    func convertToPVLocations() -> PVLocations { PVLocations(record: self)}
    func convertToPVProfile() -> PVProfile { PVProfile(record: self)}
            
    
    }

