structure AtkValue :>
  ATK_VALUE
    where type 'a class_t = 'a AtkValueClass.t =
  struct
    val getType_ = _import "atk_value_get_type" : unit -> GObjectType.C.val_;
    val getCurrentValue_ = fn x1 & x2 => (_import "atk_value_get_current_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> unit;) (x1, x2)
    val getMaximumValue_ = fn x1 & x2 => (_import "atk_value_get_maximum_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> unit;) (x1, x2)
    val getMinimumIncrement_ = fn x1 & x2 => (_import "atk_value_get_minimum_increment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> unit;) (x1, x2)
    val getMinimumValue_ = fn x1 & x2 => (_import "atk_value_get_minimum_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> unit;) (x1, x2)
    val setCurrentValue_ = fn x1 & x2 => (_import "atk_value_set_current_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    type 'a class_t = 'a AtkValueClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getCurrentValue self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) getCurrentValue_ (self & value)
    fun getMaximumValue self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) getMaximumValue_ (self & value)
    fun getMinimumIncrement self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) getMinimumIncrement_ (self & value)
    fun getMinimumValue self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) getMinimumValue_ (self & value)
    fun setCurrentValue self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> FFI.Bool.C.fromVal) setCurrentValue_ (self & value)
  end
