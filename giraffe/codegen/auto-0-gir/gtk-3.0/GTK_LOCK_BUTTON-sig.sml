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
    val permissionProp :
      {
        get : 'a class -> base Gio.PermissionClass.class option,
        set :
          'b Gio.PermissionClass.class option
           -> 'a class
           -> unit,
        new : 'b Gio.PermissionClass.class option -> 'a class Property.t
      }
    val textLockProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val textUnlockProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val tooltipLockProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val tooltipNotAuthorizedProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val tooltipUnlockProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
