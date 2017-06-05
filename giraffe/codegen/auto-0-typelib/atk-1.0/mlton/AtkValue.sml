structure AtkValue :>
  ATK_VALUE
    where type 'a class = 'a AtkValueClass.class =
  struct
    val getType_ = _import "atk_value_get_type" : unit -> GObjectType.FFI.val_;
    val getCurrentValue_ = fn x1 & x2 => (_import "atk_value_get_current_value" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit;) (x1, x2)
    val getMaximumValue_ = fn x1 & x2 => (_import "atk_value_get_maximum_value" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit;) (x1, x2)
    val getMinimumIncrement_ = fn x1 & x2 => (_import "atk_value_get_minimum_increment" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit;) (x1, x2)
    val getMinimumValue_ = fn x1 & x2 => (_import "atk_value_get_minimum_value" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit;) (x1, x2)
    val setCurrentValue_ = fn x1 & x2 => (_import "atk_value_set_current_value" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    type 'a class = 'a AtkValueClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getCurrentValue self value = (AtkValueClass.FFI.withPtr &&&> GObjectValueRecord.FFI.withPtr ---> I) getCurrentValue_ (self & value)
    fun getMaximumValue self value = (AtkValueClass.FFI.withPtr &&&> GObjectValueRecord.FFI.withPtr ---> I) getMaximumValue_ (self & value)
    fun getMinimumIncrement self value = (AtkValueClass.FFI.withPtr &&&> GObjectValueRecord.FFI.withPtr ---> I) getMinimumIncrement_ (self & value)
    fun getMinimumValue self value = (AtkValueClass.FFI.withPtr &&&> GObjectValueRecord.FFI.withPtr ---> I) getMinimumValue_ (self & value)
    fun setCurrentValue self value = (AtkValueClass.FFI.withPtr &&&> GObjectValueRecord.FFI.withPtr ---> GBool.FFI.fromVal) setCurrentValue_ (self & value)
  end
