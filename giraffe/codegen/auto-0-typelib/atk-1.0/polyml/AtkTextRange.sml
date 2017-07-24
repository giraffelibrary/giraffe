structure AtkTextRange :>
  ATK_TEXT_RANGE
    where type t = AtkTextRangeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_text_range_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type t = AtkTextRangeRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
