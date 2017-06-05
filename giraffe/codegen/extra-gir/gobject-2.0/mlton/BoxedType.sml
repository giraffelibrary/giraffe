functor BoxedType(
  structure Record :
    RECORD
      (*
       * Need to fix pointer type for MLton because FFI type cannot
       * be from a functor argument
       *)
      where type FFI.notnull = CPointerInternal.notnull
      where type 'a FFI.p = 'a CPointerInternal.p
      where type ('a, 'b) FFI.r = ('a, 'b) CPointerInternal.r
  type t = Record.t
  val getType_ : unit -> GObjectType.FFI.val_
) :>
  sig
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
  end =
  struct
    open Record

    val getValue_ =
      _import "g_value_get_boxed" :
        GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.notnull FFI.p;

    val getOptValue_ =
      _import "g_value_get_boxed" :
        GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit FFI.p;

    val setValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_boxed" :
           GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.notnull FFI.p -> unit;)
        (x1, x2)

    val setOptValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_boxed" :
           GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit FFI.p -> unit;)
        (x1, x2)

    val t =
      GObjectValue.C.createAccessor {
        getType  = (I ---> GObjectType.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromPtr false) getValue_,
        setValue = (I &&&> FFI.withPtr ---> I) setValue_
      }

    val tOpt =
      GObjectValue.C.createAccessor {
        getType  = (I ---> GObjectType.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
        setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
      }
  end
