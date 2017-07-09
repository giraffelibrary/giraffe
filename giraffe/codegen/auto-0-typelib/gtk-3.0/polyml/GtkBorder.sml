structure GtkBorder :>
  GTK_BORDER
    where type t = GtkBorderRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_border_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_border_new") (cVoid --> GtkBorderRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "gtk_border_copy") (GtkBorderRecord.PolyML.cPtr --> GtkBorderRecord.PolyML.cPtr)
    end
    type t = GtkBorderRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkBorderRecord.FFI.fromPtr true) new_ ()
    fun copy self = (GtkBorderRecord.FFI.withPtr ---> GtkBorderRecord.FFI.fromPtr true) copy_ self
  end
