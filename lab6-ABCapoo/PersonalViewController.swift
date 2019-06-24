//
//  PersonalViewController.swift
//  lab6-ABCapoo
//
//  Created by 陳嬿晴 on 2019/6/25.
//  Copyright © 2019 陳嬿晴. All rights reserved.
//

import UIKit

class PersonalViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var photoImageButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    var setImage = false
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        photoImageButton.setBackgroundImage(image, for: .normal)
        photoImageButton.setTitle(" ", for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func selectPhoto(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.allowsEditing = true
        controller.delegate = self
        present(controller, animated: true, completion: nil)
        setImage = true
    }
}
