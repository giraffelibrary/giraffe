structure GioFilterInputStream :>
  GIO_FILTER_INPUT_STREAM
    where type 'a class = 'a GioFilterInputStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class =
  struct
    val getType_ = _import "g_filter_input_stream_get_type" : unit -> GObjectType.FFI.val_;
    val getBaseStream_ = _import "g_filter_input_stream_get_base_stream" : GioFilterInputStreamClass.FFI.non_opt GioFilterInputStreamClass.FFI.p -> GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p;
    val getCloseBaseStream_ = _import "g_filter_input_stream_get_close_base_stream" : GioFilterInputStreamClass.FFI.non_opt GioFilterInputStreamClass.FFI.p -> GBool.FFI.val_;
    val setCloseBaseStream_ = fn x1 & x2 => (_import "g_filter_input_stream_set_close_base_stream" : GioFilterInputStreamClass.FFI.non_opt GioFilterInputStreamClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioFilterInputStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getBaseStream self = (GioFilterInputStreamClass.FFI.withPtr false ---> GioInputStreamClass.FFI.fromPtr false) getBaseStream_ self
    fun getCloseBaseStream self = (GioFilterInputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCloseBaseStream_ self
    fun setCloseBaseStream self closeBase = (GioFilterInputStreamClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCloseBaseStream_ (self & closeBase)
    local
      open ValueAccessor
    in
      val baseStreamProp =
        {
          name = "base-stream",
          gtype = fn () => C.gtype GioInputStreamClass.tOpt (),
          get = fn x => fn () => C.get GioInputStreamClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioInputStreamClass.tOpt x
        }
      val closeBaseStreamProp =
        {
          name = "close-base-stream",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
