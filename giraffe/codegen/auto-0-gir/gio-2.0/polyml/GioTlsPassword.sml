structure GioTlsPassword :>
  GIO_TLS_PASSWORD
    where type 'a class_t = 'a GioTlsPasswordClass.t
    where type tls_password_flags_t = GioTlsPasswordFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_password_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_tls_password_new") (GioTlsPasswordFlags.PolyML.cVal &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDescription_ = call (load_sym libgio "g_tls_password_get_description") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (load_sym libgio "g_tls_password_get_flags") (GObjectObjectClass.PolyML.cPtr --> GioTlsPasswordFlags.PolyML.cVal)
      val getWarning_ = call (load_sym libgio "g_tls_password_get_warning") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setDescription_ = call (load_sym libgio "g_tls_password_set_description") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setFlags_ = call (load_sym libgio "g_tls_password_set_flags") (GObjectObjectClass.PolyML.cPtr &&> GioTlsPasswordFlags.PolyML.cVal --> FFI.PolyML.cVoid)
      val setWarning_ = call (load_sym libgio "g_tls_password_set_warning") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GioTlsPasswordClass.t
    type tls_password_flags_t = GioTlsPasswordFlags.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new flags description = (GioTlsPasswordFlags.C.withVal &&&> Utf8.C.withPtr ---> GioTlsPasswordClass.C.fromPtr true) new_ (flags & description)
    fun getDescription self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDescription_ self
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GioTlsPasswordFlags.C.fromVal) getFlags_ self
    fun getWarning self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getWarning_ self
    fun setDescription self description = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDescription_ (self & description)
    fun setFlags self flags = (GObjectObjectClass.C.withPtr &&&> GioTlsPasswordFlags.C.withVal ---> I) setFlags_ (self & flags)
    fun setWarning self warning = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setWarning_ (self & warning)
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
