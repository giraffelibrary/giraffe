structure AtkTextRange :>
  ATK_TEXT_RANGE
    where type t = AtkTextRangeRecord.t =
  struct
    val getType_ = _import "atk_text_range_get_type" : unit -> GObjectType.FFI.val_;
    type t = AtkTextRangeRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
