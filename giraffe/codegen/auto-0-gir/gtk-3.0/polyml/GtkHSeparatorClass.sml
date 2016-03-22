structure GtkHSeparatorClass :>
  GTK_H_SEPARATOR_CLASS
    where type 'a separator_class = 'a GtkSeparatorClass.class
    where type C.notnull = GtkSeparatorClass.C.notnull
    where type 'a C.p = 'a GtkSeparatorClass.C.p =
  struct
    type 'a separator_class = 'a GtkSeparatorClass.class
    open GtkSeparatorClass
    type 'a h_separator = unit
    type 'a class = 'a h_separator class
  end
