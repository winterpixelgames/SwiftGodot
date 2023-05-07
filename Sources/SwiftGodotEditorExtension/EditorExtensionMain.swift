//
//  EditorExtensionMain.swift
//  
//
//  Created by Miguel de Icaza on 4/7/23.
//

import Foundation
import SwiftGodot


extension PackedStringArray {
    convenience init (_ values: [String]) {
        self.init ()
        for x in values {
            append(value: x)
        }
    }
}

class SwiftScript: RefCounted {
    public required init () {
        super.init ()
    }
    
    required init(nativeHandle: UnsafeRawPointer) {
        fatalError("init(nativeHandle:) has not been implemented")
    }
}
class SwiftLanguageIntegration: ScriptLanguageExtension {
    func pm (_ data: String = "", functionName: String = #function) {
        print ("SwiftLanguageIntegration, default: \(functionName) (data)")
    }
    
    open override func _getName ()-> String {
        return "Swift Language Integration"
    }
    
    open override func _init () {
        print ("SwiftLanguageIntegration called")
        // TODO: could define useful things here
    }
    
    open override func _getType ()-> String {
        return "SwiftScript"
    }
    
    open override func _getExtension ()-> String {
        return "swift"
    }
    
    open override func _finish () {
        pm()
    }
    
    open override func _getReservedWords ()-> PackedStringArray {
        return PackedStringArray (["class", "func", "struct", "var"])
    }
    
    open override func _isControlFlowKeyword (keyword: String)-> Bool {
        switch keyword.description {
        case "if", "break", "continue", "while", "repeat", "throw", "try",
            "return":
            return true
        default:
            return false
        }
    }
    
    open override func _getCommentDelimiters ()-> PackedStringArray {
        return PackedStringArray (["//", "/*"])
    }
    
    open override func _getStringDelimiters ()-> PackedStringArray {
        return PackedStringArray (["\" \"", "@\" \""])
    }
    
    open override func _makeTemplate (template: String, className: String, baseClassName: String)-> Script {
        let s = Script ()
        s.sourceCode = "Here we should put the template for \(template.description)"
        return s
    }
    
    open override func _getBuiltInTemplates (object: StringName)-> VariantCollection<Dictionary> {
        pm()
        return VariantCollection<Dictionary>()
    }
    
    open override func _isUsingTemplates ()-> Bool {
        return true
    }
    
    open override func _validate (script: String, path: String, validateFunctions: Bool, validateErrors: Bool, validateWarnings: Bool, validateSafeLines: Bool)-> Dictionary {
        pm ();
        return Dictionary ()
    }
    
    open override func _validatePath (path: String)-> String {
        pm()
        return ""
    }
    
    open override func _createScript ()-> Object {
        return SwiftScript ()
    }
    
    open override func _hasNamedClasses ()-> Bool {
        pm("-> true")
        return true
    }
    
    open override func _supportsBuiltinMode ()-> Bool {
        pm("-> true")
        return true
    }
    
    open override func _supportsDocumentation ()-> Bool {
        pm()
        return false
    }
    
    open override func _canInheritFromFile ()-> Bool {
        pm()
        return false
    }
    
    open override func _findFunction (className: String, functionName: String)-> Int32 {
        pm()
        return 0
    }
    
    open override func _makeFunction (className: String, functionName: String, functionArgs: PackedStringArray)-> String {
        pm()
        return ""
    }
    
    open override func _openInExternalEditor (script: Script, line: Int32, column: Int32)-> GodotError {
        pm()
        return .ok
    }
    
    open override func _overridesExternalEditor ()-> Bool {
        pm()
        return false
    }
    
    open override func _completeCode (code: String, path: String, owner: Object)-> Dictionary {
        pm()
        return Dictionary ()
    }
    
    open override func _lookupCode (code: String, symbol: String, path: String, owner: Object)-> Dictionary {
        pm()
        return Dictionary ()
    }
    
    open override func _autoIndentCode (code: String, fromLine: Int32, toLine: Int32)-> String {
        pm()
        return ""
    }
    
    open override func _addGlobalConstant (name: StringName, value: Variant) {
        pm()
    }
    
    open override func _addNamedGlobalConstant (name: StringName, value: Variant) {
        pm()
    }
    
    open override func _removeNamedGlobalConstant (name: StringName) {
        pm()
    }
    
    open override func _threadEnter () {
        pm()
    }
    
    open override func _threadExit () {
        pm()
    }
    
    open override func _debugGetError ()-> String {
        pm()
        return ""
    }
    
    open override func _debugGetStackLevelCount ()-> Int32 {
        pm()
        return 0
    }
    
    open override func _debugGetStackLevelLine (level: Int32)-> Int32 {
        pm()
        return 0
    }
    
    open override func _debugGetStackLevelFunction (level: Int32)-> String {
        pm()
        return ""
    }
    
    open override func _debugGetStackLevelLocals (level: Int32, maxSubitems: Int32, maxDepth: Int32)-> Dictionary {
        pm()
        return Dictionary ()
    }
    
    open override func _debugGetStackLevelMembers (level: Int32, maxSubitems: Int32, maxDepth: Int32)-> Dictionary {
        pm()
        return Dictionary ()
    }
    
    open override func _debugGetGlobals (maxSubitems: Int32, maxDepth: Int32)-> Dictionary {
        pm()
        return Dictionary ()
    }
    
    open override func _debugParseStackLevelExpression (level: Int32, expression: String, maxSubitems: Int32, maxDepth: Int32)-> String {
        pm()
        return ""
    }
    
    open override func _debugGetCurrentStackInfo ()-> VariantCollection<Dictionary> {
        pm()
        return VariantCollection<Dictionary>()
    }
    
    open override func _reloadAllScripts () {
        pm()
    }
    
    open override func _reloadToolScript (script: Script, softReload: Bool) {
        pm()
    }
    
    open override func _getRecognizedExtensions ()-> PackedStringArray {
        pm()
        let r = PackedStringArray ()
        r.append(value: "swift")
        return r
    }
    
    open override func _getPublicFunctions ()-> VariantCollection<Dictionary> {
        pm()
        return VariantCollection<Dictionary>()
    }
    
    open override func _getPublicConstants ()-> Dictionary {
        pm()
        return Dictionary ()
    }
    
    open override func _getPublicAnnotations ()-> VariantCollection<Dictionary> {
        pm()
        return VariantCollection<Dictionary>()
    }
    
    open override func _profilingStart () {
        pm()
    }
    
    open override func _profilingStop () {
        pm()
    }
    
    open override func _frame () {
        //pm()
    }
    
    open override func _handlesGlobalClassType (type: String)-> Bool {
        pm("Type=\(type)")
        return false
    }
    
    open override func _getGlobalClassName (path: String)-> Dictionary {
        pm()
        return Dictionary ()
    }
}

func setupScene (level: GDExtension.InitializationLevel) {
    if level == .editor {
        var e: Engine = Engine.shared
        register(type: SwiftLanguageIntegration.self)
        var language = SwiftLanguageIntegration()
        
        e.registerScriptLanguage(language: language)
    }
}
@_cdecl ("swift_godot_editor_exension_main")
public func swift_entry_point(
    interfacePtr: OpaquePointer?,
    libraryPtr: OpaquePointer?,
    extensionPtr: OpaquePointer?) -> UInt8
{
    print ("SwiftGodotEditorExtension: Starting up")
    guard let interfacePtr, let libraryPtr, let extensionPtr else {
        return 0
    }
    
    initializeSwiftModule(interfacePtr, libraryPtr, extensionPtr, initHook: setupScene, deInitHook: { x in })
    return 1
}
