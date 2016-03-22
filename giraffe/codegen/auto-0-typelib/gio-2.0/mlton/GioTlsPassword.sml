structure GioTlsPassword :>
  GIO_TLS_PASSWORD
    where type 'a class = 'a GioTlsPasswordClass.class
    where type tls_password_flags_t = GioTlsPasswordFlags.t =
  struct
    val getType_ = _import "g_tls_password_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_tls_password_new" :
              GioTlsPasswordFlags.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioTlsPasswordClass.C.notnull GioTlsPasswordClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDescription_ = _import "g_tls_password_get_description" : GioTlsPasswordClass.C.notnull GioTlsPasswordClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getFlags_ = _import "g_tls_password_get_flags" : GioTlsPasswordClass.C.notnull GioTlsPasswordClass.C.p -> GioTlsPasswordFlags.C.val_;
    val getWarning_ = _import "g_tls_password_get_warning" : GioTlsPasswordClass.C.notnull GioTlsPasswordClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val setDescription_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_tls_password_set_description" :
              GioTlsPasswordClass.C.notnull GioTlsPasswordClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFlags_ = fn x1 & x2 => (_import "g_tls_password_set_flags" : GioTlsPasswordClass.C.notnull GioTlsPasswordClass.C.p * GioTlsPasswordFlags.C.val_ -> unit;) (x1, x2)
    val setWarning_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_tls_password_set_warning" :
              GioTlsPasswordClass.C.notnull GioTlsPasswordClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new flags description = (GioTlsPasswordFlags.C.withVal &&&> Utf8.C.withPtr ---> GioTlsPasswordClass.C.fromPtr true) new_ (flags & description)
    fun getDescription self = (GioTlsPasswordClass.C.withPtr ---> Utf8.C.fromPtr false) getDescription_ self
    fun getFlags self = (GioTlsPasswordClass.C.withPtr ---> GioTlsPasswordFlags.C.fromVal) getFlags_ self
    fun getWarning self = (GioTlsPasswordClass.C.withPtr ---> Utf8.C.fromPtr false) getWarning_ self
    fun setDescription self description = (GioTlsPasswordClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDescription_ (self & description)
    fun setFlags self flags = (GioTlsPasswordClass.C.withPtr &&&> GioTlsPasswordFlags.C.withVal ---> I) setFlags_ (self & flags)
    fun setWarning self warning = (GioTlsPasswordClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setWarning_ (self & warning)
    local
      open Property
    in
      val descriptionProp =
        {
          get = fn x => get "description" stringOpt x,
          set = fn x => set "description" stringOpt x
        }
      val flagsProp =
        {
          get = fn x => get "flags" GioTlsPasswordFlags.t x,
          set = fn x => set "flags" GioTlsPasswordFlags.t x
        }
      val warningProp =
        {
          get = fn x => get "warning" stringOpt x,
          set = fn x => set "warning" stringOpt x
        }
    end
  end
