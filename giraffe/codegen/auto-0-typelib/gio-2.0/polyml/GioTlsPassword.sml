structure GioTlsPassword :>
  GIO_TLS_PASSWORD
    where type 'a class = 'a GioTlsPasswordClass.class
    where type tls_password_flags_t = GioTlsPasswordFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tls_password_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_tls_password_new") (GioTlsPasswordFlags.PolyML.cVal &&> Utf8.PolyML.cInPtr --> GioTlsPasswordClass.PolyML.cPtr)
      val getDescription_ = call (getSymbol "g_tls_password_get_description") (GioTlsPasswordClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (getSymbol "g_tls_password_get_flags") (GioTlsPasswordClass.PolyML.cPtr --> GioTlsPasswordFlags.PolyML.cVal)
      val getWarning_ = call (getSymbol "g_tls_password_get_warning") (GioTlsPasswordClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setDescription_ = call (getSymbol "g_tls_password_set_description") (GioTlsPasswordClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setFlags_ = call (getSymbol "g_tls_password_set_flags") (GioTlsPasswordClass.PolyML.cPtr &&> GioTlsPasswordFlags.PolyML.cVal --> PolyMLFFI.cVoid)
      val setWarning_ = call (getSymbol "g_tls_password_set_warning") (GioTlsPasswordClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioTlsPasswordClass.class
    type tls_password_flags_t = GioTlsPasswordFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new flags description = (GioTlsPasswordFlags.FFI.withVal &&&> Utf8.FFI.withPtr ---> GioTlsPasswordClass.FFI.fromPtr true) new_ (flags & description)
    fun getDescription self = (GioTlsPasswordClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDescription_ self
    fun getFlags self = (GioTlsPasswordClass.FFI.withPtr ---> GioTlsPasswordFlags.FFI.fromVal) getFlags_ self
    fun getWarning self = (GioTlsPasswordClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getWarning_ self
    fun setDescription self description = (GioTlsPasswordClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setDescription_ (self & description)
    fun setFlags self flags = (GioTlsPasswordClass.FFI.withPtr &&&> GioTlsPasswordFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun setWarning self warning = (GioTlsPasswordClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setWarning_ (self & warning)
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
