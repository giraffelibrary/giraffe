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
        where type 'a class = 'a ActionClass.class
    structure Document :
      ATK_DOCUMENT
        where type 'a class = 'a DocumentClass.class
    structure EditableText :
      ATK_EDITABLE_TEXT
        where type 'a class = 'a EditableTextClass.class
    structure GObjectAccessibleClass :
      ATK_G_OBJECT_ACCESSIBLE_CLASS
        where type 'a object_class = 'a ObjectClass.class
    structure Hyperlink :
      ATK_HYPERLINK
        where type 'a class = 'a HyperlinkClass.class
        where type 'a action_class = 'a ActionClass.class
        where type 'a object_class = 'a ObjectClass.class
    structure HyperlinkImpl :
      ATK_HYPERLINK_IMPL
        where type 'a class = 'a HyperlinkImplClass.class
        where type 'a hyperlink_class = 'a HyperlinkClass.class
    structure Hypertext :
      ATK_HYPERTEXT
        where type 'a class = 'a HypertextClass.class
        where type 'a hyperlink_class = 'a HyperlinkClass.class
    structure Image :
      ATK_IMAGE
        where type 'a class = 'a ImageClass.class
    structure ImplementorIface :
      ATK_IMPLEMENTOR_IFACE
        where type 'a class = 'a ImplementorIfaceClass.class
    structure Misc :
      ATK_MISC
        where type 'a class = 'a MiscClass.class
    structure NoOpObjectClass :
      ATK_NO_OP_OBJECT_CLASS
        where type 'a object_class = 'a ObjectClass.class
    structure NoOpObjectFactoryClass :
      ATK_NO_OP_OBJECT_FACTORY_CLASS
        where type 'a object_factory_class = 'a ObjectFactoryClass.class
    structure Object :
      ATK_OBJECT
        where type 'a class = 'a ObjectClass.class
        where type 'a relation_set_class = 'a RelationSetClass.class
        where type 'a state_set_class = 'a StateSetClass.class
        where type relation_type_t = RelationType.t
        where type role_t = Role.t
    structure ObjectFactory :
      ATK_OBJECT_FACTORY
        where type 'a class = 'a ObjectFactoryClass.class
        where type 'a object_class = 'a ObjectClass.class
    structure PlugClass :
      ATK_PLUG_CLASS
        where type 'a object_class = 'a ObjectClass.class
    structure Registry :
      ATK_REGISTRY
        where type 'a class = 'a RegistryClass.class
    structure Relation :
      ATK_RELATION
        where type 'a class = 'a RelationClass.class
        where type 'a object_class = 'a ObjectClass.class
        where type relation_type_t = RelationType.t
    structure RelationSet :
      ATK_RELATION_SET
        where type 'a class = 'a RelationSetClass.class
        where type 'a object_class = 'a ObjectClass.class
        where type relation_type_t = RelationType.t
        where type 'a relation_class = 'a RelationClass.class
    structure Selection :
      ATK_SELECTION
        where type 'a class = 'a SelectionClass.class
        where type 'a object_class = 'a ObjectClass.class
    structure SocketClass :
      ATK_SOCKET_CLASS
        where type 'a object_class = 'a ObjectClass.class
    structure StateSet :
      ATK_STATE_SET
        where type 'a class = 'a StateSetClass.class
        where type state_type_t = StateType.t
    structure StreamableContent :
      ATK_STREAMABLE_CONTENT
        where type 'a class = 'a StreamableContentClass.class
    structure Table :
      ATK_TABLE
        where type 'a class = 'a TableClass.class
        where type 'a object_class = 'a ObjectClass.class
    structure Util :
      ATK_UTIL
        where type 'a class = 'a UtilClass.class
    structure Value :
      ATK_VALUE
        where type 'a class = 'a ValueClass.class
    structure Window :
      ATK_WINDOW
        where type 'a class = 'a WindowClass.class
    structure GObjectAccessible :
      ATK_G_OBJECT_ACCESSIBLE
        where type 'a class = 'a GObjectAccessibleClass.class
        where type 'a object_class = 'a ObjectClass.class
    structure NoOpObject :
      ATK_NO_OP_OBJECT
        where type 'a class = 'a NoOpObjectClass.class
        where type 'a action_class = 'a ActionClass.class
        where type 'a component_class = 'a ComponentClass.class
        where type 'a document_class = 'a DocumentClass.class
        where type 'a editable_text_class = 'a EditableTextClass.class
        where type 'a hypertext_class = 'a HypertextClass.class
        where type 'a image_class = 'a ImageClass.class
        where type 'a selection_class = 'a SelectionClass.class
        where type 'a table_class = 'a TableClass.class
        where type 'a text_class = 'a TextClass.class
        where type 'a value_class = 'a ValueClass.class
        where type 'a window_class = 'a WindowClass.class
    structure NoOpObjectFactory :
      ATK_NO_OP_OBJECT_FACTORY
        where type 'a class = 'a NoOpObjectFactoryClass.class
    structure Plug :
      ATK_PLUG
        where type 'a class = 'a PlugClass.class
        where type 'a component_class = 'a ComponentClass.class
    structure Socket :
      ATK_SOCKET
        where type 'a class = 'a SocketClass.class
        where type 'a component_class = 'a ComponentClass.class
    val focusTrackerNotify : 'a ObjectClass.class -> unit
    val getDefaultRegistry : unit -> base RegistryClass.class
    val getFocusObject : unit -> base ObjectClass.class
    val getRoot : unit -> base ObjectClass.class
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
    val textAttributeGetValue : TextAttribute.t * LargeInt.int -> string
    val textAttributeRegister : string -> TextAttribute.t
    val textFreeRanges : TextRangeRecord.t -> unit
  end
