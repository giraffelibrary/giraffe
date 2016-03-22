structure GtkSourceLanguageManagerClass :>
  GTK_SOURCE_LANGUAGE_MANAGER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a language_manager = unit
    type 'a class = 'a language_manager class
  end
