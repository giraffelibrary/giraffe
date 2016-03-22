structure GtkEntryCompletionClass :>
  GTK_ENTRY_COMPLETION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a entry_completion = unit
    type 'a class = 'a entry_completion class
  end
