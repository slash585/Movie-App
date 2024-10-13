//
//  AppBuilder.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 13.10.2024.
//

import Foundation
import UIKit

final class AppBuilder {
    static func make () -> UIViewController {
        let viewController = MovieListBuilder.make()
        return viewController
    }
}
