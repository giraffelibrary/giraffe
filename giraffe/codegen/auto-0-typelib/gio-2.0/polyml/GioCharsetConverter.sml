structure GioCharsetConverter :>
  GIO_CHARSET_CONVERTER
    where type 'a class = 'a GioCharsetConverterClass.class
    where type 'a converter_class = 'a GioConverterClass.class
    where type 'a initable_class = 'a GioInitableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_charset_converter_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgio "g_charset_converter_new")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioCharsetConverterClass.PolyML.cPtr
          )
      val getNumFallbacks_ = call (load_sym libgio "g_charset_converter_get_num_fallbacks") (GioCharsetConverterClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getUseFallback_ = call (load_sym libgio "g_charset_converter_get_use_fallback") (GioCharsetConverterClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setUseFallback_ = call (load_sym libgio "g_charset_converter_set_use_fallback") (GioCharsetConverterClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioCharsetConverterClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type t = base class
    fun asConverter self = (GObjectObjectClass.FFI.withPtr ---> GioConverterClass.FFI.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.FFI.withPtr ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new toCharset fromCharset =
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
