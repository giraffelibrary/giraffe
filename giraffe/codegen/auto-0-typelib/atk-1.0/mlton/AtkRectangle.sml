structure AtkRectangle :>
  ATK_RECTANGLE
    where type t = AtkRectangleRecord.t =
  struct
    val getType_ = _import "atk_rectangle_get_type" : unit -> GObjectType.FFI.val_;
    type t = AtkRectangleRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
