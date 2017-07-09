structure GioThemedIcon :>
  GIO_THEMED_ICON
    where type 'a class = 'a GioThemedIconClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_themed_icon_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_themed_icon_new") (Utf8.PolyML.cInPtr --> GioIconClass.PolyML.cPtr)
      val newFromNames_ = call (getSymbol "g_themed_icon_new_from_names") (Utf8CVectorN.PolyML.cInPtr &&> GInt32.PolyML.cVal --> GioIconClass.PolyML.cPtr)
      val newWithDefaultFallbacks_ = call (getSymbol "g_themed_icon_new_with_default_fallbacks") (Utf8.PolyML.cInPtr --> GioIconClass.PolyML.cPtr)
      val appendName_ = call (getSymbol "g_themed_icon_append_name") (GioThemedIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val getNames_ = call (getSymbol "g_themed_icon_get_names") (GioThemedIconClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val prependName_ = call (getSymbol "g_themed_icon_prepend_name") (GioThemedIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GioThemedIconClass.class
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new iconname = (Utf8.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) new_ iconname
    fun newFromNames iconnames =
      let
        val len = LargeInt.fromInt (Utf8CVectorN.length iconnames)
        val retVal = (Utf8CVectorN.FFI.withPtr &&&> GInt32.FFI.withVal ---> GioIconClass.FFI.fromPtr true) newFromNames_ (iconnames & len)
      in
        retVal
      end
    fun newWithDefaultFallbacks iconname = (Utf8.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) newWithDefaultFallbacks_ iconname
    fun appendName self iconname = (GioThemedIconClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) appendName_ (self & iconname)
    fun getNames self = (GioThemedIconClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getNames_ self
    fun prependName self iconname = (GioThemedIconClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) prependName_ (self & iconname)
    local
      open Property
    in
      val nameProp = {set = fn x => set "name" stringOpt x}
      val useDefaultFallbacksProp =
        {
          get = fn x => get "use-default-fallbacks" boolean x,
          set = fn x => set "use-default-fallbacks" boolean x
        }
    end
  end
