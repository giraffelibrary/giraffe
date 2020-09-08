structure GioCharsetConverter :>
  GIO_CHARSET_CONVERTER
    where type 'a class = 'a GioCharsetConverterClass.class
    where type 'a converter_class = 'a GioConverterClass.class
    where type 'a initable_class = 'a GioInitableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_charset_converter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_charset_converter_new")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioCharsetConverterClass.PolyML.cPtr
          )
      val getNumFallbacks_ = call (getSymbol "g_charset_converter_get_num_fallbacks") (GioCharsetConverterClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getUseFallback_ = call (getSymbol "g_charset_converter_get_use_fallback") (GioCharsetConverterClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setUseFallback_ = call (getSymbol "g_charset_converter_set_use_fallback") (GioCharsetConverterClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioCharsetConverterClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type t = base class
    fun asConverter self = (GObjectObjectClass.FFI.withPtr false ---> GioConverterClass.FFI.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.FFI.withPtr false ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (toCharset, fromCharset) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GioCharsetConverterClass.FFI.fromPtr true
      )
        new_
        (
          toCharset
           & fromCharset
           & []
        )
    fun getNumFallbacks self = (GioCharsetConverterClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getNumFallbacks_ self
    fun getUseFallback self = (GioCharsetConverterClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseFallback_ self
    fun setUseFallback self useFallback = (GioCharsetConverterClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseFallback_ (self & useFallback)
    local
      open ValueAccessor
    in
      val fromCharsetProp =
        {
          name = "from-charset",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val toCharsetProp =
        {
          name = "to-charset",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val useFallbackProp =
        {
          name = "use-fallback",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
