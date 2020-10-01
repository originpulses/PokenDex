//
//  IdentifyViewController.swift
//  PokenDex
//
//  Created by Sabih on 1/10/20.
//  Copyright © 2020 RMIT. All rights reserved.
//

import UIKit
import CoreML
import Vision

class IdentifyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var percentage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let userPickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
        
            guard let ciImage = CIImage(image: userPickedImage) else {
                fatalError("cannot get image data")
            }
            
            detect(image: ciImage)
            imageView.image = userPickedImage
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func detect(image: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: PokemonImageClassifier().model) else {
    
            fatalError("cannot import model")
        }
        
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            let classification = request.results?.first as? VNClassificationObservation
            
            self.pokemonName.text = classification?.identifier
            self.percentage.text = String(format: "%.2f", ((classification!.confidence)*100)) + " %"
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        }
        catch { print(error) }
        
    }
    
    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
}
