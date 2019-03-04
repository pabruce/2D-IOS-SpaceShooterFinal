//
//  ExplosionPlayer.swift
//  Space Shooter
//
//  Created by pbruce on 2/26/18.
//  Copyright © 2018 pbruce. All rights reserved.
//

import Foundation
import AVFoundation

class ExplosionPlayer {
    var avPlayer = AVAudioPlayer()
    
    func playSound(){
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "Expl1", ofType: "caf")!)
        
        do {
            avPlayer = try AVAudioPlayer(contentsOf: url)
            avPlayer.volume = 1.0
            avPlayer.prepareToPlay()
            avPlayer.play()
        }
        catch _ {
            
        }
    }
    
}
