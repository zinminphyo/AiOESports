//
//  UploadProfileModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 01/05/2023.
//

import Foundation
import UIKit



enum UploadProfileModule {
    static func createModule() -> UploadProfile? {
        let st = UIStoryboard(name: "UploadProfile", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: UploadProfile.self)) as? UploadProfile else { return nil }
        return vc
    }
}
