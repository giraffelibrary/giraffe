signature GIO_ICON =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val deserialize : GLib.VariantRecord.t -> base class
    val newForString : string -> base class
    val equal :
      'a class
       -> 'b class option
       -> bool
    val serialize : 'a class -> GLib.VariantRecord.t
    val toString : 'a class -> string
  end
