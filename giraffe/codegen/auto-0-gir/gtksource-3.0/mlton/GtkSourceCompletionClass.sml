structure GtkSourceCompletionClass :>
  GTK_SOURCE_COMPLETION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a completion = unit
    type 'a class = 'a completion class
  end
