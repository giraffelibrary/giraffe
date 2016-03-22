structure GtkClipboardClass :>
  GTK_CLIPBOARD_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a clipboard = unit
    type 'a class = 'a clipboard class
  end
