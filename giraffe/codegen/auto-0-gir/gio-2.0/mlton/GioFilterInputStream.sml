structure GioFilterInputStream :>
  GIO_FILTER_INPUT_STREAM
    where type 'a class = 'a GioFilterInputStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class =
  struct
    val getType_ = _import "g_filter_input_stream_get_type" : unit -> GObjectType.C.val_;
    val getBaseStream_ = _import "g_filter_input_stream_get_base_stream" : GioFilterInputStreamClass.C.notnull GioFilterInputStreamClass.C.p -> GioInputStreamClass.C.notnull GioInputStreamClass.C.p;
    val getCloseBaseStream_ = _import "g_filter_input_stream_get_close_base_stream" : GioFilterInputStreamClass.C.notnull GioFilterInputStreamClass.C.p -> FFI.Bool.C.val_;
    val setCloseBaseStream_ = fn x1 & x2 => (_import "g_filter_input_stream_set_close_base_stream" : GioFilterInputStreamClass.C.notnull GioFilterInputStreamClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioFilterInputStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getBaseStream self = (GioFilterInputStreamClass.C.withPtr ---> GioInputStreamClass.C.fromPtr false) getBaseStream_ self
    fun getCloseBaseStream self = (GioFilterInputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) getCloseBaseStream_ self
    fun setCloseBaseStream self closeBase = (GioFilterInputStreamClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCloseBaseStream_ (self & closeBase)
    local
      open Property
    in
      val baseStreamProp =
        {
          get = fn x => get "base-stream" GioInputStreamClass.tOpt x,
          set = fn x => set "base-stream" GioInputStreamClass.tOpt x
        }
      val closeBaseStreamProp =
        {
          get = fn x => get "close-base-stream" boolean x,
          set = fn x => set "close-base-stream" boolean x
        }
    end
  end
