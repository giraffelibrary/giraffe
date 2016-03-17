signature ATK =
  sig
    structure ImplementorIfaceClass : ATK_IMPLEMENTOR_IFACE_CLASS
    structure ObjectClass : ATK_OBJECT_CLASS
    val focusTrackerNotify : 'a ObjectClass.class -> unit
    val getFocusObject : unit -> base ObjectClass.class
    val getRoot : unit -> base ObjectClass.class
    val getToolkitName : unit -> string
    val getToolkitVersion : unit -> string
    val getVersion : unit -> string
  end
