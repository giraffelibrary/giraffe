signature GIO_FILENAME_COMPLETER =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getCompletionSuffix :
      'a class_t
       -> string
       -> string
    val setDirsOnly :
      'a class_t
       -> bool
       -> unit
    val gotCompletionDataSig : (unit -> unit) -> 'a class_t Signal.signal
  end
