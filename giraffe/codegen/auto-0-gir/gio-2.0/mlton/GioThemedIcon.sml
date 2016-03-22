structure GioThemedIcon :>
  GIO_THEMED_ICON
    where type 'a class = 'a GioThemedIconClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    val getType_ = _import "g_themed_icon_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_g_themed_icon_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GioIconClass.C.notnull GioIconClass.C.p;
    val newWithDefaultFallbacks_ = _import "mlton_g_themed_icon_new_with_default_fallbacks" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GioIconClass.C.notnull GioIconClass.C.p;
    val appendName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_themed_icon_append_name" :
              GioThemedIconClass.C.notnull GioThemedIconClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val prependName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_themed_icon_prepend_name" :
              GioThemedIconClass.C.notnull GioThemedIconClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
