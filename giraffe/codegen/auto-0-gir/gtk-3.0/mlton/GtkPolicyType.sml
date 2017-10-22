structure GtkPolicyType :> GTK_POLICY_TYPE =
  struct
    datatype enum =
      ALWAYS
    | AUTOMATIC
    | NEVER
    | EXTERNAL
    structure Enum =
      Enum(
        type enum = enum
        val null = ALWAYS
        val toInt =
          fn
            ALWAYS => 0
          | AUTOMATIC => 1
          | NEVER => 2
          | EXTERNAL => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => ALWAYS
          | 1 => AUTOMATIC
          | 2 => NEVER
          | 3 => EXTERNAL
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_policy_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
