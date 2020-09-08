signature GTK_SHORTCUT_LABEL =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val getAccelerator : 'a class -> string option
    val getDisabledText : 'a class -> string option
    val setAccelerator :
      'a class
       -> string
       -> unit
    val setDisabledText :
      'a class
       -> string
       -> unit
    val acceleratorProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val disabledTextProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
