structure CairoRectangleInt :>
  CAIRO_RECTANGLE_INT
    where type t = CairoRectangleIntRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libcairogobject "cairo_gobject_rectangle_int_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type t = CairoRectangleIntRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
