structure GtkTextBufferClass :>
  GTK_TEXT_BUFFER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a text_buffer = unit
    type 'a class = 'a text_buffer class
  end
