structure AtkValue :>
  ATK_VALUE
    where type 'a class_t = 'a AtkValueClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_value_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getCurrentValue_ = call (load_sym libatk "atk_value_get_current_value") (GObjectObjectClass.PolyML.PTR &&> GObjectValueRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getMaximumValue_ = call (load_sym libatk "atk_value_get_maximum_value") (GObjectObjectClass.PolyML.PTR &&> GObjectValueRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getMinimumIncrement_ = call (load_sym libatk "atk_value_get_minimum_increment") (GObjectObjectClass.PolyML.PTR &&> GObjectValueRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getMinimumValue_ = call (load_sym libatk "atk_value_get_minimum_value") (GObjectObjectClass.PolyML.PTR &&> GObjectValueRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setCurrentValue_ = call (load_sym libatk "atk_value_set_current_value") (GObjectObjectClass.PolyML.PTR &&> GObjectValueRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type 'a class_t = 'a AtkValueClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getCurrentValue self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) getCurrentValue_ (self & value)
    fun getMaximumValue self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) getMaximumValue_ (self & value)
    fun getMinimumIncrement self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) getMinimumIncrement_ (self & value)
    fun getMinimumValue self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) getMinimumValue_ (self & value)
    fun setCurrentValue self value = (GObjectObjectClass.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> FFI.Bool.fromVal) setCurrentValue_ (self & value)
  end
