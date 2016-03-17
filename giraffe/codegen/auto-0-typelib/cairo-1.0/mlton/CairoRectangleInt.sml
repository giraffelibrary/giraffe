structure CairoRectangleInt :>
  CAIRO_RECTANGLE_INT
    where type t = CairoRectangleIntRecord.t =
  struct
    val getType_ = _import "cairo_gobject_rectangle_int_get_type" : unit -> GObjectType.C.val_;
    type t = CairoRectangleIntRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
