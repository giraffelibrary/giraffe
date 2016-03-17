structure GtkScrollbarClass :>
  GTK_SCROLLBAR_CLASS
    where type 'a range_class = 'a GtkRangeClass.class
    where type C.notnull = GtkRangeClass.C.notnull
    where type 'a C.p = 'a GtkRangeClass.C.p =
  struct
    type 'a scrollbar = unit
    type 'a range_class = 'a GtkRangeClass.class
    type 'a class = 'a scrollbar range_class
    type t = base class
    fun toBase obj = obj
    val t = GtkRangeClass.t
    val tOpt = GtkRangeClass.tOpt
    structure C = GtkRangeClass.C
  end
