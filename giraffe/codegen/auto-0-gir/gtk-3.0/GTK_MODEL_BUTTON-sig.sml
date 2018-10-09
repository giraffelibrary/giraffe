signature GTK_MODEL_BUTTON =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type button_role_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val activeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val centeredProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val iconProp :
      {
        get : 'a class -> base Gio.IconClass.class option,
        set :
          'b Gio.IconClass.class option
           -> 'a class
           -> unit,
        new : 'b Gio.IconClass.class option -> 'a class Property.t
      }
    val iconicProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val invertedProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val menuNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val roleProp :
      {
        get : 'a class -> button_role_t,
        set :
          button_role_t
           -> 'a class
           -> unit,
        new : button_role_t -> 'a class Property.t
      }
    val textProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
