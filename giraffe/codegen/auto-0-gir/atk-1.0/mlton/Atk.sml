structure Atk : ATK =
  struct
    val focusTrackerNotify_ = _import "atk_focus_tracker_notify" : AtkObjectClass.C.notnull AtkObjectClass.C.p -> unit;
    val getDefaultRegistry_ = _import "atk_get_default_registry" : unit -> AtkRegistryClass.C.notnull AtkRegistryClass.C.p;
    val getFocusObject_ = _import "atk_get_focus_object" : unit -> AtkObjectClass.C.notnull AtkObjectClass.C.p;
    val getRoot_ = _import "atk_get_root" : unit -> AtkObjectClass.C.notnull AtkObjectClass.C.p;
    val getToolkitName_ = _import "atk_get_toolkit_name" : unit -> Utf8.C.notnull Utf8.C.out_p;
    val getToolkitVersion_ = _import "atk_get_toolkit_version" : unit -> Utf8.C.notnull Utf8.C.out_p;
    val getVersion_ = _import "atk_get_version" : unit -> Utf8.C.notnull Utf8.C.out_p;
    val relationTypeForName_ = _import "mlton_atk_relation_type_for_name" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> AtkRelationType.C.val_;
    val relationTypeGetName_ = _import "atk_relation_type_get_name" : AtkRelationType.C.val_ -> Utf8.C.notnull Utf8.C.out_p;
    val relationTypeRegister_ = _import "mlton_atk_relation_type_register" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> AtkRelationType.C.val_;
    val removeFocusTracker_ = _import "atk_remove_focus_tracker" : FFI.UInt.C.val_ -> unit;
    val removeGlobalEventListener_ = _import "atk_remove_global_event_listener" : FFI.UInt.C.val_ -> unit;
    val removeKeyEventListener_ = _import "atk_remove_key_event_listener" : FFI.UInt.C.val_ -> unit;
    val roleForName_ = _import "mlton_atk_role_for_name" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> AtkRole.C.val_;
    val roleGetLocalizedName_ = _import "atk_role_get_localized_name" : AtkRole.C.val_ -> Utf8.C.notnull Utf8.C.out_p;
    val roleGetName_ = _import "atk_role_get_name" : AtkRole.C.val_ -> Utf8.C.notnull Utf8.C.out_p;
    val roleRegister_ = _import "mlton_atk_role_register" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> AtkRole.C.val_;
    val stateTypeForName_ = _import "mlton_atk_state_type_for_name" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> AtkStateType.C.val_;
    val stateTypeGetName_ = _import "atk_state_type_get_name" : AtkStateType.C.val_ -> Utf8.C.notnull Utf8.C.out_p;
    val stateTypeRegister_ = _import "mlton_atk_state_type_register" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> AtkStateType.C.val_;
    val textAttributeForName_ = _import "mlton_atk_text_attribute_for_name" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> AtkTextAttribute.C.val_;
    val textAttributeGetName_ = _import "atk_text_attribute_get_name" : AtkTextAttribute.C.val_ -> Utf8.C.notnull Utf8.C.out_p;
    val textAttributeGetValue_ = fn x1 & x2 => (_import "atk_text_attribute_get_value" : AtkTextAttribute.C.val_ * FFI.Int.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val textAttributeRegister_ = _import "mlton_atk_text_attribute_register" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> AtkTextAttribute.C.val_;
    val textFreeRanges_ = _import "atk_text_free_ranges" : AtkTextRangeRecord.C.notnull AtkTextRangeRecord.C.p -> unit;
    structure State = AtkState
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
    fun focusTrackerNotify object = (AtkObjectClass.C.withPtr ---> I) focusTrackerNotify_ object
    fun getDefaultRegistry () = (I ---> AtkRegistryClass.C.fromPtr true) getDefaultRegistry_ ()
    fun getFocusObject () = (I ---> AtkObjectClass.C.fromPtr false) getFocusObject_ ()
    fun getRoot () = (I ---> AtkObjectClass.C.fromPtr false) getRoot_ ()
    fun getToolkitName () = (I ---> Utf8.C.fromPtr false) getToolkitName_ ()
    fun getToolkitVersion () = (I ---> Utf8.C.fromPtr false) getToolkitVersion_ ()
    fun getVersion () = (I ---> Utf8.C.fromPtr false) getVersion_ ()
    fun relationTypeForName name = (Utf8.C.withPtr ---> AtkRelationType.C.fromVal) relationTypeForName_ name
    fun relationTypeGetName type' = (AtkRelationType.C.withVal ---> Utf8.C.fromPtr false) relationTypeGetName_ type'
    fun relationTypeRegister name = (Utf8.C.withPtr ---> AtkRelationType.C.fromVal) relationTypeRegister_ name
    fun removeFocusTracker trackerId = (FFI.UInt.C.withVal ---> I) removeFocusTracker_ trackerId
    fun removeGlobalEventListener listenerId = (FFI.UInt.C.withVal ---> I) removeGlobalEventListener_ listenerId
    fun removeKeyEventListener listenerId = (FFI.UInt.C.withVal ---> I) removeKeyEventListener_ listenerId
    fun roleForName name = (Utf8.C.withPtr ---> AtkRole.C.fromVal) roleForName_ name
    fun roleGetLocalizedName role = (AtkRole.C.withVal ---> Utf8.C.fromPtr false) roleGetLocalizedName_ role
    fun roleGetName role = (AtkRole.C.withVal ---> Utf8.C.fromPtr false) roleGetName_ role
    fun roleRegister name = (Utf8.C.withPtr ---> AtkRole.C.fromVal) roleRegister_ name
    fun stateTypeForName name = (Utf8.C.withPtr ---> AtkStateType.C.fromVal) stateTypeForName_ name
    fun stateTypeGetName type' = (AtkStateType.C.withVal ---> Utf8.C.fromPtr false) stateTypeGetName_ type'
    fun stateTypeRegister name = (Utf8.C.withPtr ---> AtkStateType.C.fromVal) stateTypeRegister_ name
    fun textAttributeForName name = (Utf8.C.withPtr ---> AtkTextAttribute.C.fromVal) textAttributeForName_ name
    fun textAttributeGetName attr = (AtkTextAttribute.C.withVal ---> Utf8.C.fromPtr false) textAttributeGetName_ attr
    fun textAttributeGetValue attr index = (AtkTextAttribute.C.withVal &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr false) textAttributeGetValue_ (attr & index)
    fun textAttributeRegister name = (Utf8.C.withPtr ---> AtkTextAttribute.C.fromVal) textAttributeRegister_ name
    fun textFreeRanges ranges = (AtkTextRangeRecord.C.withPtr ---> I) textFreeRanges_ ranges
  end
