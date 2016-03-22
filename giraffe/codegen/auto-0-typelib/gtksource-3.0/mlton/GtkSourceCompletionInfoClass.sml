structure GtkSourceCompletionInfoClass :>
  GTK_SOURCE_COMPLETION_INFO_CLASS
    where type C.notnull = GtkWindowClass.C.notnull
    where type 'a C.p = 'a GtkWindowClass.C.p =
  struct
    open GtkWindowClass
    type 'a completion_info = unit
    type 'a class = 'a completion_info class
  end
