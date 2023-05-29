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

    val getType = GObjectType.param

    val take_ =
      ignore

    val dup_ =
      _import "g_param_spec_ref_sink" : non_opt p -> non_opt p;

    val free_ =
      _import "g_param_spec_unref" : non_opt p -> unit;

    val instanceType_ =
      _import "giraffe_g_param_spec_type" : non_opt p -> GObjectType.FFI.val_;

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
        val instanceTypeName_ = GObjectType.name o GObjectType.FFI.fromVal o instanceType_
      )
    open Class

    val getValue_ =
      _import "g_value_get_param" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;

    val getOptValue_ =
      _import "g_value_get_param" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;

    val setValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_param" :
           GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;)
        (x1, x2)

    val setOptValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_param" :
           GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;)
        (x1, x2)

    type type_t = GObjectType.t

    val t =
      ValueAccessor.C.createAccessor {
        getType  = getType,
        getValue = (I ---> FFI.fromPtr false) getValue_,
        setValue = (I &&&> FFI.withPtr false ---> I) setValue_
      }

    val tOpt =
      ValueAccessor.C.createAccessor {
        getType  = getType,
        getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
        setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
      }

    local
      val call = FFI.withPtr false ---> GObjectType.FFI.fromVal
    in
      fun instanceType object = call instanceType_ (toBase object)
    end
  end
