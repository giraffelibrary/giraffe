signature GTK_LOCK_BUTTON =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a activatableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : 'a Gio.PermissionClass.t option -> base class_t
    val setPermission :
      'a class_t
       -> 'b Gio.PermissionClass.t option
       -> unit
    val permissionProp : ('a class_t, base Gio.PermissionClass.t option, 'b Gio.PermissionClass.t option) Property.readwrite
    val textLockProp : ('a class_t, string option, string option) Property.readwrite
    val textUnlockProp : ('a class_t, string option, string option) Property.readwrite
    val tooltipLockProp : ('a class_t, string option, string option) Property.readwrite
    val tooltipNotAuthorizedProp : ('a class_t, string option, string option) Property.readwrite
    val tooltipUnlockProp : ('a class_t, string option, string option) Property.readwrite
  end
