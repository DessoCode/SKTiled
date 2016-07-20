//
//  SKTilemap+Properties.swift
//  SKTiled
//
//  Created by Michael Fessenden on 6/22/16.
//  Copyright © 2016 Michael Fessenden. All rights reserved.
//

import SpriteKit


public extension SKTilemap {
    /**
     Parse properties from the Tiled tmx file.
     */
    public func parseProperties() {
        for (attr, value) in properties {
            
            if (attr == "name") {
                name = value
            }
            
            if (attr == "gridColor") {
                gridColor = SKColor.fromHexCode(value)
                allLayers().map({$0.gridColor = gridColor})
            }
            
            if (attr == "frameColor") {
                frameColor = SKColor.fromHexCode(value)
                allLayers().map({$0.frameColor = frameColor})
            }
            
            if (attr == "highlightColor") {
                highlightColor = SKColor.fromHexCode(value)
                allLayers().map({$0.highlightColor = highlightColor})
            }
            
            // set the initial world scale.
            if (attr == "worldScale") {
                worldScale = (doubleForKey(attr) != nil) ? CGFloat(doubleForKey(attr)!) : worldScale
            }
            
            if (attr == "allowZoom") {
                allowZoom = boolForKey(attr)
            }
            
            if (attr == "allowMovement") {
                allowMovement = boolForKey(attr)
            }
            
            if (attr == "zPosition") {
                zPosition = (doubleForKey(attr) != nil) ? CGFloat(doubleForKey(attr)!) : zPosition
            }
            
            // aspect scaling
            if (attr == "aspect") {
                yScale *= (doubleForKey(attr) != nil) ? CGFloat(doubleForKey(attr)!) : 1
            }
            
            if (attr == "lineWidth") {
                //lineWidth = (doubleForKey(attr) != nil) ? CGFloat(doubleForKey(attr)!) : lineWidth
            }
        }
    }
}


public extension SKTileset {
    /**
     Parse the tileset's properties value.
     */
    public func parseProperties() {}
}


public extension TiledLayerObject {
    
    /**
     Parse the nodes properties value.
     */
    public func parseProperties() {
        for (attr, value) in properties {
            
            if (attr == "zPosition") {
                guard let zpos = Double(value) else { return }
                zPosition = CGFloat(zpos)
            }
            
            if (attr == "color") {
                color = SKColor.fromHexCode(value)
            }
            
            if (attr == "hidden") {
                isHidden = boolForKey(attr)
            }
            
            if (attr == "visible") {
                visible = boolForKey(attr)
            }
        }
    }
    
    /**
     Returns a named property for the layer.
     
     - parameter name: `String` property name.
     
     - returns: `String?` the property value, or nil if it does not exist.
     */
    public func getValue(forProperty name: String) -> String? {
        return properties[name]
    }
    
    /**
     Add a property.
     
     - parameter name:  `String` property name.
     - parameter value: `String` property value.
     */
    public func setValue(_ value: String, forProperty name: String) {
        properties[name] = value
    }
}



public extension SKTileLayer {
    
    override public func parseProperties() {
        super.parseProperties()
    }
}


public extension SKObjectGroup {
    
    override public func parseProperties() {
        super.parseProperties()
        for (attr, value) in properties {
            if (attr == "lineWidth") {
                lineWidth = (doubleForKey(attr) != nil) ? CGFloat(doubleForKey(attr)!) : lineWidth
            }
        }
    }
}


public extension SKImageLayer {
    override public func parseProperties() {
        super.parseProperties()
    }
}


public extension SKTileObject {
    /**
     Parse the object's properties value.
     */
    public func parseProperties() {
        for (attr, value) in properties {
            if (attr == "color") {
                setColor(SKColor.fromHexCode(value))
            }
            
            if (attr == "lineWidth") {
                lineWidth = (doubleForKey(attr) != nil) ? CGFloat(doubleForKey(attr)!) : lineWidth
            }
        }
    }
}


public extension SKTilesetData {
    /**
     Parse the data's properties value.
     */
    public func parseProperties() {}
}