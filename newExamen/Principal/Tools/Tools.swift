//
//  Tools.swift
//  newExamen
//
//  Created by A on 22/01/22.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    
    func loadimagenUsandoCacheConURLString(urlString: String){

        self.image = nil
    
        //checar cache para la primer imagen
        
        if let cacheImagen = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
            self.image = cacheImagen
            return
            
        }
    
    let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                
                if error != nil {
                    print(error as Any)
                    return
                }
                
                
                
                DispatchQueue.main.async { // Correct

                    if let imageDescargada = UIImage(data: data){
                        imageCache.setObject(imageDescargada, forKey: urlString as AnyObject)
                        
                        self.image = imageDescargada

                    }
                }
            }
        }
        task.resume()
    
    
    }
    
}


extension UIViewController {
    func loader(message: String) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let loadingIndicador = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicador.hidesWhenStopped = true
        loadingIndicador.style = UIActivityIndicatorView.Style.large
        loadingIndicador.startAnimating()
        alert.view.addSubview(loadingIndicador)
        return alert
    }
    
    func pausarLoader(loader: UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
    
    func erroAlert(message: String) {
        let alert = UIAlertController(title: "Atencion", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)

        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }

        var color: UInt32 = 0
        scanner.scanHexInt32(&color)

        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0

        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }

    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return String(format:"#%06x", rgb)
    }
}
