structure GioCharsetConverter :>
  GIO_CHARSET_CONVERTER
    where type 'a class_t = 'a GioCharsetConverterClass.t
    where type 'a converter_class_t = 'a GioConverterClass.t
    where type 'a initable_class_t = 'a GioInitableClass.t =
  struct
    val getType_ = _import "g_charset_converter_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_charset_converter_new" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getNumFallbacks_ = _import "g_charset_converter_get_num_fallbacks" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt.C.val_;
    val getUseFallback_ = _import "g_charset_converter_get_use_fallback" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setUseFallback_ = fn x1 & x2 => (_import "g_charset_converter_set_use_fallback" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GioCharsetConverterClass.t
    type 'a converter_class_t = 'a GioConverterClass.t
    type 'a initable_class_t = 'a GioInitableClass.t
    type t = base class_t
    fun asConverter self = (GObjectObjectClass.C.withPtr ---> GioConverterClass.C.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new toCharset fromCharset =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioCharsetConverterClass.C.fromPtr true
      )
        new_
        (
          toCharset
           & fromCharset
           & []
        )
    fun getNumFallbacks self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getNumFallbacks_ self
    fun getUseFallback self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseFallback_ self
    fun setUseFallback self useFallback = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseFallback_ (self & useFallback)
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
