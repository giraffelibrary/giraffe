structure GioThemedIcon :>
  GIO_THEMED_ICON
    where type 'a class_t = 'a GioThemedIconClass.t
    where type 'a iconclass_t = 'a GioIconClass.t =
  struct
    val getType_ = _import "g_themed_icon_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_g_themed_icon_new" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithDefaultFallbacks_ = _import "mlton_g_themed_icon_new_with_default_fallbacks" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val appendName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_themed_icon_append_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
