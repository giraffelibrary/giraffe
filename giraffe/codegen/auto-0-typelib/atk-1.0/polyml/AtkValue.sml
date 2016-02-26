structure AtkValue :>
  ATK_VALUE
    where type 'a class_t = 'a AtkValueClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_value_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getCurrentValue_ = call (load_sym libatk "atk_value_get_current_value") (GObjectObjectClass.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getMaximumValue_ = call (load_sym libatk "atk_value_get_maximum_value") (GObjectObjectClass.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getMinimumIncrement_ = call (load_sym libatk "atk_value_get_minimum_increment") (GObjectObjectClass.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getMinimumValue_ = call (load_sym libatk "atk_value_get_minimum_value") (GObjectObjectClass.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setCurrentValue_ = call (load_sym libatk "atk_value_set_current_value") (GObjectObjectClass.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a AtkValueClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getCurrentValue self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) getCurrentValue_ (self & value)
    fun getMaximumValue self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) getMaximumValue_ (self & value)
    fun getMinimumIncrement self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) getMinimumIncrement_ (self & value)
    fun getMinimumValue self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) getMinimumValue_ (self & value)
    fun setCurrentValue self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> FFI.Bool.C.fromVal) setCurrentValue_ (self & value)
  end
