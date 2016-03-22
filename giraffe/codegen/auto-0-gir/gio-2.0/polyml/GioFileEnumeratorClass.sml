structure GioFileEnumeratorClass :>
  GIO_FILE_ENUMERATOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a file_enumerator = unit
    type 'a class = 'a file_enumerator class
  end
