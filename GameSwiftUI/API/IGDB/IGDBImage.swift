//
//  IGDBImage.swift
//  GameSwiftUI
//
//  Created by Joshi on 30.04.21.
//

import Foundation

struct IGDBImage {
    
    static var shared = IGDBImage()
    
    private init() { }

    func createImageUrl(game: Game, imageSize: IGDBImageSize, retina: Bool = false) -> URL? {
        guard game.cover != nil else { return nil }
        let showRetina = retina ? "_2x" : ""
        return URL(string: "https://images.igdb.com/igdb/image/upload/t_\(imageSize.rawValue)\(showRetina)/\(game.cover!.imageID).jpg")!
    }
}

enum IGDBImageSize: String {
    case micro = "micro"
    case thumbnail = "thumb"
    case coverSmall = "cover_small"
    case logoMed = "logo_med"
    case coverBig = "cover_big"
    case screenshotMedium = "screenshot_med"
    case screenshotBig = "screenshot_big"
    case screenshotHuge = "screenshot_huge"
    case hd = "720p"
    case fhd = "1080p"
}
