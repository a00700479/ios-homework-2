//
//  PhotosViewController+Extention.swift
//  Navigation
//
//  Created by Natali on 23.05.2022.
//

import UIKit

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifierPhotoCollection, for: indexPath) as? PhotoCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCollectionCell", for: indexPath)
            cell.backgroundColor = .black
            return cell
        }
        cell.backgroundColor = .systemGray6
        let photos = photos[indexPath.row]
        cell.photoGalleryImages.image = UIImage(named: photos.imageName)
        cell.photoGalleryImages.contentMode = .scaleAspectFill
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let photoZoomVC = PhotoZoomVIewController()
        let image = self.photos[indexPath.row]
        let navVC = UINavigationController(rootViewController: photoZoomVC)
        navVC.modalPresentationStyle = .fullScreen
        navVC.modalTransitionStyle = .crossDissolve
        photoZoomVC.set(image: image)
        present(navVC, animated: true)
    }
}

extension PhotosViewController {
    func fetchData() -> [PhotosView] {

        let photo1 = PhotosView(imageName: "1")
        let photo2 = PhotosView(imageName: "2")
        let photo3 = PhotosView(imageName: "3")
        let photo4 = PhotosView(imageName: "4")
        let photo5 = PhotosView(imageName: "5")
        let photo6 = PhotosView(imageName: "6")
        let photo7 = PhotosView(imageName: "7")
        let photo8 = PhotosView(imageName: "8")
        let photo9 = PhotosView(imageName: "9")
        let photo10 = PhotosView(imageName: "10")
        let photo11 = PhotosView(imageName: "11")
        let photo12 = PhotosView(imageName: "12")
        let photo13 = PhotosView(imageName: "13")
        let photo14 = PhotosView(imageName: "14")
        let photo15 = PhotosView(imageName: "15")
        let photo16 = PhotosView(imageName: "16")
        let photo17 = PhotosView(imageName: "17")
        let photo18 = PhotosView(imageName: "18")
        let photo19 = PhotosView(imageName: "19")
        let photo20 = PhotosView(imageName: "20")

        return [photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10, photo11, photo12, photo13, photo14, photo15, photo16, photo17, photo18, photo19, photo20]
    }
}
