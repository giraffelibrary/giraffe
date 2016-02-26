structure GtkBorder :>
  GTK_BORDER
    where type record_t = GtkBorderRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_border_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_border_new") (FFI.PolyML.cVoid --> GtkBorderRecord.PolyML.cPtr)
      val copy_ = call (load_sym libgtk "gtk_border_copy") (GtkBorderRecord.PolyML.cPtr --> GtkBorderRecord.PolyML.cPtr)
    end
    type record_t = GtkBorderRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkBorderRecord.C.fromPtr true) new_ ()
    fun copy self = (GtkBorderRecord.C.withPtr ---> GtkBorderRecord.C.fromPtr true) copy_ self
  end
