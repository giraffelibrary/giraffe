structure GdkWindowAttributesType :> GDK_WINDOW_ATTRIBUTES_TYPE =
  struct
    val TITLE = 0w2
    val X = 0w4
    val Y = 0w8
    val CURSOR = 0w16
    val VISUAL = 0w32
    val WMCLASS = 0w64
    val NOREDIR = 0w128
    val TYPE_HINT = 0w256
    val allFlags =
      [
        TITLE,
        X,
        Y,
        CURSOR,
        VISUAL,
        WMCLASS,
        NOREDIR,
        TYPE_HINT
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gdk_window_attributes_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
