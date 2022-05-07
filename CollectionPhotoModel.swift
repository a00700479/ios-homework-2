//
//  CollectionPhotoModel.swift
//  Navigation
//
//  Created by Natali on 03.05.2022.
//

import Foundation
import UIKit

struct CollectionViewModel {

    let image: UIImage

    static func makeCollectionModel() -> [CollectionViewModel] {

        var collectionDataSource = [CollectionViewModel]()

        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "1")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "2")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "3")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "4")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "5")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "6")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "7")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "8")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "9")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "10")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "11")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "12")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "13")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "14")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "15")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "16")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "17")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "18")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "19")!))
        collectionDataSource.append(CollectionViewModel(image: UIImage(named: "20")!))

        return collectionDataSource
    }
}
