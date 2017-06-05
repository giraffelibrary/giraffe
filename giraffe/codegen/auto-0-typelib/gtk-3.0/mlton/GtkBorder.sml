structure GtkBorder :>
  GTK_BORDER
    where type t = GtkBorderRecord.t =
  struct
    val getType_ = _import "gtk_border_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_border_new" : unit -> GtkBorderRecord.FFI.notnull GtkBorderRecord.FFI.p;
    val copy_ = _import "gtk_border_copy" : GtkBorderRecord.FFI.notnull GtkBorderRecord.FFI.p -> GtkBorderRecord.FFI.notnull GtkBorderRecord.FFI.p;
    type t = GtkBorderRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkBorderRecord.FFI.fromPtr true) new_ ()
    fun copy self = (GtkBorderRecord.FFI.withPtr ---> GtkBorderRecord.FFI.fromPtr true) copy_ self
  end
