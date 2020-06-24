structure PangoFontMask :> PANGO_FONT_MASK =
  struct
    val FAMILY = 0w1
    val STYLE = 0w2
    val VARIANT = 0w4
    val WEIGHT = 0w8
    val STRETCH = 0w16
    val SIZE = 0w32
    val GRAVITY = 0w64
    val allFlags =
      [
        FAMILY,
        STYLE,
        VARIANT,
        WEIGHT,
        STRETCH,
        SIZE,
        GRAVITY
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "pango_font_mask_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
