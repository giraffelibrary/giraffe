(* Copyright (C) 2013, 2015-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectParamSpecClass :>
  G_OBJECT_PARAM_SPEC_CLASS
    where type type_t = GObjectType.t =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    type ('a, 'b) r = ('a, 'b) Pointer.r

    val cPtr = Pointer.PolyML.cVal : non_opt p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val take_ =
        let
          val diag_ =
            ignore
        in
          fn ptr => (
            diag_ ptr
          )
        end

      val dup_ =
        call
          (externalFunctionSymbol "g_param_spec_ref_sink")
          (cPtr --> cPtr)

      val free_ =
        call
          (externalFunctionSymbol "g_param_spec_unref")
          (cPtr --> cVoid)

      val instanceType_ =
        call
          (externalFunctionSymbol "giraffe_g_param_spec_type")
          (cPtr --> GObjectType.PolyML.cVal)
    end

    fun checkInstance_ subclass instance =
      let
        val instanceType = GObjectType.FFI.fromVal (instanceType_ instance)
        val derivedType = ValueAccessor.gtype subclass
      in
        if GObjectType.isA (instanceType, derivedType)
        then ()
        else
          GiraffeLog.critical (
            String.concat [
              "Invalid downcast to type ", GObjectType.name derivedType,
              " on object of type ",       GObjectType.name instanceType
            ]
          )
      end

    structure Class =
      Class(
        structure Pointer = Pointer
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p
        type 'a value_accessor_t = 'a ValueAccessor.t
        val take_ = take_
        val dup_ = dup_
        val free_ = free_
        val checkInstance_ = checkInstance_
      )
    open Class

    local
      open PolyMLFFI
    in
      val getValue_ =
        call
          (externalFunctionSymbol "g_value_get_param")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr);

      val getOptValue_ =
        call
          (externalFunctionSymbol "g_value_get_param")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr);

      val setValue_ =
        call
          (externalFunctionSymbol "g_value_set_param")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid);

      val setOptValue_ =
        call
          (externalFunctionSymbol "g_value_set_param")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid);
    end

    type type_t = GObjectType.t

    val t =
      ValueAccessor.C.createAccessor {
        getType  = GObjectType.param,
        getValue = (I ---> FFI.fromPtr false) getValue_,
        setValue = (I &&&> FFI.withPtr false ---> I) setValue_
      }

    val tOpt =
      ValueAccessor.C.createAccessor {
        getType  = GObjectType.param,
        getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
        setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
      }

    local
      val call = FFI.withPtr false ---> GObjectType.FFI.fromVal
    in
      fun instanceType object = call instanceType_ (toBase object)
    end
  end
