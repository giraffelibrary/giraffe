structure GtkApplicationClass :>
  GTK_APPLICATION_CLASS
    where type C.notnull = GioApplicationClass.C.notnull
    where type 'a C.p = 'a GioApplicationClass.C.p =
  struct
    open GioApplicationClass
    type 'a application = unit
    type 'a class = 'a application class
  end
