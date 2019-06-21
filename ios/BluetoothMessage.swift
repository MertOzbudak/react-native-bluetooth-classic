//
//  BluetoothMessage.swift
//  RNBluetoothClassic
//
//  Created by Ken Davidson on 2019-06-20.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation

/**
 Provides standard object for messaging using the React bridge.  Generic classes
 cannot be used or exported with @objc therefore we need the asDictionary function
 in order to control conversion.
 
 This has been tested with <String> but will
 probably need some love in order to get other objects working based on the
 implementation.  If anything changes, it will most likely be the building
 of the dictionary to appropriately convert the data object into a String
 (or other basic React Bridge serializable object)
 */
class BluetoothMessage<T> : NSObject {
    
    public private(set) var device:BluetoothDevice
    public private(set) var data:T
    public private(set) var timestamp:Date
    
    init(_ data:T, fromDevice:BluetoothDevice) {
        self.device = fromDevice
        self.data = data
        self.timestamp = Date()
    }
    
    func asDictionary() -> Dictionary<String,Any> {
        return [
            "device": device.asDictionary(),
            "data": data,
            "timestamp": timestamp
        ]
    }
}
