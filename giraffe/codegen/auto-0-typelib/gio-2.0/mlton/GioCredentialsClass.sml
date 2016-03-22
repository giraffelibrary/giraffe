structure GioCredentialsClass :>
  GIO_CREDENTIALS_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a credentials = unit
    type 'a class = 'a credentials class
  end
