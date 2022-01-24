//
//  CellEnviarStorage.swift
//  newExamen
//
//  Created by A on 22/01/22.
//

import UIKit
import FirebaseStorage
import SwiftUI

class CellEnviarStorage: UITableViewCell {
    
    lazy var viewButton: UIView = {
        let item = UIView()
        item.backgroundColor = .systemBlue
        item.layer.cornerRadius = 25
        item.clipsToBounds = true
        item.isUserInteractionEnabled = true
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    lazy var imageButton: UIImageView = {
        let item = UIImageView()
        item.image = UIImage(systemName: "icloud.and.arrow.up.fill")
        item.tintColor = .white
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showPopUp(username: String, image: UIImage) {
        
            let alert = UIAlertController(title: "Atencion!", message: "Que quieres hacer?.", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "Deseas enviar a Storage?", style: .default) { _ in
                self.subirImagenFirebaseStorage(image: image, usernameImage: username)
            })
            
            alert.addAction(UIAlertAction(title: "Cancelar", style: .default) { _ in
           
            })

            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)

        


    }
    
    private func subirImagenFirebaseStorage(image: UIImage, usernameImage: String) {
        let ref = Storage.storage().reference().child("UploadExamen").child(usernameImage)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        if let subirDato = image.jpegData(compressionQuality: 0.05) {
            ref.putData(subirDato, metadata: metaData) { (metaData, error) in
                if error != nil {
                    print("No se pudo enviar la foto")
                } else {
                    ref.downloadURL(completion: { (url, error) in
                        
                        if error != nil {
                            print(error!)
                            return
                        }
                        
                        if url != nil { print("imagen Enviada") }
                    })
                }
                
            }
        }
    }

 
    func constraints() {
        self.contentView.addSubview(viewButton)
        viewButton.addSubview(imageButton)
        NSLayoutConstraint.activate([
            viewButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            viewButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15),
            viewButton.heightAnchor.constraint(equalToConstant: 50),
            viewButton.widthAnchor.constraint(equalToConstant: 50),
            viewButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15),
            
            imageButton.topAnchor.constraint(equalTo: viewButton.topAnchor, constant: 5),
            imageButton.leftAnchor.constraint(equalTo: viewButton.leftAnchor, constant: 5),
            imageButton.rightAnchor.constraint(equalTo: viewButton.rightAnchor, constant: -5),
            imageButton.bottomAnchor.constraint(equalTo: viewButton.bottomAnchor, constant: -5),

        ])

    }

    
}
