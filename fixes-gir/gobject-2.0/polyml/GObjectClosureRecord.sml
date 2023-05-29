(* Copyright (C) 2013, 2015-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectClosureRecord :> G_OBJECT_CLOSURE_RECORD =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val getType_ = call (externalFunctionSymbol "g_closure_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      open PolyMLFFI
    in
      val ref_ =
        call
          (externalFunctionSymbol "g_closure_ref")
          (cPtr --> cPtr)
      val sink_ =
        call
          (externalFunctionSymbol "g_closure_sink")
          (cPtr --> cVoid)
      val dup_ =
        fn ptr => ref_ ptr before sink_ ptr  (* must do ref before sink *)
      val free_ =
        call
          (externalFunctionSymbol "g_closure_unref")
          (cPtr --> cVoid)
    end
    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
        val getTypeName = GObjectType.name o getType
      )
    open Record
    local
      open PolyMLFFI
    in
      val getValue_ = call (externalFunctionSymbol "g_value_get_boxed") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (externalFunctionSymbol "g_value_get_boxed") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (externalFunctionSymbol "g_value_set_boxed") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (externalFunctionSymbol "g_value_set_boxed") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
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
