structure GioThemedIcon :>
  GIO_THEMED_ICON
    where type 'a class = 'a GioThemedIconClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_themed_icon_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_themed_icon_new") (Utf8.PolyML.cInPtr --> GioIconClass.PolyML.cPtr)
      val newWithDefaultFallbacks_ = call (load_sym libgio "g_themed_icon_new_with_default_fallbacks") (Utf8.PolyML.cInPtr --> GioIconClass.PolyML.cPtr)
      val appendName_ = call (load_sym libgio "g_themed_icon_append_name") (GioThemedIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val prependName_ = call (load_sym libgio "g_themed_icon_prepend_name") (GioThemedIconClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioThemedIconClass.class
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new iconname = (Utf8.C.withPtr ---> GioIconClass.C.fromPtr true) new_ iconname
    fun newWithDefaultFallbacks iconname = (Utf8.C.withPtr ---> GioIconClass.C.fromPtr true) newWithDefaultFallbacks_ iconname
    fun appendName self iconname = (GioThemedIconClass.C.withPtr &&&> Utf8.C.withPtr ---> I) appendName_ (self & iconname)
    fun prependName self iconname = (GioThemedIconClass.C.withPtr &&&> Utf8.C.withPtr ---> I) prependName_ (self & iconname)
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
