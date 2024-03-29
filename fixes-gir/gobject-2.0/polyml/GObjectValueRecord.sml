(* Copyright (C) 2017-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
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
      val getType_ = call (externalFunctionSymbol "g_value_get_type") (cVoid --> GObject.Type.PolyML.cVal)
    end
    val getType = (I ---> GObject.Type.FFI.fromVal) getType_
    local
      open PolyMLFFI
    in
      val getValue_ = call (externalFunctionSymbol "g_value_get_boxed") (GObject.ValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (externalFunctionSymbol "g_value_get_boxed") (GObject.ValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (externalFunctionSymbol "g_value_set_boxed") (GObject.ValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (externalFunctionSymbol "g_value_set_boxed") (GObject.ValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
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
