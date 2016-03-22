structure GtkSourceCompletionProviderClass :>
  GTK_SOURCE_COMPLETION_PROVIDER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a completion_provider = unit
    type 'a class = 'a completion_provider class
  end
