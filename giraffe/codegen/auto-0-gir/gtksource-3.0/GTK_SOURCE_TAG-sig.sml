signature GTK_SOURCE_TAG =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string option -> base class
    val drawSpacesProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val drawSpacesSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
