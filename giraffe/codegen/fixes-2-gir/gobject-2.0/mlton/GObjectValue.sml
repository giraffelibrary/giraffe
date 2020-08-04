(* Copyright (C) 2012-2013, 2015-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectValue :>
  G_OBJECT_VALUE
    where type t = GObjectValueRecord.t
    where type type_t = GObjectType.t =
  struct
    val init_ =
      fn x1 & x2 =>
        (_import "g_value_init" :
           GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * GObjectType.FFI.val_
            -> GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p;)
        (x1, x2)

    val reset_ =
      _import "g_value_reset" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p;

    val getType_ =
      _import "g_value_get_type" : unit -> GObjectType.FFI.val_;

    val holds_ =
      fn x1 & x2 =>
        (_import "giraffe_g_value_holds" :
           GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * GObjectType.FFI.val_ -> GBool.FFI.val_;)
        (x1, x2)

    val gtypeOf_ =
      _import "giraffe_g_value_type" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> GObjectType.FFI.val_;

    val isValue_ =
      _import "giraffe_g_is_value" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> GBool.FFI.val_;

    type t = GObjectValueRecord.t
    type type_t = GObjectType.t

    fun init gtype =
      let
        val value & () =
          (GObjectValueRecord.FFI.withNewPtr
            &&&> GObjectType.FFI.withVal
            ---> GObjectValueRecord.FFI.fromPtr true && I)
            (ignore o init_)
            (() & gtype)
      in
        value
      end

    fun reset value =
      (GObjectValueRecord.FFI.withPtr false ---> I) (ignore o reset_) value

    fun getType () = (I ---> GObjectType.FFI.fromVal) getType_ ()

    fun holds gtype value =
      (GObjectValueRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal)
        holds_
        (value & gtype)

    fun gTypeOf value =
      (GObjectValueRecord.FFI.withPtr false ---> GObjectType.FFI.fromVal) gtypeOf_ value

    fun isValue value =
      (GObjectValueRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isValue_ value
  end
