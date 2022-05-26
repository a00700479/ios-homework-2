//
//  ProfileViewController+Extension.swift
//  Navigation
//
//  Created by Natali on 23.05.2022.
//

import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource  {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count + 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row  == 0 {

            let likesCell = tableView.dequeueReusableCell(withIdentifier: Cells.likesCell) as! MyFavouredPhotosCell
            likesCell.setLikes(myLikes: likeLabel)
            likesCell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            likesCell.selectionStyle = UITableViewCell.SelectionStyle.none
            return likesCell

        } else if indexPath.row  == 1 {

            let photoCell = tableView.dequeueReusableCell(withIdentifier: Cells.photoCell) as! PhotosTableViewCell
            let photo = photos
            photoCell.set4photo(photo: photo)
            photoCell.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
            photoCell.selectionStyle = UITableViewCell.SelectionStyle.none
            photoCell.isUserInteractionEnabled = true
            return photoCell

        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.labelCell) as! MyFavouredPostCell
            cell.setFav(favourites: label)
            cell.backgroundColor = .white
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.postCell) as! PostTableViewCell
            cell.likedDelegate = self
            if liked {
                dataSource[indexPath.row - 3].likes += 1
                liked.toggle()
            }

            let article = dataSource[indexPath.row - 3]
            let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                        image: article.imageName,
                                                        description: article.description,
                                                        likesNum: article.likes,
                                                        views: article.views)
            cell.setup(with: viewModel)
            cell.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        profileView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        return profileView
    }

    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: true)

        } else if indexPath.row >= 3 {

            dataSource[indexPath.row - 3].views += 1
            tableView.reloadRows(at: [indexPath], with: .none)
            let postZoomVC = PostZoomViewController()
            let post = dataSource[indexPath.row - 3]
            let navVC = UINavigationController(rootViewController: postZoomVC)
            navVC.modalPresentationStyle = .fullScreen
            navVC.modalTransitionStyle = .crossDissolve
            postZoomVC.set(post: post)
            present(navVC, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        if indexPath.row == 1 {
            let photoCell = tableView.dequeueReusableCell(withIdentifier: Cells.photoCell) as! PhotosTableViewCell
            photoCell.selectionStyle = UITableViewCell.SelectionStyle.none
        }
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.row != 0 {
            let deleteAction = UIContextualAction(style: .destructive, title: "delete") {
                (contextualAction, view, boolValue) in dataSource.remove(at: indexPath.row - 3)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
            return swipeActions
        }
        else { return nil }
    }
}

extension ProfileViewController {
    func fetchData() -> [PostView] {
        let post1 = PostView(author: "Рита C.", description: "Чипа ждет, чтобы ее погладили. However, if you are using scaled fonts, it’s not as easy. You don’t necessarily know the size of the font you’re using because they dynamically scale based on the user’s preference. Scaled fonts are a wonderful thing for those of us with older eyes that can’t see as well as they used to. I always appreciate apps that take advantage of this accessibility feature.", imageName: "chipa", likes: 29, views: 34)
        let post2 = PostView(author: "Рита C.", description: "Ксюша ждет еду", imageName: "ksyusha", likes: 39, views: 49)
        let post3 = PostView(author: "Таня У.", description: "Петюня всегда спит на спортинвентаре", imageName: "peta", likes: 62, views: 76)
        let post4 = PostView(author: "Таня У.", description: "Маргоша наблюдает из укрытия", imageName: "margo", likes: 20, views: 25)
        return [post1, post2, post3, post4]
    }
}
