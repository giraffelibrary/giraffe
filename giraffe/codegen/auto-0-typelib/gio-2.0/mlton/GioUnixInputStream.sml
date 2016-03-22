structure GioUnixInputStream :>
  GIO_UNIX_INPUT_STREAM
    where type 'a class = 'a GioUnixInputStreamClass.class
    where type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class =
  struct
    val getType_ = _import "g_unix_input_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "g_unix_input_stream_new" : FFI.Int32.C.val_ * FFI.Bool.C.val_ -> GioInputStreamClass.C.notnull GioInputStreamClass.C.p;) (x1, x2)
    val getCloseFd_ = _import "g_unix_input_stream_get_close_fd" : GioUnixInputStreamClass.C.notnull GioUnixInputStreamClass.C.p -> FFI.Bool.C.val_;
    val getFd_ = _import "g_unix_input_stream_get_fd" : GioUnixInputStreamClass.C.notnull GioUnixInputStreamClass.C.p -> FFI.Int32.C.val_;
    val setCloseFd_ = fn x1 & x2 => (_import "g_unix_input_stream_set_close_fd" : GioUnixInputStreamClass.C.notnull GioUnixInputStreamClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioUnixInputStreamClass.class
    type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class
    type t = base class
    fun asPollableInputStream self = (GObjectObjectClass.C.withPtr ---> GioPollableInputStreamClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new fd closeFd = (FFI.Int32.C.withVal &&&> FFI.Bool.C.withVal ---> GioUnixInputStreamClass.C.fromPtr true) new_ (fd & closeFd)
    fun getCloseFd self = (GioUnixInputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) getCloseFd_ self
    fun getFd self = (GioUnixInputStreamClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
    fun setCloseFd self closeFd = (GioUnixInputStreamClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCloseFd_ (self & closeFd)
    local
      open Property
    in
      val closeFdProp =
        {
          get = fn x => get "close-fd" boolean x,
          set = fn x => set "close-fd" boolean x
        }
      val fdProp =
        {
          get = fn x => get "fd" int x,
          set = fn x => set "fd" int x
        }
    end
  end
