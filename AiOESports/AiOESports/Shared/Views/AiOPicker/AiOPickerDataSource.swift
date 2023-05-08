//
//  AiOPickerDataSource.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/05/2023.
//

import Foundation


protocol AiOPickerDataSource {
    func numberOfItems(picker: AiOPicker) -> Int
    func dataForIndex(at index: Int, picker: AiOPicker) -> AiOPickerDataPresenting
}



protocol AiOPickerDataPresenting {
    func getTitle() -> String
}
