structure GioTlsPassword :>
  GIO_TLS_PASSWORD
    where type 'a class_t = 'a GioTlsPasswordClass.t
    where type tls_password_flags_t = GioTlsPasswordFlags.t =
  struct
    val getType_ = _import "g_tls_password_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_tls_password_new" :
              GioTlsPasswordFlags.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDescription_ = _import "g_tls_password_get_description" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getFlags_ = _import "g_tls_password_get_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioTlsPasswordFlags.C.val_;
    val getWarning_ = _import "g_tls_password_get_warning" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val setDescription_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_tls_password_set_description" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFlags_ = fn x1 & x2 => (_import "g_tls_password_set_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioTlsPasswordFlags.C.val_ -> unit;) (x1, x2)
    val setWarning_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_tls_password_set_warning" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioTlsPasswordClass.t
    type tls_password_flags_t = GioTlsPasswordFlags.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new flags description = (GioTlsPasswordFlags.C.withVal &&&> FFI.String.C.withConstPtr ---> GioTlsPasswordClass.C.fromPtr true) new_ (flags & description)
    fun getDescription self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDescription_ self
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GioTlsPasswordFlags.C.fromVal) getFlags_ self
    fun getWarning self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getWarning_ self
    fun setDescription self description = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setDescription_ (self & description)
    fun setFlags self flags = (GObjectObjectClass.C.withPtr &&&> GioTlsPasswordFlags.C.withVal ---> I) setFlags_ (self & flags)
    fun setWarning self warning = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setWarning_ (self & warning)
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
