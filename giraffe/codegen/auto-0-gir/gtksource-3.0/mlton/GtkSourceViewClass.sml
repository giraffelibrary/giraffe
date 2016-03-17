structure GtkSourceViewClass :>
  GTK_SOURCE_VIEW_CLASS
    where type C.notnull = GtkTextViewClass.C.notnull
    where type 'a C.p = 'a GtkTextViewClass.C.p =
  struct
    type 'a view = unit
    type 'a class = 'a view GtkTextViewClass.class
    type t = base class
    fun toBase obj = obj
    val t = GtkTextViewClass.t
    val tOpt = GtkTextViewClass.tOpt
    structure C = GtkTextViewClass.C
  end
