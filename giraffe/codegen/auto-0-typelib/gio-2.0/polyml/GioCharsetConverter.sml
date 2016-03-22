structure GioCharsetConverter :>
  GIO_CHARSET_CONVERTER
    where type 'a class = 'a GioCharsetConverterClass.class
    where type 'a converter_class = 'a GioConverterClass.class
    where type 'a initable_class = 'a GioInitableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_charset_converter_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgio "g_charset_converter_new")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioCharsetConverterClass.PolyML.cPtr
          )
      val getNumFallbacks_ = call (load_sym libgio "g_charset_converter_get_num_fallbacks") (GioCharsetConverterClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getUseFallback_ = call (load_sym libgio "g_charset_converter_get_use_fallback") (GioCharsetConverterClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setUseFallback_ = call (load_sym libgio "g_charset_converter_set_use_fallback") (GioCharsetConverterClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioCharsetConverterClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type t = base class
    fun asConverter self = (GObjectObjectClass.C.withPtr ---> GioConverterClass.C.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new toCharset fromCharset =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioCharsetConverterClass.C.fromPtr true
      )
        new_
        (
          toCharset
           & fromCharset
           & []
        )
    fun getNumFallbacks self = (GioCharsetConverterClass.C.withPtr ---> FFI.UInt32.C.fromVal) getNumFallbacks_ self
    fun getUseFallback self = (GioCharsetConverterClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseFallback_ self
    fun setUseFallback self useFallback = (GioCharsetConverterClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseFallback_ (self & useFallback)
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
