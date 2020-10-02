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
    @IBOutlet weak var probabilityLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    var identified = [String]()
    var id: Int = 0
    let service = PokendexService()
    var pokemonDetails: PokemonDetail?
    var pokemonsViewModel = PokemonsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        self.infoButton.isHidden = true
        self.imageView.isHidden = true
        self.probabilityLabel.isHidden = true
        self.percentage.isHidden = true
        
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
            self.identified.append((classification?.identifier.lowercased())!)
            
            self.infoButton.isHidden = false
            self.imageView.isHidden = false
            self.probabilityLabel.isHidden = false
            self.percentage.isHidden = false
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        }
        catch { print(error) }
        
    }
    
    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        identified.removeAll()
        pokemonName.text = "Capture Image To Start"
        self.infoButton.isHidden = true
        self.imageView.isHidden = true
        self.probabilityLabel.isHidden = true
        self.percentage.isHidden = true
        present(imagePicker, animated: true, completion: nil)
    }
    

    @IBAction func infoButtonPressed(_ sender: UIButton) {
        
        let url = "https://pokeapi.co/api/v2/pokemon/"
        // Machine Learning data only produces name so we use name to bring out the ID from PokeAPI.
        service.get(url: url + identified[0]) { result in
            switch result {
            case .success(let data):
                if data != nil {
                    do {
                        let results = try JSONDecoder().decode(PokemonDetail.self, from: data!)
                        self.pokemonDetails = results
                        self.id = results.id!
                        self.performSegue(withIdentifier: "identifyToDetail", sender: self)
                    } catch( _) {
                        self.showAlert(title: "Error", message: "Not return any pokemon")
                    }
                    
                } else {
                    self.showAlert(title: "Error", message: "Not return any pokemon")
                }
            case .failure(let error):
                self.showAlert(title: "Error", message: "Error - \n\(error)")
                print(error.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "identifyToDetail") {
            let pokeVC = segue.destination as! PokemonViewController
            pokeVC.id = id
        }
    }
    
}
