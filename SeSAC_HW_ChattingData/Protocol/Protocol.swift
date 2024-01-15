//
//  Protocol.swift
//  SeSAC_HW_ChattingData
//
//  Created by 박지은 on 1/15/24.
//

import UIKit

protocol ReusableProtocol {
    static var identifier: String { get }
}

extension ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
