signature GTK_LOCK_BUTTON =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : 'a Gio.PermissionClass.class option -> base class
    val getPermission : 'a class -> base Gio.PermissionClass.class
    val setPermission :
      'a class
       -> 'b Gio.PermissionClass.class option
       -> unit
    val permissionProp : ('a class, unit -> base Gio.PermissionClass.class option, 'b Gio.PermissionClass.class option -> unit, 'b Gio.PermissionClass.class option -> unit) Property.t
    val textLockProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val textUnlockProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val tooltipLockProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val tooltipNotAuthorizedProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val tooltipUnlockProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
