structure GioCharsetConverterClass :>
  GIO_CHARSET_CONVERTER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a charset_converter = unit
    type 'a class = 'a charset_converter class
  end
