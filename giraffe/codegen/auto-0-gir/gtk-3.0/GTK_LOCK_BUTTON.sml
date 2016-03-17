signature GTK_LOCK_BUTTON =
  sig
    type 'a class
    type 'a activatable_class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : 'a Gio.PermissionClass.class option -> base class
    val setPermission :
      'a class
       -> 'b Gio.PermissionClass.class option
       -> unit
    val permissionProp : ('a class, base Gio.PermissionClass.class option, 'b Gio.PermissionClass.class option) Property.readwrite
    val textLockProp : ('a class, string option, string option) Property.readwrite
    val textUnlockProp : ('a class, string option, string option) Property.readwrite
    val tooltipLockProp : ('a class, string option, string option) Property.readwrite
    val tooltipNotAuthorizedProp : ('a class, string option, string option) Property.readwrite
    val tooltipUnlockProp : ('a class, string option, string option) Property.readwrite
  end
