structure GtkSourceSearchContextClass :>
  GTK_SOURCE_SEARCH_CONTEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a search_context = unit
    type 'a class = 'a search_context class
  end
