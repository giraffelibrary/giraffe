structure CairoRectangleInt :>
  CAIRO_RECTANGLE_INT
    where type t = CairoRectangleIntRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libcairogobject "cairo_gobject_rectangle_int_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type t = CairoRectangleIntRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
