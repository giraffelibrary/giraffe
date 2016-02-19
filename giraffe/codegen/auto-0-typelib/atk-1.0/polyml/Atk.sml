structure Atk : ATK =
  struct
    local
      open PolyMLFFI
    in
      val focusTrackerNotify_ = call (load_sym libatk "atk_focus_tracker_notify") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getDefaultRegistry_ = call (load_sym libatk "atk_get_default_registry") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getFocusObject_ = call (load_sym libatk "atk_get_focus_object") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getRoot_ = call (load_sym libatk "atk_get_root") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getToolkitName_ = call (load_sym libatk "atk_get_toolkit_name") (FFI.PolyML.VOID --> Utf8.PolyML.RETPTR)
      val getToolkitVersion_ = call (load_sym libatk "atk_get_toolkit_version") (FFI.PolyML.VOID --> Utf8.PolyML.RETPTR)
      val getVersion_ = call (load_sym libatk "atk_get_version") (FFI.PolyML.VOID --> Utf8.PolyML.RETPTR)
      val relationTypeForName_ = call (load_sym libatk "atk_relation_type_for_name") (Utf8.PolyML.INPTR --> AtkRelationType.PolyML.VAL)
      val relationTypeGetName_ = call (load_sym libatk "atk_relation_type_get_name") (AtkRelationType.PolyML.VAL --> Utf8.PolyML.RETPTR)
      val relationTypeRegister_ = call (load_sym libatk "atk_relation_type_register") (Utf8.PolyML.INPTR --> AtkRelationType.PolyML.VAL)
      val removeFocusTracker_ = call (load_sym libatk "atk_remove_focus_tracker") (FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val removeGlobalEventListener_ = call (load_sym libatk "atk_remove_global_event_listener") (FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val removeKeyEventListener_ = call (load_sym libatk "atk_remove_key_event_listener") (FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val roleForName_ = call (load_sym libatk "atk_role_for_name") (Utf8.PolyML.INPTR --> AtkRole.PolyML.VAL)
      val roleGetLocalizedName_ = call (load_sym libatk "atk_role_get_localized_name") (AtkRole.PolyML.VAL --> Utf8.PolyML.RETPTR)
      val roleGetName_ = call (load_sym libatk "atk_role_get_name") (AtkRole.PolyML.VAL --> Utf8.PolyML.RETPTR)
      val roleRegister_ = call (load_sym libatk "atk_role_register") (Utf8.PolyML.INPTR --> AtkRole.PolyML.VAL)
      val stateTypeForName_ = call (load_sym libatk "atk_state_type_for_name") (Utf8.PolyML.INPTR --> AtkStateType.PolyML.VAL)
      val stateTypeGetName_ = call (load_sym libatk "atk_state_type_get_name") (AtkStateType.PolyML.VAL --> Utf8.PolyML.RETPTR)
      val stateTypeRegister_ = call (load_sym libatk "atk_state_type_register") (Utf8.PolyML.INPTR --> AtkStateType.PolyML.VAL)
      val textAttributeForName_ = call (load_sym libatk "atk_text_attribute_for_name") (Utf8.PolyML.INPTR --> AtkTextAttribute.PolyML.VAL)
      val textAttributeGetName_ = call (load_sym libatk "atk_text_attribute_get_name") (AtkTextAttribute.PolyML.VAL --> Utf8.PolyML.RETPTR)
      val textAttributeGetValue_ = call (load_sym libatk "atk_text_attribute_get_value") (AtkTextAttribute.PolyML.VAL &&> FFI.Int32.PolyML.VAL --> Utf8.PolyML.RETPTR)
      val textAttributeRegister_ = call (load_sym libatk "atk_text_attribute_register") (Utf8.PolyML.INPTR --> AtkTextAttribute.PolyML.VAL)
      val textFreeRanges_ = call (load_sym libatk "atk_text_free_ranges") (AtkTextRangeRecord.PolyML.PTR --> FFI.PolyML.VOID)
    end
    structure ActionClass = AtkActionClass
    structure ComponentClass = AtkComponentClass
    structure CoordType = AtkCoordType
    structure DocumentClass = AtkDocumentClass
    structure EditableTextClass = AtkEditableTextClass
    structure HyperlinkClass = AtkHyperlinkClass
    structure HyperlinkImplClass = AtkHyperlinkImplClass
    structure HyperlinkStateFlags = AtkHyperlinkStateFlags
    structure HypertextClass = AtkHypertextClass
    structure ImageClass = AtkImageClass
    structure ImplementorIfaceClass = AtkImplementorIfaceClass
    structure KeyEventType = AtkKeyEventType
    structure Layer = AtkLayer
    structure MiscClass = AtkMiscClass
    structure ObjectClass = AtkObjectClass
    structure ObjectFactoryClass = AtkObjectFactoryClass
    structure RegistryClass = AtkRegistryClass
    structure RelationClass = AtkRelationClass
    structure RelationSetClass = AtkRelationSetClass
    structure RelationType = AtkRelationType
    structure Role = AtkRole
    structure SelectionClass = AtkSelectionClass
    structure StateSetClass = AtkStateSetClass
    structure StateType = AtkStateType
    structure StreamableContentClass = AtkStreamableContentClass
    structure TableClass = AtkTableClass
    structure TextClass = AtkTextClass
    structure TextAttribute = AtkTextAttribute
    structure TextBoundary = AtkTextBoundary
    structure TextClipType = AtkTextClipType
    structure UtilClass = AtkUtilClass
    structure ValueClass = AtkValueClass
    structure WindowClass = AtkWindowClass
    structure Action = AtkAction
    structure Document = AtkDocument
    structure EditableText = AtkEditableText
    structure GObjectAccessibleClass = AtkGObjectAccessibleClass
    structure Hyperlink = AtkHyperlink
    structure HyperlinkImpl = AtkHyperlinkImpl
    structure Hypertext = AtkHypertext
    structure Image = AtkImage
    structure ImplementorIface = AtkImplementorIface
    structure Misc = AtkMisc
    structure NoOpObjectClass = AtkNoOpObjectClass
    structure NoOpObjectFactoryClass = AtkNoOpObjectFactoryClass
    structure Object = AtkObject
    structure ObjectFactory = AtkObjectFactory
    structure PlugClass = AtkPlugClass
    structure Registry = AtkRegistry
    structure Relation = AtkRelation
    structure RelationSet = AtkRelationSet
    structure Selection = AtkSelection
    structure SocketClass = AtkSocketClass
    structure StateSet = AtkStateSet
    structure StreamableContent = AtkStreamableContent
    structure Table = AtkTable
    structure Util = AtkUtil
    structure Value = AtkValue
    structure Window = AtkWindow
    structure GObjectAccessible = AtkGObjectAccessible
    structure NoOpObject = AtkNoOpObject
    structure NoOpObjectFactory = AtkNoOpObjectFactory
    structure Plug = AtkPlug
    structure Socket = AtkSocket
    fun focusTrackerNotify object = (GObjectObjectClass.C.withPtr ---> I) focusTrackerNotify_ object
    fun getDefaultRegistry () = (I ---> AtkRegistryClass.C.fromPtr true) getDefaultRegistry_ ()
    fun getFocusObject () = (I ---> AtkObjectClass.C.fromPtr false) getFocusObject_ ()
    fun getRoot () = (I ---> AtkObjectClass.C.fromPtr false) getRoot_ ()
    fun getToolkitName () = (I ---> Utf8.C.fromPtr false) getToolkitName_ ()
    fun getToolkitVersion () = (I ---> Utf8.C.fromPtr false) getToolkitVersion_ ()
    fun getVersion () = (I ---> Utf8.C.fromPtr false) getVersion_ ()
    fun relationTypeForName name = (Utf8.C.withPtr ---> AtkRelationType.C.fromVal) relationTypeForName_ name
    fun relationTypeGetName type' = (AtkRelationType.C.withVal ---> Utf8.C.fromPtr false) relationTypeGetName_ type'
    fun relationTypeRegister name = (Utf8.C.withPtr ---> AtkRelationType.C.fromVal) relationTypeRegister_ name
    fun removeFocusTracker trackerId = (FFI.UInt32.C.withVal ---> I) removeFocusTracker_ trackerId
    fun removeGlobalEventListener listenerId = (FFI.UInt32.C.withVal ---> I) removeGlobalEventListener_ listenerId
    fun removeKeyEventListener listenerId = (FFI.UInt32.C.withVal ---> I) removeKeyEventListener_ listenerId
    fun roleForName name = (Utf8.C.withPtr ---> AtkRole.C.fromVal) roleForName_ name
    fun roleGetLocalizedName role = (AtkRole.C.withVal ---> Utf8.C.fromPtr false) roleGetLocalizedName_ role
    fun roleGetName role = (AtkRole.C.withVal ---> Utf8.C.fromPtr false) roleGetName_ role
    fun roleRegister name = (Utf8.C.withPtr ---> AtkRole.C.fromVal) roleRegister_ name
    fun stateTypeForName name = (Utf8.C.withPtr ---> AtkStateType.C.fromVal) stateTypeForName_ name
    fun stateTypeGetName type' = (AtkStateType.C.withVal ---> Utf8.C.fromPtr false) stateTypeGetName_ type'
    fun stateTypeRegister name = (Utf8.C.withPtr ---> AtkStateType.C.fromVal) stateTypeRegister_ name
    fun textAttributeForName name = (Utf8.C.withPtr ---> AtkTextAttribute.C.fromVal) textAttributeForName_ name
    fun textAttributeGetName attr = (AtkTextAttribute.C.withVal ---> Utf8.C.fromPtr false) textAttributeGetName_ attr
    fun textAttributeGetValue attr index = (AtkTextAttribute.C.withVal &&&> FFI.Int32.C.withVal ---> Utf8.C.fromPtr false) textAttributeGetValue_ (attr & index)
    fun textAttributeRegister name = (Utf8.C.withPtr ---> AtkTextAttribute.C.fromVal) textAttributeRegister_ name
    fun textFreeRanges ranges = (AtkTextRangeRecord.C.withPtr ---> I) textFreeRanges_ ranges
  end
