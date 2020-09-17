structure GioTlsPassword :>
  GIO_TLS_PASSWORD
    where type 'a class = 'a GioTlsPasswordClass.class
    where type tls_password_flags_t = GioTlsPasswordFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tls_password_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_tls_password_new") (GioTlsPasswordFlags.PolyML.cVal &&> Utf8.PolyML.cInPtr --> GioTlsPasswordClass.PolyML.cPtr)
      val getDescription_ = call (getSymbol "g_tls_password_get_description") (GioTlsPasswordClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (getSymbol "g_tls_password_get_flags") (GioTlsPasswordClass.PolyML.cPtr --> GioTlsPasswordFlags.PolyML.cVal)
      val getWarning_ = call (getSymbol "g_tls_password_get_warning") (GioTlsPasswordClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setDescription_ = call (getSymbol "g_tls_password_set_description") (GioTlsPasswordClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setFlags_ = call (getSymbol "g_tls_password_set_flags") (GioTlsPasswordClass.PolyML.cPtr &&> GioTlsPasswordFlags.PolyML.cVal --> cVoid)
      val setWarning_ = call (getSymbol "g_tls_password_set_warning") (GioTlsPasswordClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
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
