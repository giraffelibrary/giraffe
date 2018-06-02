structure AtkRange :>
  ATK_RANGE
    where type t = AtkRangeRecord.t =
  struct
    val getType_ = _import "atk_range_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_atk_range_new" :
              GDouble.FFI.val_
               * GDouble.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> AtkRangeRecord.FFI.notnull AtkRangeRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val copy_ = _import "atk_range_copy" : AtkRangeRecord.FFI.notnull AtkRangeRecord.FFI.p -> AtkRangeRecord.FFI.notnull AtkRangeRecord.FFI.p;
    val getDescription_ = _import "atk_range_get_description" : AtkRangeRecord.FFI.notnull AtkRangeRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getLowerLimit_ = _import "atk_range_get_lower_limit" : AtkRangeRecord.FFI.notnull AtkRangeRecord.FFI.p -> GDouble.FFI.val_;
    val getUpperLimit_ = _import "atk_range_get_upper_limit" : AtkRangeRecord.FFI.notnull AtkRangeRecord.FFI.p -> GDouble.FFI.val_;
    type t = AtkRangeRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        lowerLimit,
        upperLimit,
        description
      ) =
      (
        GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> AtkRangeRecord.FFI.fromPtr true
      )
        new_
        (
          lowerLimit
           & upperLimit
           & description
        )
    fun copy self = (AtkRangeRecord.FFI.withPtr ---> AtkRangeRecord.FFI.fromPtr true) copy_ self
    fun getDescription self = (AtkRangeRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDescription_ self
    fun getLowerLimit self = (AtkRangeRecord.FFI.withPtr ---> GDouble.FFI.fromVal) getLowerLimit_ self
    fun getUpperLimit self = (AtkRangeRecord.FFI.withPtr ---> GDouble.FFI.fromVal) getUpperLimit_ self
  end