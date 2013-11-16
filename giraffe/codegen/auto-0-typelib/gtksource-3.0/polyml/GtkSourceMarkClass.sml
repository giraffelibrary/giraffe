structure GtkSourceMarkClass :>
  GTK_SOURCE_MARK_CLASS
    where type C.notnull = GtkTextMarkClass.C.notnull
    where type 'a C.p = 'a GtkTextMarkClass.C.p =
  struct
    type 'a mark = unit
    type 'a t = 'a mark GtkTextMarkClass.t
    fun toBase obj = obj
    val t = GtkTextMarkClass.t
    val tOpt = GtkTextMarkClass.tOpt
    structure C = GtkTextMarkClass.C
  end
