//
//  MyImage.swift
//  STLixx
//
//  Created by Nicolas Neznik on 14/05/2022.
//

import UIKit

struct MyImage: Identifiable, Codable {
    var id = UUID()
    var name: String
    
    var image: UIImage {
        do {
            return try FileManager().readImage(with: id)
        } catch {
            return UIImage(systemName: "photo.fill")!
        }
    }
}
