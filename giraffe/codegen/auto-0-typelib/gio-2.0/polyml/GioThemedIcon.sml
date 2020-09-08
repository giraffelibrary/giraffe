structure GioThemedIcon :>
  GIO_THEMED_ICON
    where type 'a class = 'a GioThemedIconClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_themed_icon_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_themed_icon_new") (Utf8.PolyML.cInPtr --> GioThemedIconClass.PolyML.cPtr)
      val newFromNames_ = call (getSymbol "g_themed_icon_new_from_names") (Utf8CPtrArrayN.PolyML.cInPtr &&> GInt32.PolyML.cVal --> GioThemedIconClass.PolyML.cPtr)
      val newWithDefaultFallbacks_ = call (getSymbol "g_themed_icon_new_with_default_fallbacks") (Utf8.PolyML.cInPtr --> GioThemedIconClass.PolyML.cPtr)
      val appendName_ = call (getSymbol "g_themed_icon_append_name") (GioThemedIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val getNames_ = call (getSymbol "g_themed_icon_get_names") (GioThemedIconClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val prependName_ = call (getSymbol "g_themed_icon_prepend_name") (GioThemedIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GioThemedIconClass.class
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new iconname = (Utf8.FFI.withPtr 0 ---> GioThemedIconClass.FFI.fromPtr true) new_ iconname
    fun newFromNames iconnames =
      let
        val len = LargeInt.fromInt (Utf8CPtrArrayN.length iconnames)
        val retVal = (Utf8CPtrArrayN.FFI.withPtr 0 &&&> GInt32.FFI.withVal ---> GioThemedIconClass.FFI.fromPtr true) newFromNames_ (iconnames & len)
      in
        retVal
      end
    fun newWithDefaultFallbacks iconname = (Utf8.FFI.withPtr 0 ---> GioThemedIconClass.FFI.fromPtr true) newWithDefaultFallbacks_ iconname
    fun appendName self iconname = (GioThemedIconClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) appendName_ (self & iconname)
    fun getNames self = (GioThemedIconClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 0) getNames_ self
    fun prependName self iconname = (GioThemedIconClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) prependName_ (self & iconname)
    local
      open ValueAccessor
    in
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val useDefaultFallbacksProp =
        {
          name = "use-default-fallbacks",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
    end
  end
