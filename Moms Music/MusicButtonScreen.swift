//
//  MusicButtonScreen.swift
//  Moms Music
//
//  Created by Walter Chiwo on 12/24/22.
//  Copyright © 2022 Walter Chiwo. All rights reserved.
//

import UIKit
import MediaPlayer

class MusicButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerApplicationController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func genreBtnTap(_ sender: UIButton) {
        
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized
            {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
        
    }
    
    @IBAction func startBtn(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    func playGenre(genre: String){
        
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre , forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        
        musicPlayer.play()
        
        
        
        
        
    }
}
