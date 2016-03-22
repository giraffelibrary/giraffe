structure GtkEntryBufferClass :>
  GTK_ENTRY_BUFFER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a entry_buffer = unit
    type 'a class = 'a entry_buffer class
  end
