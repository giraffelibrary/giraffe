(* Copyright (C) 2017-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectValueRecord : G_OBJECT_VALUE_RECORD =
  struct
    open GObject.ValueRecord
    val getType_ = _import "g_value_get_type" : unit -> GObject.Type.FFI.val_;
    val getType = (I ---> GObject.Type.FFI.fromVal) getType_
    val getValue_ = _import "g_value_get_boxed" : GObject.ValueRecord.FFI.non_opt GObject.ValueRecord.FFI.p -> FFI.non_opt FFI.p;
    val getOptValue_ = _import "g_value_get_boxed" : GObject.ValueRecord.FFI.non_opt GObject.ValueRecord.FFI.p -> FFI.opt FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_boxed" : GObject.ValueRecord.FFI.non_opt GObject.ValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_boxed" : GObject.ValueRecord.FFI.non_opt GObject.ValueRecord.FFI.p * FFI.opt FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = getType,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr false ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = getType,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
        }
  end
