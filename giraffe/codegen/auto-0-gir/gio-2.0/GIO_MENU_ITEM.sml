signature GIO_MENU_ITEM =
  sig
    type 'a class
    type 'a icon_class
    type 'a menu_model_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string option * string option -> base class
    val newFromModel : 'a menu_model_class * LargeInt.int -> base class
    val newSection : string option * 'a menu_model_class -> base class
    val newSubmenu : string option * 'a menu_model_class -> base class
    val getAttributeValue :
      'a class
       -> string * GLib.VariantTypeRecord.t option
       -> GLib.VariantRecord.t
    val getLink :
      'a class
       -> string
       -> base menu_model_class
    val setActionAndTargetValue :
      'a class
       -> string option * GLib.VariantRecord.t option
       -> unit
    val setAttributeValue :
      'a class
       -> string * GLib.VariantRecord.t option
       -> unit
    val setDetailedAction :
      'a class
       -> string
       -> unit
    val setIcon :
      'a class
       -> 'b icon_class
       -> unit
    val setLabel :
      'a class
       -> string option
       -> unit
    val setLink :
      'a class
       -> string * 'b menu_model_class option
       -> unit
    val setSection :
      'a class
       -> 'b menu_model_class option
       -> unit
    val setSubmenu :
      'a class
       -> 'b menu_model_class option
       -> unit
  end
