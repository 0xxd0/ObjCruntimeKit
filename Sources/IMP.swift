//
//  IMP.swift
//  Inspector
//
//

import ObjectiveC.objc
import ObjectiveC.runtime

final public class IMP: Inspectable<ObjectiveC.IMP>  {
    
    ///  Creates a pointer to a function that will call the block
    ///  when the method is called.
    ///
    /// - Parameter block: The block that implements this method. Its signature should
    ///     be: method_return_type ^(id self, method_args...).
    ///     The selector is not available as a parameter to this block.
    ///     The block is copied with \c Block_copy().
    /// - Note: The IMP that calls this block. Must be disposed of with
    ///     \c imp_removeBlock.
    @available(iOS 4.3, macOS 10.7, tvOS 9.0, watchOS 2.0, *)
    public convenience init(block: Block) {
        #if swift(>=4.0)
        let impl = imp_implementationWithBlock(block)
        #else
        let impl = imp_implementationWithBlock(block)!
        #endif
        self.init(impl)
    }
    
    /// Return the block associated with an IMP that was created using
    /// \c imp_implementationWithBlock.
    @available(iOS 4.3, macOS 10.7, tvOS 9.0, watchOS 2.0, *)
    public var block: Block? {
        return imp_getBlock(value)
    }
    
    /// Disassociates a block from an IMP that was created using
    /// \c imp_implementationWithBlock and releases the copy of the
    /// block that was created.
    ///
    /// - Returns: YES if the block was released successfully, NO otherwise.
    ///     (For example, the block might not have been used to create an IMP previously).
    @available(iOS 4.3, macOS 10.7, tvOS 9.0, watchOS 2.0, *)
    public func remove() -> Bool {
        return imp_removeBlock(value)
    }
}

extension IMP: CustomStringConvertible, CustomDebugStringConvertible {
}

