//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation
import SwiftUIToolbox
import BootstrappKit

struct TemplateViewModel: Identifiable, Hashable, SearchFilterable {
    
    var id: String {
        template.id
    }

    var icon: String {
        switch template.specification.type {
        case .general:
            return "Sidebar Icons/General"
        case .xcodeProject(_):
            return "Sidebar Icons/Xcode Project"
        case .swiftPackage:
            return "Sidebar Icons/Swift Package"
        case .generalMetaTemplate:
            return "Sidebar Icons/General Meta Template"
        case .xcodeMetaTemplate:
            return "Sidebar Icons/Xcode Meta Template"
        case .swiftMetaTemplate:
            return "Sidebar Icons/Swift Meta Template"
        }
    }
    
    var template: BootstrappTemplate
    
    init(template: BootstrappTemplate) {
        self.template = template
    }
    
    func isMatch(for searchString: String) -> Bool {
        return id.lowercased().contains(searchString)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: TemplateViewModel, rhs: TemplateViewModel) -> Bool {
        lhs.id == rhs.id
    }
}
