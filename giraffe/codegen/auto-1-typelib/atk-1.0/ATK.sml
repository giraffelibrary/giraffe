signature ATK =
  sig
    structure ActionClass : ATK_ACTION_CLASS
    structure ComponentClass : ATK_COMPONENT_CLASS
    structure CoordType : ATK_COORD_TYPE
    structure DocumentClass : ATK_DOCUMENT_CLASS
    structure EditableTextClass : ATK_EDITABLE_TEXT_CLASS
    structure HyperlinkClass : ATK_HYPERLINK_CLASS
    structure HyperlinkImplClass : ATK_HYPERLINK_IMPL_CLASS
    structure HyperlinkStateFlags : ATK_HYPERLINK_STATE_FLAGS
    structure HypertextClass : ATK_HYPERTEXT_CLASS
    structure ImageClass : ATK_IMAGE_CLASS
    structure ImplementorIfaceClass : ATK_IMPLEMENTOR_IFACE_CLASS
    structure KeyEventType : ATK_KEY_EVENT_TYPE
    structure Layer : ATK_LAYER
    structure MiscClass : ATK_MISC_CLASS
    structure ObjectClass : ATK_OBJECT_CLASS
    structure ObjectFactoryClass : ATK_OBJECT_FACTORY_CLASS
    structure RegistryClass : ATK_REGISTRY_CLASS
    structure RelationClass : ATK_RELATION_CLASS
    structure RelationSetClass : ATK_RELATION_SET_CLASS
    structure RelationType : ATK_RELATION_TYPE
    structure Role : ATK_ROLE
    structure SelectionClass : ATK_SELECTION_CLASS
    structure StateSetClass : ATK_STATE_SET_CLASS
    structure StateType : ATK_STATE_TYPE
    structure StreamableContentClass : ATK_STREAMABLE_CONTENT_CLASS
    structure TableClass : ATK_TABLE_CLASS
    structure TextClass : ATK_TEXT_CLASS
    structure TextAttribute : ATK_TEXT_ATTRIBUTE
    structure TextBoundary : ATK_TEXT_BOUNDARY
    structure TextClipType : ATK_TEXT_CLIP_TYPE
    structure UtilClass : ATK_UTIL_CLASS
    structure ValueClass : ATK_VALUE_CLASS
    structure WindowClass : ATK_WINDOW_CLASS
    structure Action :
      ATK_ACTION
        where type 'a class_t = 'a ActionClass.t
    structure Document :
      ATK_DOCUMENT
        where type 'a class_t = 'a DocumentClass.t
    structure EditableText :
      ATK_EDITABLE_TEXT
        where type 'a class_t = 'a EditableTextClass.t
    structure GObjectAccessibleClass :
      ATK_G_OBJECT_ACCESSIBLE_CLASS
        where type 'a objectclass_t = 'a ObjectClass.t
    structure Hyperlink :
      ATK_HYPERLINK
        where type 'a class_t = 'a HyperlinkClass.t
        where type 'a actionclass_t = 'a ActionClass.t
        where type 'a objectclass_t = 'a ObjectClass.t
    structure HyperlinkImpl :
      ATK_HYPERLINK_IMPL
        where type 'a class_t = 'a HyperlinkImplClass.t
        where type 'a hyperlinkclass_t = 'a HyperlinkClass.t
    structure Hypertext :
      ATK_HYPERTEXT
        where type 'a class_t = 'a HypertextClass.t
        where type 'a hyperlinkclass_t = 'a HyperlinkClass.t
    structure Image :
      ATK_IMAGE
        where type 'a class_t = 'a ImageClass.t
    structure ImplementorIface :
      ATK_IMPLEMENTOR_IFACE
        where type 'a class_t = 'a ImplementorIfaceClass.t
    structure Misc :
      ATK_MISC
        where type 'a class_t = 'a MiscClass.t
    structure NoOpObjectClass :
      ATK_NO_OP_OBJECT_CLASS
        where type 'a objectclass_t = 'a ObjectClass.t
    structure NoOpObjectFactoryClass :
      ATK_NO_OP_OBJECT_FACTORY_CLASS
        where type 'a objectfactoryclass_t = 'a ObjectFactoryClass.t
    structure Object :
      ATK_OBJECT
        where type 'a class_t = 'a ObjectClass.t
        where type 'a relationsetclass_t = 'a RelationSetClass.t
        where type 'a statesetclass_t = 'a StateSetClass.t
        where type relationtype_t = RelationType.t
        where type role_t = Role.t
    structure ObjectFactory :
      ATK_OBJECT_FACTORY
        where type 'a class_t = 'a ObjectFactoryClass.t
        where type 'a objectclass_t = 'a ObjectClass.t
    structure PlugClass :
      ATK_PLUG_CLASS
        where type 'a objectclass_t = 'a ObjectClass.t
    structure Registry :
      ATK_REGISTRY
        where type 'a class_t = 'a RegistryClass.t
    structure Relation :
      ATK_RELATION
        where type 'a class_t = 'a RelationClass.t
        where type 'a objectclass_t = 'a ObjectClass.t
        where type relationtype_t = RelationType.t
    structure RelationSet :
      ATK_RELATION_SET
        where type 'a class_t = 'a RelationSetClass.t
        where type 'a objectclass_t = 'a ObjectClass.t
        where type relationtype_t = RelationType.t
        where type 'a relationclass_t = 'a RelationClass.t
    structure Selection :
      ATK_SELECTION
        where type 'a class_t = 'a SelectionClass.t
        where type 'a objectclass_t = 'a ObjectClass.t
    structure SocketClass :
      ATK_SOCKET_CLASS
        where type 'a objectclass_t = 'a ObjectClass.t
    structure StateSet :
      ATK_STATE_SET
        where type 'a class_t = 'a StateSetClass.t
        where type statetype_t = StateType.t
    structure StreamableContent :
      ATK_STREAMABLE_CONTENT
        where type 'a class_t = 'a StreamableContentClass.t
    structure Table :
      ATK_TABLE
        where type 'a class_t = 'a TableClass.t
        where type 'a objectclass_t = 'a ObjectClass.t
    structure Util :
      ATK_UTIL
        where type 'a class_t = 'a UtilClass.t
    structure Value :
      ATK_VALUE
        where type 'a class_t = 'a ValueClass.t
    structure Window :
      ATK_WINDOW
        where type 'a class_t = 'a WindowClass.t
    structure GObjectAccessible :
      ATK_G_OBJECT_ACCESSIBLE
        where type 'a class_t = 'a GObjectAccessibleClass.t
        where type 'a objectclass_t = 'a ObjectClass.t
    structure NoOpObject :
      ATK_NO_OP_OBJECT
        where type 'a class_t = 'a NoOpObjectClass.t
        where type 'a actionclass_t = 'a ActionClass.t
        where type 'a componentclass_t = 'a ComponentClass.t
        where type 'a documentclass_t = 'a DocumentClass.t
        where type 'a editabletextclass_t = 'a EditableTextClass.t
        where type 'a hypertextclass_t = 'a HypertextClass.t
        where type 'a imageclass_t = 'a ImageClass.t
        where type 'a selectionclass_t = 'a SelectionClass.t
        where type 'a tableclass_t = 'a TableClass.t
        where type 'a textclass_t = 'a TextClass.t
        where type 'a valueclass_t = 'a ValueClass.t
        where type 'a windowclass_t = 'a WindowClass.t
    structure NoOpObjectFactory :
      ATK_NO_OP_OBJECT_FACTORY
        where type 'a class_t = 'a NoOpObjectFactoryClass.t
    structure Plug :
      ATK_PLUG
        where type 'a class_t = 'a PlugClass.t
        where type 'a componentclass_t = 'a ComponentClass.t
    structure Socket :
      ATK_SOCKET
        where type 'a class_t = 'a SocketClass.t
        where type 'a componentclass_t = 'a ComponentClass.t
    val focusTrackerNotify : 'a ObjectClass.t -> unit
    val getDefaultRegistry : unit -> base RegistryClass.t
    val getFocusObject : unit -> base ObjectClass.t
    val getRoot : unit -> base ObjectClass.t
    val getToolkitName : unit -> string
    val getToolkitVersion : unit -> string
    val getVersion : unit -> string
    val relationTypeForName : string -> RelationType.t
    val relationTypeGetName : RelationType.t -> string
    val relationTypeRegister : string -> RelationType.t
    val removeFocusTracker : LargeInt.int -> unit
    val removeGlobalEventListener : LargeInt.int -> unit
    val removeKeyEventListener : LargeInt.int -> unit
    val roleForName : string -> Role.t
    val roleGetLocalizedName : Role.t -> string
    val roleGetName : Role.t -> string
    val roleRegister : string -> Role.t
    val stateTypeForName : string -> StateType.t
    val stateTypeGetName : StateType.t -> string
    val stateTypeRegister : string -> StateType.t
    val textAttributeForName : string -> TextAttribute.t
    val textAttributeGetName : TextAttribute.t -> string
    val textAttributeGetValue :
      TextAttribute.t
       -> LargeInt.int
       -> string
    val textAttributeRegister : string -> TextAttribute.t
    val textFreeRanges : TextRangeRecord.t -> unit
  end
