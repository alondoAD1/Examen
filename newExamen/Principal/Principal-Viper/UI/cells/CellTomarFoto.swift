//
//  CellTomarFoto.swift
//  newExamen
//
//  Created by A on 22/01/22.
//

import UIKit

class CellTomarFoto: UITableViewCell, UINavigationControllerDelegate {
        
    var ui = CellTomarFotoUI()
    var selecImagePicker: UIImage?
    var username: String?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showPopUp(username: String) {
        self.username = username
        let alert = UIAlertController(title: "Atencion!", message: "Que quieres hacer?.", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Tomar foto", style: .default) { _ in
            self.openCamara()
        })
        
        alert.addAction(UIAlertAction(title: "Seleccionar foto", style: .default) { _ in
            self.openGallary()
        })

        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)

    }
    
    func openCamara() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            UIApplication.shared.keyWindow?.rootViewController?.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "No tienes camara o esta fallando", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }

    }

    func openGallary() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        picker.allowsEditing = false
        UIApplication.shared.keyWindow?.rootViewController?.present(picker, animated: true, completion: nil)
    }

    
 
    func constraints() {
        self.contentView.addSubview(ui.imageViewTomarSelfie)
        self.contentView.addSubview(ui.button)
        NSLayoutConstraint.activate([
            ui.imageViewTomarSelfie.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            ui.imageViewTomarSelfie.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15),
            ui.imageViewTomarSelfie.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15),
            ui.imageViewTomarSelfie.heightAnchor.constraint(equalToConstant: 280),
            
            ui.button.topAnchor.constraint(equalTo: ui.imageViewTomarSelfie.bottomAnchor, constant: 10),
            ui.button.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            ui.button.heightAnchor.constraint(equalToConstant: 40),
            ui.button.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),

        ])

    }
    

}

extension CellTomarFoto: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        

        if let editimage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            selecImagePicker = editimage
            
        } else if let originalimagen = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selecImagePicker = originalimagen
            
        }
        
        if let imagenseleccionada = selecImagePicker {
            DispatchQueue.main.async {
                self.ui.imageViewTomarSelfie.image = imagenseleccionada
            }

        }

        picker.dismiss(animated: true, completion: nil)

        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Click en el boton cancelar")
        picker.dismiss(animated: true, completion: nil)

    }
    
    
}
