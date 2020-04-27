structure Atk : ATK =
  struct
    val focusTrackerNotify_ = _import "atk_focus_tracker_notify" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> unit;
    val getBinaryAge_ = _import "atk_get_binary_age" : unit -> GUInt32.FFI.val_;
    val getDefaultRegistry_ = _import "atk_get_default_registry" : unit -> AtkRegistryClass.FFI.notnull AtkRegistryClass.FFI.p;
    val getFocusObject_ = _import "atk_get_focus_object" : unit -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;
    val getInterfaceAge_ = _import "atk_get_interface_age" : unit -> GUInt32.FFI.val_;
    val getMajorVersion_ = _import "atk_get_major_version" : unit -> GUInt32.FFI.val_;
    val getMicroVersion_ = _import "atk_get_micro_version" : unit -> GUInt32.FFI.val_;
    val getMinorVersion_ = _import "atk_get_minor_version" : unit -> GUInt32.FFI.val_;
    val getRoot_ = _import "atk_get_root" : unit -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;
    val getToolkitName_ = _import "atk_get_toolkit_name" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getToolkitVersion_ = _import "atk_get_toolkit_version" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getVersion_ = _import "atk_get_version" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val relationTypeForName_ = _import "mlton_atk_relation_type_for_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> AtkRelationType.FFI.val_;
    val relationTypeGetName_ = _import "atk_relation_type_get_name" : AtkRelationType.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val relationTypeRegister_ = _import "mlton_atk_relation_type_register" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> AtkRelationType.FFI.val_;
    val removeFocusTracker_ = _import "atk_remove_focus_tracker" : GUInt32.FFI.val_ -> unit;
    val removeGlobalEventListener_ = _import "atk_remove_global_event_listener" : GUInt32.FFI.val_ -> unit;
    val removeKeyEventListener_ = _import "atk_remove_key_event_listener" : GUInt32.FFI.val_ -> unit;
    val roleForName_ = _import "mlton_atk_role_for_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> AtkRole.FFI.val_;
    val roleGetLocalizedName_ = _import "atk_role_get_localized_name" : AtkRole.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val roleGetName_ = _import "atk_role_get_name" : AtkRole.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val roleRegister_ = _import "mlton_atk_role_register" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> AtkRole.FFI.val_;
    val stateTypeForName_ = _import "mlton_atk_state_type_for_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> AtkStateType.FFI.val_;
    val stateTypeGetName_ = _import "atk_state_type_get_name" : AtkStateType.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val stateTypeRegister_ = _import "mlton_atk_state_type_register" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> AtkStateType.FFI.val_;
    val textAttributeForName_ = _import "mlton_atk_text_attribute_for_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> AtkTextAttribute.FFI.val_;
    val textAttributeGetName_ = _import "atk_text_attribute_get_name" : AtkTextAttribute.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val textAttributeGetValue_ = fn x1 & x2 => (_import "atk_text_attribute_get_value" : AtkTextAttribute.FFI.val_ * GInt32.FFI.val_ -> unit Utf8.FFI.out_p;) (x1, x2)
    val textAttributeRegister_ = _import "mlton_atk_text_attribute_register" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> AtkTextAttribute.FFI.val_;
    val valueTypeGetLocalizedName_ = _import "atk_value_type_get_localized_name" : AtkValueType.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val valueTypeGetName_ = _import "atk_value_type_get_name" : AtkValueType.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
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
    structure RangeRecord = AtkRangeRecord
    structure RectangleRecord = AtkRectangleRecord
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
    structure TableCellClass = AtkTableCellClass
    structure TextClass = AtkTextClass
    structure TextAttribute = AtkTextAttribute
    structure TextBoundary = AtkTextBoundary
    structure TextClipType = AtkTextClipType
    structure TextGranularity = AtkTextGranularity
    structure TextRangeRecord = AtkTextRangeRecord
    structure TextRectangleRecord = AtkTextRectangleRecord
    structure UtilClass = AtkUtilClass
    structure ValueClass = AtkValueClass
    structure ValueType = AtkValueType
    structure WindowClass = AtkWindowClass
    structure Action = AtkAction
    structure Component = AtkComponent
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
    structure Range = AtkRange
    structure Rectangle = AtkRectangle
    structure Registry = AtkRegistry
    structure ObjectClassCPtrArrayN = AtkObjectClassCPtrArrayN
    structure RelationSet = AtkRelationSet
    structure Selection = AtkSelection
    structure SocketClass = AtkSocketClass
    structure StateTypeCArrayN = AtkStateTypeCArrayN
    structure StreamableContent = AtkStreamableContent
    structure Table = AtkTable
    structure TableCell = AtkTableCell
    structure TextRangeRecordCPtrArray = AtkTextRangeRecordCPtrArray
    structure TextRange = AtkTextRange
    structure TextRectangle = AtkTextRectangle
    structure Util = AtkUtil
    structure Value = AtkValue
    structure Window = AtkWindow
    structure GObjectAccessible = AtkGObjectAccessible
    structure NoOpObject = AtkNoOpObject
    structure NoOpObjectFactory = AtkNoOpObjectFactory
    structure Plug = AtkPlug
    structure Relation = AtkRelation
    structure Socket = AtkSocket
    structure StateSet = AtkStateSet
    structure Text = AtkText
    val BINARY_AGE = 22210
    val INTERFACE_AGE = 1
    val MAJOR_VERSION = 2
    val MICRO_VERSION = 0
    val MINOR_VERSION = 22
    val VERSION_MIN_REQUIRED = 2
    fun focusTrackerNotify object = (AtkObjectClass.FFI.withPtr ---> I) focusTrackerNotify_ object
    fun getBinaryAge () = (I ---> GUInt32.FFI.fromVal) getBinaryAge_ ()
    fun getDefaultRegistry () = (I ---> AtkRegistryClass.FFI.fromPtr true) getDefaultRegistry_ ()
    fun getFocusObject () = (I ---> AtkObjectClass.FFI.fromPtr false) getFocusObject_ ()
    fun getInterfaceAge () = (I ---> GUInt32.FFI.fromVal) getInterfaceAge_ ()
    fun getMajorVersion () = (I ---> GUInt32.FFI.fromVal) getMajorVersion_ ()
    fun getMicroVersion () = (I ---> GUInt32.FFI.fromVal) getMicroVersion_ ()
    fun getMinorVersion () = (I ---> GUInt32.FFI.fromVal) getMinorVersion_ ()
    fun getRoot () = (I ---> AtkObjectClass.FFI.fromPtr false) getRoot_ ()
    fun getToolkitName () = (I ---> Utf8.FFI.fromPtr 0) getToolkitName_ ()
    fun getToolkitVersion () = (I ---> Utf8.FFI.fromPtr 0) getToolkitVersion_ ()
    fun getVersion () = (I ---> Utf8.FFI.fromPtr 0) getVersion_ ()
    fun relationTypeForName name = (Utf8.FFI.withPtr ---> AtkRelationType.FFI.fromVal) relationTypeForName_ name
    fun relationTypeGetName type' = (AtkRelationType.FFI.withVal ---> Utf8.FFI.fromPtr 0) relationTypeGetName_ type'
    fun relationTypeRegister name = (Utf8.FFI.withPtr ---> AtkRelationType.FFI.fromVal) relationTypeRegister_ name
    fun removeFocusTracker trackerId = (GUInt32.FFI.withVal ---> I) removeFocusTracker_ trackerId
    fun removeGlobalEventListener listenerId = (GUInt32.FFI.withVal ---> I) removeGlobalEventListener_ listenerId
    fun removeKeyEventListener listenerId = (GUInt32.FFI.withVal ---> I) removeKeyEventListener_ listenerId
    fun roleForName name = (Utf8.FFI.withPtr ---> AtkRole.FFI.fromVal) roleForName_ name
    fun roleGetLocalizedName role = (AtkRole.FFI.withVal ---> Utf8.FFI.fromPtr 0) roleGetLocalizedName_ role
    fun roleGetName role = (AtkRole.FFI.withVal ---> Utf8.FFI.fromPtr 0) roleGetName_ role
    fun roleRegister name = (Utf8.FFI.withPtr ---> AtkRole.FFI.fromVal) roleRegister_ name
    fun stateTypeForName name = (Utf8.FFI.withPtr ---> AtkStateType.FFI.fromVal) stateTypeForName_ name
    fun stateTypeGetName type' = (AtkStateType.FFI.withVal ---> Utf8.FFI.fromPtr 0) stateTypeGetName_ type'
    fun stateTypeRegister name = (Utf8.FFI.withPtr ---> AtkStateType.FFI.fromVal) stateTypeRegister_ name
    fun textAttributeForName name = (Utf8.FFI.withPtr ---> AtkTextAttribute.FFI.fromVal) textAttributeForName_ name
    fun textAttributeGetName attr = (AtkTextAttribute.FFI.withVal ---> Utf8.FFI.fromPtr 0) textAttributeGetName_ attr
    fun textAttributeGetValue (attr, index) = (AtkTextAttribute.FFI.withVal &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) textAttributeGetValue_ (attr & index)
    fun textAttributeRegister name = (Utf8.FFI.withPtr ---> AtkTextAttribute.FFI.fromVal) textAttributeRegister_ name
    fun valueTypeGetLocalizedName valueType = (AtkValueType.FFI.withVal ---> Utf8.FFI.fromPtr 0) valueTypeGetLocalizedName_ valueType
    fun valueTypeGetName valueType = (AtkValueType.FFI.withVal ---> Utf8.FFI.fromPtr 0) valueTypeGetName_ valueType
  end
