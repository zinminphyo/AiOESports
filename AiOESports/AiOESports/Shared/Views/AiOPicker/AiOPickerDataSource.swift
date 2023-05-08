//
//  AiOPickerDataSource.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/05/2023.
//

import Foundation


protocol AiOPickerDataSource {
    func numberOfItems() -> Int
    func dataForIndex(at index: Int) -> AiOPickerDataPresenting
}



protocol AiOPickerDataPresenting {
    func getTitle() -> String
}
