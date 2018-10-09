signature GIO_MENU_ATTRIBUTE_ITER =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getName : 'a class -> string
    val getNext : 'a class -> (string * GLib.VariantRecord.t) option
    val getValue : 'a class -> GLib.VariantRecord.t
    val next : 'a class -> bool
  end
