structure AtkRectangle :>
  ATK_RECTANGLE
    where type t = AtkRectangleRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_rectangle_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type t = AtkRectangleRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
