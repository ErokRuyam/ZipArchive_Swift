//
//  ViewController.swift
//  ZipUnzip
//
//  Created by Mayur on 06/10/17.
//  Copyright © 2017 Mayur. All rights reserved.
//

import UIKit
import ZipArc

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Error: Document directory not found")
            return
        }
        let sharedFolderPath =  documentDirectory.appendingPathComponent("SharedFolder").path
        if !fileManager.fileExists(atPath: sharedFolderPath) {
            do {
                try fileManager.createDirectory(atPath: sharedFolderPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                NSLog("Couldn't create shared folder")
            }
        }
        NSLog("path for shared folder is \(sharedFolderPath)")
        let zipFilePath =  documentDirectory.appendingPathComponent("sharedFolderZipFile.zip").path
        
        ZipArchive.createZipFile(atPath: zipFilePath, withContentsOfDirectory: sharedFolderPath)
        NSLog("path for zip of shared folder is \(zipFilePath)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

