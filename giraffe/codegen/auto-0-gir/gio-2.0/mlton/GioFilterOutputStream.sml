structure GioFilterOutputStream :>
  GIO_FILTER_OUTPUT_STREAM
    where type 'a class = 'a GioFilterOutputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    val getType_ = _import "g_filter_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val getBaseStream_ = _import "g_filter_output_stream_get_base_stream" : GioFilterOutputStreamClass.FFI.non_opt GioFilterOutputStreamClass.FFI.p -> GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p;
    val getCloseBaseStream_ = _import "g_filter_output_stream_get_close_base_stream" : GioFilterOutputStreamClass.FFI.non_opt GioFilterOutputStreamClass.FFI.p -> GBool.FFI.val_;
    val setCloseBaseStream_ = fn x1 & x2 => (_import "g_filter_output_stream_set_close_base_stream" : GioFilterOutputStreamClass.FFI.non_opt GioFilterOutputStreamClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioFilterOutputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getBaseStream self = (GioFilterOutputStreamClass.FFI.withPtr false ---> GioOutputStreamClass.FFI.fromPtr false) getBaseStream_ self
    fun getCloseBaseStream self = (GioFilterOutputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCloseBaseStream_ self
    fun setCloseBaseStream self closeBase = (GioFilterOutputStreamClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCloseBaseStream_ (self & closeBase)
    local
      open ValueAccessor
    in
      val baseStreamProp =
        {
          name = "base-stream",
          gtype = fn () => C.gtype GioOutputStreamClass.tOpt (),
          get = fn x => fn () => C.get GioOutputStreamClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioOutputStreamClass.tOpt x
        }
      val closeBaseStreamProp =
        {
          name = "close-base-stream",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
    end
  end
