signature ATK =
  sig
    structure ImplementorIfaceClass : ATK_IMPLEMENTOR_IFACE_CLASS
    structure ObjectClass : ATK_OBJECT_CLASS
    val focusTrackerNotify : 'a ObjectClass.t -> unit
    val getFocusObject : unit -> base ObjectClass.t
    val getRoot : unit -> base ObjectClass.t
    val getToolkitName : unit -> string
    val getToolkitVersion : unit -> string
    val getVersion : unit -> string
  end
