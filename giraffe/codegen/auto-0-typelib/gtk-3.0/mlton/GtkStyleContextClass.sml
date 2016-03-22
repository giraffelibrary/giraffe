structure GtkStyleContextClass :>
  GTK_STYLE_CONTEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a style_context = unit
    type 'a class = 'a style_context class
  end
