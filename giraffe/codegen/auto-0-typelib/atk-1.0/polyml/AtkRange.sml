structure AtkRange :>
  ATK_RANGE
    where type t = AtkRangeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_range_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "atk_range_new")
          (
            GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> AtkRangeRecord.PolyML.cPtr
          )
      val copy_ = call (getSymbol "atk_range_copy") (AtkRangeRecord.PolyML.cPtr --> AtkRangeRecord.PolyML.cPtr)
      val getDescription_ = call (getSymbol "atk_range_get_description") (AtkRangeRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLowerLimit_ = call (getSymbol "atk_range_get_lower_limit") (AtkRangeRecord.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getUpperLimit_ = call (getSymbol "atk_range_get_upper_limit") (AtkRangeRecord.PolyML.cPtr --> GDouble.PolyML.cVal)
    end
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
         &&&> Utf8.FFI.withPtr 0
         ---> AtkRangeRecord.FFI.fromPtr true
      )
        new_
        (
          lowerLimit
           & upperLimit
           & description
        )
    fun copy self = (AtkRangeRecord.FFI.withPtr false ---> AtkRangeRecord.FFI.fromPtr true) copy_ self
    fun getDescription self = (AtkRangeRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDescription_ self
    fun getLowerLimit self = (AtkRangeRecord.FFI.withPtr false ---> GDouble.FFI.fromVal) getLowerLimit_ self
    fun getUpperLimit self = (AtkRangeRecord.FFI.withPtr false ---> GDouble.FFI.fromVal) getUpperLimit_ self
  end
