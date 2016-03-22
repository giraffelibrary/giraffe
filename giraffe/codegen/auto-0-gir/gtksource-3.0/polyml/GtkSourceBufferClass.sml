structure GtkSourceBufferClass :>
  GTK_SOURCE_BUFFER_CLASS
    where type C.notnull = GtkTextBufferClass.C.notnull
    where type 'a C.p = 'a GtkTextBufferClass.C.p =
  struct
    open GtkTextBufferClass
    type 'a buffer = unit
    type 'a class = 'a buffer class
  end
