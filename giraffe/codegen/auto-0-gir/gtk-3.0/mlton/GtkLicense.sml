structure GtkLicense :> GTK_LICENSE =
  struct
    datatype enum =
      UNKNOWN
    | CUSTOM
    | GPL_2_0
    | GPL_3_0
    | LGPL_2_1
    | LGPL_3_0
    | BSD
    | MIT_X_11
    | ARTISTIC
    | GPL_2_0_ONLY
    | GPL_3_0_ONLY
    | LGPL_2_1_ONLY
    | LGPL_3_0_ONLY
    | AGPL_3_0
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN
        val toInt =
          fn
            UNKNOWN => 0
          | CUSTOM => 1
          | GPL_2_0 => 2
          | GPL_3_0 => 3
          | LGPL_2_1 => 4
          | LGPL_3_0 => 5
          | BSD => 6
          | MIT_X_11 => 7
          | ARTISTIC => 8
          | GPL_2_0_ONLY => 9
          | GPL_3_0_ONLY => 10
          | LGPL_2_1_ONLY => 11
          | LGPL_3_0_ONLY => 12
          | AGPL_3_0 => 13
        exception Value of GInt.t
        val fromInt =
          fn
            0 => UNKNOWN
          | 1 => CUSTOM
          | 2 => GPL_2_0
          | 3 => GPL_3_0
          | 4 => LGPL_2_1
          | 5 => LGPL_3_0
          | 6 => BSD
          | 7 => MIT_X_11
          | 8 => ARTISTIC
          | 9 => GPL_2_0_ONLY
          | 10 => GPL_3_0_ONLY
          | 11 => LGPL_2_1_ONLY
          | 12 => LGPL_3_0_ONLY
          | 13 => AGPL_3_0
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_license_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
