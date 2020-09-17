structure GioTlsPassword :>
  GIO_TLS_PASSWORD
    where type 'a class = 'a GioTlsPasswordClass.class
    where type tls_password_flags_t = GioTlsPasswordFlags.t =
  struct
    val getType_ = _import "g_tls_password_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_tls_password_new" :
              GioTlsPasswordFlags.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioTlsPasswordClass.FFI.non_opt GioTlsPasswordClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDescription_ = _import "g_tls_password_get_description" : GioTlsPasswordClass.FFI.non_opt GioTlsPasswordClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getFlags_ = _import "g_tls_password_get_flags" : GioTlsPasswordClass.FFI.non_opt GioTlsPasswordClass.FFI.p -> GioTlsPasswordFlags.FFI.val_;
    val getWarning_ = _import "g_tls_password_get_warning" : GioTlsPasswordClass.FFI.non_opt GioTlsPasswordClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val setDescription_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_tls_password_set_description" :
              GioTlsPasswordClass.FFI.non_opt GioTlsPasswordClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFlags_ = fn x1 & x2 => (_import "g_tls_password_set_flags" : GioTlsPasswordClass.FFI.non_opt GioTlsPasswordClass.FFI.p * GioTlsPasswordFlags.FFI.val_ -> unit;) (x1, x2)
    val setWarning_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_tls_password_set_warning" :
              GioTlsPasswordClass.FFI.non_opt GioTlsPasswordClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioTlsPasswordClass.class
    type tls_password_flags_t = GioTlsPasswordFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (flags, description) = (GioTlsPasswordFlags.FFI.withVal &&&> Utf8.FFI.withPtr 0 ---> GioTlsPasswordClass.FFI.fromPtr true) new_ (flags & description)
    fun getDescription self = (GioTlsPasswordClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDescription_ self before GioTlsPasswordClass.FFI.touchPtr self
    fun getFlags self = (GioTlsPasswordClass.FFI.withPtr false ---> GioTlsPasswordFlags.FFI.fromVal) getFlags_ self
    fun getWarning self = (GioTlsPasswordClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getWarning_ self before GioTlsPasswordClass.FFI.touchPtr self
    fun setDescription self description = (GioTlsPasswordClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setDescription_ (self & description)
    fun setFlags self flags = (GioTlsPasswordClass.FFI.withPtr false &&&> GioTlsPasswordFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun setWarning self warning = (GioTlsPasswordClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setWarning_ (self & warning)
    local
      open ValueAccessor
    in
      val descriptionProp =
        {
          name = "description",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val flagsProp =
        {
          name = "flags",
          gtype = fn () => C.gtype GioTlsPasswordFlags.t (),
          get = fn x => fn () => C.get GioTlsPasswordFlags.t x,
          set = fn x => C.set GioTlsPasswordFlags.t x,
          init = fn x => C.set GioTlsPasswordFlags.t x
        }
      val warningProp =
        {
          name = "warning",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
