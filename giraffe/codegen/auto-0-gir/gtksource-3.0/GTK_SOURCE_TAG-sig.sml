signature GTK_SOURCE_TAG =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string option -> base class
    val drawSpacesProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val drawSpacesSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
