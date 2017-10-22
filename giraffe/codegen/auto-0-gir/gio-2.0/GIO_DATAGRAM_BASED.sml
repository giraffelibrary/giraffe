signature GIO_DATAGRAM_BASED =
  sig
    type 'a class
    type 'a cancellable_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val conditionCheck :
      'a class
       -> GLib.IOCondition.t
       -> GLib.IOCondition.t
    val conditionWait :
      'a class
       -> GLib.IOCondition.t
           * LargeInt.int
           * 'b cancellable_class option
       -> unit
    val createSource :
      'a class
       -> GLib.IOCondition.t * 'b cancellable_class option
       -> GLib.SourceRecord.t
  end
