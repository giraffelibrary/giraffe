signature GIO_SUBPROCESS =
  sig
    type 'a class
    type 'a initable_class
    type 'a output_stream_class
    type 'a input_stream_class
    type 'a cancellable_class
    type 'a async_result_class
    type subprocess_flags_t
    type t = base class
    val asInitable : 'a class -> base initable_class
    val getType : unit -> GObject.Type.t
    val new : string list * subprocess_flags_t -> base class
    val communicate :
      'a class
       -> GLib.BytesRecord.t option * 'b cancellable_class option
       -> GLib.BytesRecord.t * GLib.BytesRecord.t
    val communicateFinish :
      'a class
       -> 'b async_result_class
       -> GLib.BytesRecord.t * GLib.BytesRecord.t
    val communicateUtf8 :
      'a class
       -> string option * 'b cancellable_class option
       -> string * string
    val communicateUtf8Finish :
      'a class
       -> 'b async_result_class
       -> string * string
    val forceExit : 'a class -> unit
    val getExitStatus : 'a class -> LargeInt.int
    val getIdentifier : 'a class -> string
    val getIfExited : 'a class -> bool
    val getIfSignaled : 'a class -> bool
    val getStatus : 'a class -> LargeInt.int
    val getStderrPipe : 'a class -> base input_stream_class
    val getStdinPipe : 'a class -> base output_stream_class
    val getStdoutPipe : 'a class -> base input_stream_class
    val getSuccessful : 'a class -> bool
    val getTermSig : 'a class -> LargeInt.int
    val sendSignal :
      'a class
       -> LargeInt.int
       -> unit
    val wait :
      'a class
       -> 'b cancellable_class option
       -> unit
    val waitCheck :
      'a class
       -> 'b cancellable_class option
       -> unit
    val waitCheckFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val waitFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val flagsProp : ('a class, subprocess_flags_t) Property.writeonly
  end
