structure GioTlsPassword :>
  GIO_TLS_PASSWORD
    where type 'a class = 'a GioTlsPasswordClass.class
    where type tls_password_flags_t = GioTlsPasswordFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_password_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_tls_password_new") (GioTlsPasswordFlags.PolyML.cVal &&> Utf8.PolyML.cInPtr --> GioTlsPasswordClass.PolyML.cPtr)
      val getDescription_ = call (load_sym libgio "g_tls_password_get_description") (GioTlsPasswordClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (load_sym libgio "g_tls_password_get_flags") (GioTlsPasswordClass.PolyML.cPtr --> GioTlsPasswordFlags.PolyML.cVal)
      val getWarning_ = call (load_sym libgio "g_tls_password_get_warning") (GioTlsPasswordClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setDescription_ = call (load_sym libgio "g_tls_password_set_description") (GioTlsPasswordClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setFlags_ = call (load_sym libgio "g_tls_password_set_flags") (GioTlsPasswordClass.PolyML.cPtr &&> GioTlsPasswordFlags.PolyML.cVal --> PolyMLFFI.cVoid)
      val setWarning_ = call (load_sym libgio "g_tls_password_set_warning") (GioTlsPasswordClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
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
