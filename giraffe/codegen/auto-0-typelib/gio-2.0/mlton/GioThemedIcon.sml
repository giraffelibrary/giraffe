structure GioThemedIcon :>
  GIO_THEMED_ICON
    where type 'a class = 'a GioThemedIconClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    val getType_ = _import "g_themed_icon_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_themed_icon_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioThemedIconClass.FFI.non_opt GioThemedIconClass.FFI.p;
    val newFromNames_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_themed_icon_new_from_names" :
              Utf8CPtrArrayN.MLton.p1
               * Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.MLton.p2
               * GInt32.FFI.val_
               -> GioThemedIconClass.FFI.non_opt GioThemedIconClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newWithDefaultFallbacks_ = _import "mlton_g_themed_icon_new_with_default_fallbacks" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioThemedIconClass.FFI.non_opt GioThemedIconClass.FFI.p;
    val appendName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_themed_icon_append_name" :
              GioThemedIconClass.FFI.non_opt GioThemedIconClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getNames_ = _import "g_themed_icon_get_names" : GioThemedIconClass.FFI.non_opt GioThemedIconClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val prependName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_themed_icon_prepend_name" :
              GioThemedIconClass.FFI.non_opt GioThemedIconClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
      open Property
    in
      val nameProp = {new = fn x => new "name" stringOpt x}
      val useDefaultFallbacksProp =
        {
          get = fn x => get "use-default-fallbacks" boolean x,
          new = fn x => new "use-default-fallbacks" boolean x
        }
    end
  end
