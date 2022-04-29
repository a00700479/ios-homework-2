//
//  Post.swift
//  Navigation
//
//  Created by Natali on 26.04.2022.
//

import UIKit

struct PostModel {
    
    let authorName: String
    var description: String?
    let imageName: String
    let image: UIImage
    var numberOfLikes: Int
    var numberOfViews: Int
    
    static func makePostModel() -> [[PostModel]] {
        
        var model = [[PostModel]]()
        
        var section = [PostModel]()
        
        section.append(PostModel(authorName: "Рита C.",
                                 description: "Чипа ждет, чтобы ее погладили. However, if you are using scaled fonts, it’s not as easy. You don’t necessarily know the size of the font you’re using because they dynamically scale based on the user’s preference. Scaled fonts are a wonderful thing for those of us with older eyes that can’t see as well as they used to. I always appreciate apps that take advantage of this accessibility feature.",
                                 imageName: "Чипа",
                                 image: UIImage(named: "chipa")!,
                                 numberOfLikes: 5,
                                 numberOfViews: 5))
        section.append(PostModel(authorName: "Рита C.",
                                 description: "Ксюша ждет еду",
                                 imageName: "Ксюша",
                                 image: UIImage(named: "ksyusha")!,
                                 numberOfLikes: 9,
                                 numberOfViews: 9))
        section.append(PostModel(authorName: "Рита C.",
                                 description: "Для Фили построили домик",
                                 imageName: "Филя",
                                 image: UIImage(named: "philya")!,
                                 numberOfLikes: 10,
                                 numberOfViews: 10))
        section.append(PostModel(authorName: "Таня У.",
                                 description: "Петюня всегда спит на спортинвентаре",
                                 imageName: "Петюня",
                                 image: UIImage(named: "peta")!,
                                 numberOfLikes: 5,
                                 numberOfViews: 5))
        section.append(PostModel(authorName: "Таня У.",
                                 description: "Маргоша наблюдает из укрытия",
                                 imageName: "Маргоша",
                                 image: UIImage(named: "margo")!,
                                 numberOfLikes: 5,
                                 numberOfViews: 5))
        model.append(section)
        return model
    }
}
