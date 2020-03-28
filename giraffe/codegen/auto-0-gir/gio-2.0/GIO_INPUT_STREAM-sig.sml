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
       -> LargeInt.int
    val readAll :
      'a class
       -> GUInt8CArrayN.t * 'b cancellable_class option
       -> LargeInt.int
    val readAllFinish :
      'a class
       -> 'b async_result_class
       -> LargeInt.int
    val readBytes :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> GLib.BytesRecord.t
    val readBytesFinish :
      'a class
       -> 'b async_result_class
       -> GLib.BytesRecord.t
    val readFinish :
      'a class
       -> 'b async_result_class
       -> LargeInt.int
    val setPending : 'a class -> unit
    val skip :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> LargeInt.int
    val skipFinish :
      'a class
       -> 'b async_result_class
       -> LargeInt.int
  end
