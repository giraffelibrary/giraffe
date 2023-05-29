(* Copyright (C) 2012, 2016-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectValueRecord :> G_OBJECT_VALUE_RECORD =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val getType_ = call (externalFunctionSymbol "g_value_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      open PolyMLFFI
    in
      val size_ = call (externalFunctionSymbol "giraffe_g_object_value_size") (cVoid --> GSize.PolyML.cVal)
      val copy_ = call (externalFunctionSymbol "giraffe_g_value_copy") (cPtr &&> cPtr --> cVoid)
      val clear_ = call (externalFunctionSymbol "giraffe_g_value_clear") (cPtr --> cVoid)
    end
    structure Record =
      BoxedValueRecord(
        structure Pointer = Pointer
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p
        val copy_ = copy_
        val clear_ = clear_
        val size_ = size_
        val getTypeName = GObjectType.name o getType
      )
    open Record
  end
