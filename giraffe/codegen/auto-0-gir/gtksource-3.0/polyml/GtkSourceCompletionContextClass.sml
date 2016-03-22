structure GtkSourceCompletionContextClass :>
  GTK_SOURCE_COMPLETION_CONTEXT_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    open GObjectInitiallyUnownedClass
    type 'a completion_context = unit
    type 'a class = 'a completion_context class
  end
