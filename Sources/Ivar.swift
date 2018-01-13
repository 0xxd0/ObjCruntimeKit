//
//  Ivar.swift
//  Inspector
//
//

import ObjectiveC.runtime

/// An class type that represents an instance variable.
final public class Ivar: Inspectable<ObjectiveC.Ivar> {
    
    /// Returns the name of an instance variable.
    public lazy var name: String? = {
        let name = ivar_getName(self.value)
        return name != nil ? String(cString: name!) : nil
    }()
    
    /// Returns the offset of an instance variable.
    public lazy var offset: Int = {
        return ivar_getOffset(self.value)
    }()
    
    /// Returns the type string of an instance variable.
    public lazy var typeEncoding: String? = {
        let encode = ivar_getTypeEncoding(self.value)
        return encode != nil ? String(cString: encode!) : nil
    }()
}

extension Ivar: CustomStringConvertible {
    
    public var description: String {
        return """
            Ivar: \(String(describing: name))
            Encoding: \(String(describing: typeEncoding))
            Offset: \(offset)
            """
    }
}

extension Ivar: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return description
    }
}


