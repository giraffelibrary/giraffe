structure GtkBorder :>
  GTK_BORDER
    where type t = GtkBorderRecord.t =
  struct
    val getType_ = _import "gtk_border_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_border_new" : unit -> GtkBorderRecord.C.notnull GtkBorderRecord.C.p;
    val copy_ = _import "gtk_border_copy" : GtkBorderRecord.C.notnull GtkBorderRecord.C.p -> GtkBorderRecord.C.notnull GtkBorderRecord.C.p;
    type t = GtkBorderRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkBorderRecord.C.fromPtr true) new_ ()
    fun copy self = (GtkBorderRecord.C.withPtr ---> GtkBorderRecord.C.fromPtr true) copy_ self
  end
