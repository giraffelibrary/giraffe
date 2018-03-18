signature GDK_DISPLAY_MANAGER =
  sig
    type 'a class
    type 'a display_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val get : unit -> base class
    val getDefaultDisplay : 'a class -> base display_class option
    val openDisplay :
      'a class
       -> string
       -> base display_class option
    val setDefaultDisplay :
      'a class
       -> 'b display_class
       -> unit
    val displayOpenedSig : (base display_class -> unit) -> 'a class Signal.t
    val defaultDisplayProp :
      {
        get : 'a class -> base display_class option,
        set :
          'b display_class option
           -> 'a class
           -> unit,
        new : 'b display_class option -> 'a class Property.t
      }
  end
