structure GioThemedIcon :>
  GIO_THEMED_ICON
    where type 'a class_t = 'a GioThemedIconClass.t
    where type 'a iconclass_t = 'a GioIconClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_themed_icon_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_themed_icon_new") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithDefaultFallbacks_ = call (load_sym libgio "g_themed_icon_new_with_default_fallbacks") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val appendName_ = call (load_sym libgio "g_themed_icon_append_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val prependName_ = call (load_sym libgio "g_themed_icon_prepend_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioThemedIconClass.t
    type 'a iconclass_t = 'a GioIconClass.t
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new iconname = (FFI.String.withConstPtr ---> GioIconClass.C.fromPtr true) new_ iconname
    fun newWithDefaultFallbacks iconname = (FFI.String.withConstPtr ---> GioIconClass.C.fromPtr true) newWithDefaultFallbacks_ iconname
    fun appendName self iconname = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) appendName_ (self & iconname)
    fun prependName self iconname = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) prependName_ (self & iconname)
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
