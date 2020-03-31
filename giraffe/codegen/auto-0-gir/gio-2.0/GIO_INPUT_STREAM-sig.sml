signature GIO_INPUT_STREAM =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val clearPending : 'a class -> unit
    val close :
      'a class
       -> 'b cancellable_class option
       -> unit
    val closeFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val hasPending : 'a class -> bool
    val isClosed : 'a class -> bool
    val read :
      'a class
       -> GUInt8CArrayN.t * 'b cancellable_class option
       -> int
    val readAll :
      'a class
       -> GUInt8CArrayN.t * 'b cancellable_class option
       -> int
    val readAllFinish :
      'a class
       -> 'b async_result_class
       -> int
    val readBytes :
      'a class
       -> int * 'b cancellable_class option
       -> GLib.BytesRecord.t
    val readBytesFinish :
      'a class
       -> 'b async_result_class
       -> GLib.BytesRecord.t
    val readFinish :
      'a class
       -> 'b async_result_class
       -> int
    val setPending : 'a class -> unit
    val skip :
      'a class
       -> int * 'b cancellable_class option
       -> int
    val skipFinish :
      'a class
       -> 'b async_result_class
       -> int
  end
