signature GTK_I_M_MULTICONTEXT =
  sig
    type 'a class
    type 'a menu_shell_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val appendMenuitems :
      'a class
       -> 'b menu_shell_class
       -> unit
    val getContextId : 'a class -> string
    val setContextId :
      'a class
       -> string
       -> unit
  end
