structure GioTlsInteractionClass :>
  GIO_TLS_INTERACTION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tls_interaction = unit
    type 'a class = 'a tls_interaction class
  end
