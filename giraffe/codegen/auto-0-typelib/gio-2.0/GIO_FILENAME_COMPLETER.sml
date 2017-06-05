signature GIO_FILENAME_COMPLETER =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getCompletionSuffix :
      'a class
       -> string
       -> string
    val getCompletions :
      'a class
       -> string
       -> string list
    val setDirsOnly :
      'a class
       -> bool
       -> unit
    val gotCompletionDataSig : (unit -> unit) -> 'a class Signal.signal
  end
