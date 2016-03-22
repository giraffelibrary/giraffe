structure GtkVSeparatorClass :>
  GTK_V_SEPARATOR_CLASS
    where type 'a separator_class = 'a GtkSeparatorClass.class
    where type C.notnull = GtkSeparatorClass.C.notnull
    where type 'a C.p = 'a GtkSeparatorClass.C.p =
  struct
    type 'a separator_class = 'a GtkSeparatorClass.class
    open GtkSeparatorClass
    type 'a v_separator = unit
    type 'a class = 'a v_separator class
  end
