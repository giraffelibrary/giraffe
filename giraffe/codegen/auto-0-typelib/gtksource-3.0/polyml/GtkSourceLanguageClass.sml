structure GtkSourceLanguageClass :>
  GTK_SOURCE_LANGUAGE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a language = unit
    type 'a class = 'a language class
  end
