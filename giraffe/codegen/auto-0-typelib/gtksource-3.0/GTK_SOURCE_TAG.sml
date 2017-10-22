signature GTK_SOURCE_TAG =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string option -> base class
    val drawSpacesProp : ('a class, bool, bool) Property.readwrite
    val drawSpacesSetProp : ('a class, bool, bool) Property.readwrite
  end
