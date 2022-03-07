//
//  CKAsset+Ext.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 3/7/22.
//

import CloudKit
import UIKit

extension CKAsset {
    func convertToUIImage(in dimension: ImageDimension) -> UIImage {
        let placeholder = ImageDimension.getPlaceholder(for: dimension)
        
        ///go to file url in our projcet to get iages
        guard let fileUrl = self.fileURL else { return placeholder }
        do {
            let data = try Data(contentsOf: fileUrl)
            return UIImage(data: data) ?? placeholder
        } catch {
            return placeholder
        }
    }
}
