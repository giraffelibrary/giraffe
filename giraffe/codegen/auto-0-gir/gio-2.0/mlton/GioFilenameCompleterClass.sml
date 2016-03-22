structure GioFilenameCompleterClass :>
  GIO_FILENAME_COMPLETER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a filename_completer = unit
    type 'a class = 'a filename_completer class
  end
