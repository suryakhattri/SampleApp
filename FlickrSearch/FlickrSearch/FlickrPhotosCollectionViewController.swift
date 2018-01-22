//
//  FlickrPhotosCollectionViewController.swift
//  FlickrSearch
//
//  Created by Rajan Khattri on 1/15/18.
//  Copyright © 2018 Surya Khattri. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class FlickrPhotosCollectionViewController: UICollectionViewController  {

    
    fileprivate let reuseIdentifier = "FlickrCell"
    fileprivate let reusePhotoIdentifier = "FlickrPhotoCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    fileprivate var searches = [FlickrSearchResults]()
    fileprivate let flickr = Flickr()
    fileprivate let itemsPerRow: CGFloat = 3
    fileprivate var selectedPhotos = [FlickrPhoto]()
    fileprivate let shareTextLabel = UILabel()
    
    
//    var largePhotoIndexPath: IndexPath? {
//        didSet {
//            //2
//            var indexPaths = [IndexPath]()
//            if let largePhotoIndexPath = largePhotoIndexPath {
//                indexPaths.append(largePhotoIndexPath)
//            }
//            if let oldValue = oldValue {
//                indexPaths.append(oldValue)
//            }
//            //3
//            collectionView?.performBatchUpdates({
//                self.collectionView?.reloadItems(at: indexPaths)
//            }) { completed in
//                //4
//                if let largePhotoIndexPath = self.largePhotoIndexPath {
//                    self.collectionView?.scrollToItem(
//                        at: largePhotoIndexPath,
//                        at: .centeredVertically,
//                        animated: true)
//                }
//            }
//        }
//    }

    var largePhotoIndexPath: IndexPath? {
        didSet {
            //2
            var indexPaths = [IndexPath]()
            if let largePhotoIndexPath = largePhotoIndexPath {
                indexPaths.append(largePhotoIndexPath)
            }
            if let oldValue = oldValue {
                indexPaths.append(oldValue)
            }
            //3
            collectionView?.performBatchUpdates({
                self.collectionView?.reloadItems(at: indexPaths)
            }) { completed in
                //4
                if let largePhotoIndexPath = self.largePhotoIndexPath {
                    self.collectionView?.scrollToItem(
                        at: largePhotoIndexPath,
                        at: .centeredVertically,
                        animated: true)
                }
            }
        }
    }
    
    var sharing: Bool = false {
        didSet {
            collectionView?.allowsMultipleSelection = sharing
            collectionView?.selectItem(at: nil, animated: true, scrollPosition: UICollectionViewScrollPosition())
            selectedPhotos.removeAll(keepingCapacity: false)
            
            guard let shareButton = self.navigationItem.rightBarButtonItems?.first else {
                return
            }
            
            guard sharing else {
                navigationItem.setRightBarButtonItems([shareButton], animated: true)
                return
            }
            
            if let _ = largePhotoIndexPath  {
                largePhotoIndexPath = nil
            }
            
            updateSharedPhotoCount()
            let sharingDetailItem = UIBarButtonItem(customView: shareTextLabel)
            navigationItem.setRightBarButtonItems([shareButton,sharingDetailItem], animated: true)
        }
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Register cell classes
////        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
////        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reusePhotoIdentifier)
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//
//        // Configure the cell
//
//        return cell
//    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    
//    MARK: - Action
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        
        guard !searches.isEmpty
            else {  return  }
        
        // We have not selected photos
        guard !selectedPhotos.isEmpty
            else {  sharing = !sharing; return }
        
        if sharing {
            let imageArray: [UIImage] = selectedPhotos.map {  return $0.thumbnail!  }
            
            if !imageArray.isEmpty {
                let shareScreen = UIActivityViewController(activityItems: imageArray, applicationActivities: nil)
                shareScreen.completionWithItemsHandler = {
                    [unowned self] (activityType, completed, returnedItems, activityError) in
                    self.sharing = false
                }
                
                let popoverPresentationController = shareScreen.popoverPresentationController
                popoverPresentationController?.barButtonItem = sender
                popoverPresentationController?.permittedArrowDirections = .any
                present(shareScreen, animated: true, completion: nil)
            }
        }
    }
    
}


private extension FlickrPhotosCollectionViewController {
    
    func photoForIndexPath(indexPath: IndexPath) -> FlickrPhoto {
        return searches[(indexPath as NSIndexPath).section].searchResults[(indexPath as IndexPath).row]
    }
    
    func updateSharedPhotoCount() {
        shareTextLabel.textColor = themeColor
        shareTextLabel.text = "\(selectedPhotos.count) photos selected"
        shareTextLabel.sizeToFit()
    }
}

extension FlickrPhotosCollectionViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 1
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        textField.addSubview(activityIndicator)
        activityIndicator.frame = textField.bounds
        activityIndicator.startAnimating()
        
        flickr.searchFlickrForTerm(textField.text!) {
            results, error in
            
            
            activityIndicator.removeFromSuperview()
            
            
            if let error = error {
                // 2
                print("Error searching : \(error)")
                return
            }
            
            if let results = results {
                // 3
                print("Found \(results.searchResults.count) matching \(results.searchTerm)")
                self.searches.insert(results, at: 0)
                
                // 4
                self.collectionView?.reloadData()
            }
        }
        
        textField.text = nil
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UICollectionViewDataSource
extension FlickrPhotosCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return searches.count
    }
    

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return searches[section].searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        //1
        switch kind {
        //2
        case UICollectionElementKindSectionHeader:
            //3
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "FlickrPhotoHeaderView",
                                                                             for: indexPath) as! FlickrPhotoHeaderViewCollectionReusableView
            headerView.lblHeader.text = searches[(indexPath as NSIndexPath).section].searchTerm
            return headerView
        default:
            //4
            assert(false, "Unexpected element kind")
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusePhotoIdentifier,
                                                      for: indexPath) as! FlickrPhotoCell
       let flickrPhoto = searches[indexPath.section].searchResults[indexPath.row]
//        cell?.imageView.image = flickrPhoto.thumbnail
//        cell?.backgroundColor = UIColor.green
//        return cell!

//         Configure the cell

//        let flickrPhoto = photoForIndexPath(indexPath: indexPath)

          cell.activityIndicator.stopAnimating()

            guard indexPath == largePhotoIndexPath else {
                cell.imageView.image = flickrPhoto.thumbnail
                return cell
            }


            guard flickrPhoto.largeImage == nil else {
                cell.imageView.image = flickrPhoto.largeImage
                return cell
            }

            cell.imageView.image = flickrPhoto.thumbnail
            cell.activityIndicator.startAnimating()

            flickrPhoto.loadLargeImage { loadedFlickrPhoto, error in

                cell.activityIndicator.stopAnimating()

               guard loadedFlickrPhoto.largeImage != nil && error == nil else {
                    return
                }

                if let cell = collectionView.cellForItem(at: indexPath) as? FlickrPhotoCell,
                    indexPath == self.largePhotoIndexPath  {
                    cell.imageView.image = loadedFlickrPhoto.largeImage
                }
            }

            return cell
        }

    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
//        var sourceResults = searches[(sourceIndexPath as NSIndexPath).section].searchResults
//        let flickrPhoto = sourceResults.remove(at: (sourceIndexPath as NSIndexPath).row)
//
//        var destinationResults = searches[(destinationIndexPath as NSIndexPath).section].searchResults
//        destinationResults.insert(flickrPhoto, at: (destinationIndexPath as NSIndexPath).row)
        
        var sourceResults = searches[sourceIndexPath.section].searchResults
        let flickrPhoto = sourceResults.remove(at: sourceIndexPath.row)
        searches[sourceIndexPath.section].searchResults = sourceResults
        
        var destinationResults = searches[destinationIndexPath.section].searchResults
        destinationResults.insert(flickrPhoto, at: destinationIndexPath.row)
        searches[destinationIndexPath.section].searchResults = destinationResults
    }
    
    

}

// MARK: - UICollectionViewDelegate

extension FlickrPhotosCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        guard !sharing else {
            return true
        }
        
        largePhotoIndexPath = largePhotoIndexPath == indexPath ? nil : indexPath
        return false
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        guard sharing else {
            return
        }
        
        let photo = photoForIndexPath(indexPath: indexPath)
        selectedPhotos.append(photo)
        updateSharedPhotoCount()
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didDeselectItemAt indexPath: IndexPath) {
        
        guard sharing else {
            return
        }
        
        let photo = photoForIndexPath(indexPath: indexPath)
        
        if let index = selectedPhotos.index(of: photo) {
            selectedPhotos.remove(at: index)
            updateSharedPhotoCount()
        }
    }
}



//func collectionView(_ collectionView: UICollectionView,
//                    layout collectionViewLayout: UICollectionViewLayout,
//                    sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    if indexPath == largePhotoIndexPath {
//        let flickrPhoto = photoForIndexPath(indexPath: indexPath)
//        var size = collectionView.bounds.size
//        size.height -= additionalSafeAreaInsets.top
//        size.height -= (sectionInsets.top + sectionInsets.right)
//        size.width -= (sectionInsets.left + sectionInsets.right)
//        return flickrPhoto.sizeToFillWidthOfSize(size)
//    }
//
//
//    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//    let availableWidth = view.frame.width - paddingSpace
//    let widthPerItem = availableWidth / itemsPerRow
//
//    return CGSize(width: widthPerItem, height: widthPerItem)
//}
//
//
//func collectionView(_ collectionView: UICollectionView,
//                    layout collectionViewLayout: UICollectionViewLayout,
//                    insetForSectionAt section: Int) -> UIEdgeInsets {
//    return sectionInsets
//}
//
//func collectionView(_ collectionView: UICollectionView,
//                    layout collectionViewLayout:  UICollectionViewLayout,
//                    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    return sectionInsets.left
//}
//

extension FlickrPhotosCollectionViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // New code
        if indexPath == largePhotoIndexPath {
            let flickrPhoto = photoForIndexPath(indexPath: indexPath)
            var size = collectionView.bounds.size
            size.height -= additionalSafeAreaInsets.top
            size.height -= (sectionInsets.top + sectionInsets.right)
            size.width -= (sectionInsets.left + sectionInsets.right)
            return flickrPhoto.sizeToFillWidthOfSize(size)
        }
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

