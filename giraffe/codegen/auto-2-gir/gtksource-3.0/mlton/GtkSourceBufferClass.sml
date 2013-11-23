structure GtkSourceBufferClass :>
  GTK_SOURCE_BUFFER_CLASS
    where type C.notnull = GtkTextBufferClass.C.notnull
    where type 'a C.p = 'a GtkTextBufferClass.C.p =
  struct
    type 'a buffer = unit
    type 'a t = 'a buffer GtkTextBufferClass.t
    fun toBase obj = obj
    val t = GtkTextBufferClass.t
    val tOpt = GtkTextBufferClass.tOpt
    structure C = GtkTextBufferClass.C
  end
