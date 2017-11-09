(* Copyright (C) 2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectValueRecord : G_OBJECT_VALUE_RECORD =
  struct
    open GObject.ValueRecord
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_value_get_type") (cVoid --> GObject.Type.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_boxed") (GObject.ValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_boxed") (GObject.ValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_boxed") (GObject.ValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_boxed") (GObject.ValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
    type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObject.Type.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObject.Type.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
