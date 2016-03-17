structure GioFilterOutputStream :>
  GIO_FILTER_OUTPUT_STREAM
    where type 'a class = 'a GioFilterOutputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    val getType_ = _import "g_filter_output_stream_get_type" : unit -> GObjectType.C.val_;
    val getBaseStream_ = _import "g_filter_output_stream_get_base_stream" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getCloseBaseStream_ = _import "g_filter_output_stream_get_close_base_stream" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setCloseBaseStream_ = fn x1 & x2 => (_import "g_filter_output_stream_set_close_base_stream" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioFilterOutputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getBaseStream self = (GObjectObjectClass.C.withPtr ---> GioOutputStreamClass.C.fromPtr false) getBaseStream_ self
    fun getCloseBaseStream self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCloseBaseStream_ self
    fun setCloseBaseStream self closeBase = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCloseBaseStream_ (self & closeBase)
    local
      open Property
    in
      val baseStreamProp =
        {
          get = fn x => get "base-stream" GioOutputStreamClass.tOpt x,
          set = fn x => set "base-stream" GioOutputStreamClass.tOpt x
        }
      val closeBaseStreamProp =
        {
          get = fn x => get "close-base-stream" boolean x,
          set = fn x => set "close-base-stream" boolean x
        }
    end
  end
