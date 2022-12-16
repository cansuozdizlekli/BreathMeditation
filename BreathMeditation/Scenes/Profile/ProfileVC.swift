//
//  ProfileVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/16/22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import Photos
import PhotosUI


class ProfileVC: UIViewController , PHPickerViewControllerDelegate  {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    private let storage = Storage.storage().reference()
    
    private let logoutButton: UIButton = {
        let button = UIButton(frame: CGRect(x: screenWidth - 65, y: 75, width: 50, height: 50))
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, reqAlpha: 0.2)
        button.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right",withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)), for: UIControl.State.normal)
        button.tintColor = .primaryWhite
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.4
        button.layer.cornerRadius = 25
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        let islandRef = Storage.storage().reference().child("\(Auth.auth().currentUser?.uid ?? "").png")

        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
            // Uh-oh, an error occurred!
          } else {
            // Data for "images/island.jpg" is returned
              self.profileImageView.image = UIImage(data: data!)
          }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    private func setUpUI(){
        view.addSubview(logoutButton)
        logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        profileImageView.layer.cornerRadius = 12
        
    }
    
    @objc func logout(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            UserDefaults.standard.removeObject(forKey: "isFirstTime")
            SceneDelegate.window?.rootViewController = FirstVC()
            //        self.presentVC(to: FirstVC())
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
        
    }
    
    @IBAction func changeImageButtonTapped(_ sender: Any) {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 1
        config.filter = .images
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
        
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        
        picker.dismiss(animated: true, completion: .none)
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
                guard let image = reading as? UIImage, error == nil else { return }
                DispatchQueue.main.async {
                    self.profileImageView.image = image
                    self.uploadMedia { url in
                        
                    }
                }
                result.itemProvider.loadFileRepresentation(forTypeIdentifier: "public.image") { [weak self] url, _ in
                }
            }
        }
        
        
    }
    
    func uploadMedia(completion: @escaping (_ url: String?) -> Void) {
        
        let storageRef = Storage.storage().reference().child("\(Auth.auth().currentUser?.uid ?? "").png")
        if let uploadData = self.profileImageView.image?.jpegData(compressionQuality: 0.5) {
            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                if error != nil {
                    print("error", String(describing: error))
                    completion(nil)
                } else {
                    var metaData = StorageMetadata()
                    metaData.contentType = "\(String(describing: Auth.auth().currentUser?.uid))"
                    
                    storageRef.updateMetadata(metaData) { metadata, error in
                        if error != nil {
                            // Uh-oh, an error occurred!
                        } else {
                            // Updated metadata for 'images/forest.jpg' is returned
                        }
                        
                        
                        storageRef.downloadURL(completion: { (url, error) in
                            print(url?.absoluteString)
                            completion(url?.absoluteString)
                        })
                        
                        //  completion((metadata?.downloadURL()?.absoluteString)!))
                        // your uploaded photo url.
                        
                        
                    }
                }
            }
        }
        
        func downloadImages(success:@escaping (_ image:UIImage)->(),failure:@escaping (_ error:Error)->()){
            
            // Create a reference with an initial file path and name
            let reference = Storage.storage().reference().child("\(Auth.auth().currentUser?.uid ?? "").png")
            reference.getData(maxSize: (1 * 1024 * 1024)) { (data, error) in
                if let _error = error{
                    print(_error)
                    failure(_error)
                } else {
                    if let _data  = data {
                        let myImage:UIImage! = UIImage(data: _data)
                        success(myImage)
                    }
                }
                
            }
        }
        
        
        
    }
}
