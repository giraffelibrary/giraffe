structure GioCharsetConverter :>
  GIO_CHARSET_CONVERTER
    where type 'a class = 'a GioCharsetConverterClass.class
    where type 'a converter_class = 'a GioConverterClass.class
    where type 'a initable_class = 'a GioInitableClass.class =
  struct
    val getType_ = _import "g_charset_converter_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_charset_converter_new" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioCharsetConverterClass.FFI.notnull GioCharsetConverterClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getNumFallbacks_ = _import "g_charset_converter_get_num_fallbacks" : GioCharsetConverterClass.FFI.notnull GioCharsetConverterClass.FFI.p -> GUInt32.FFI.val_;
    val getUseFallback_ = _import "g_charset_converter_get_use_fallback" : GioCharsetConverterClass.FFI.notnull GioCharsetConverterClass.FFI.p -> GBool.FFI.val_;
    val setUseFallback_ = fn x1 & x2 => (_import "g_charset_converter_set_use_fallback" : GioCharsetConverterClass.FFI.notnull GioCharsetConverterClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioCharsetConverterClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type t = base class
    fun asConverter self = (GObjectObjectClass.FFI.withPtr ---> GioConverterClass.FFI.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.FFI.withPtr ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (toCharset, fromCharset) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioCharsetConverterClass.FFI.fromPtr true
      )
        new_
        (
          toCharset
           & fromCharset
           & []
        )
    fun getNumFallbacks self = (GioCharsetConverterClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getNumFallbacks_ self
    fun getUseFallback self = (GioCharsetConverterClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseFallback_ self
    fun setUseFallback self useFallback = (GioCharsetConverterClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseFallback_ (self & useFallback)
    local
      open Property
    in
      val fromCharsetProp =
        {
          get = fn x => get "from-charset" stringOpt x,
          set = fn x => set "from-charset" stringOpt x
        }
      val toCharsetProp =
        {
          get = fn x => get "to-charset" stringOpt x,
          set = fn x => set "to-charset" stringOpt x
        }
      val useFallbackProp =
        {
          get = fn x => get "use-fallback" boolean x,
          set = fn x => set "use-fallback" boolean x
        }
    end
  end
