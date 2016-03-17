structure GtkVScrollbarClass :>
  GTK_V_SCROLLBAR_CLASS
    where type 'a scrollbar_class = 'a GtkScrollbarClass.class
    where type C.notnull = GtkScrollbarClass.C.notnull
    where type 'a C.p = 'a GtkScrollbarClass.C.p =
  struct
    type 'a v_scrollbar = unit
    type 'a scrollbar_class = 'a GtkScrollbarClass.class
    type 'a class = 'a v_scrollbar scrollbar_class
    type t = base class
    fun toBase obj = obj
    val t = GtkScrollbarClass.t
    val tOpt = GtkScrollbarClass.tOpt
    structure C = GtkScrollbarClass.C
  end
