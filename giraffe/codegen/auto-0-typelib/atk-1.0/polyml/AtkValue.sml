structure AtkValue :>
  ATK_VALUE
    where type 'a class = 'a AtkValueClass.class
    where type range_t = AtkRangeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_value_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getCurrentValue_ = call (getSymbol "atk_value_get_current_value") (AtkValueClass.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> cVoid)
      val getIncrement_ = call (getSymbol "atk_value_get_increment") (AtkValueClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getMaximumValue_ = call (getSymbol "atk_value_get_maximum_value") (AtkValueClass.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> cVoid)
      val getMinimumIncrement_ = call (getSymbol "atk_value_get_minimum_increment") (AtkValueClass.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> cVoid)
      val getMinimumValue_ = call (getSymbol "atk_value_get_minimum_value") (AtkValueClass.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> cVoid)
      val getRange_ = call (getSymbol "atk_value_get_range") (AtkValueClass.PolyML.cPtr --> AtkRangeRecord.PolyML.cOptPtr)
      val getValueAndText_ =
        call (getSymbol "atk_value_get_value_and_text")
          (
            AtkValueClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> Utf8.PolyML.cOutRef
             --> cVoid
          )
      val setCurrentValue_ = call (getSymbol "atk_value_set_current_value") (AtkValueClass.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val setValue_ = call (getSymbol "atk_value_set_value") (AtkValueClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a AtkValueClass.class
    type range_t = AtkRangeRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getCurrentValue self =
      let
        val value & () = (AtkValueClass.FFI.withPtr &&&> GObjectValueRecord.FFI.withNewPtr ---> GObjectValueRecord.FFI.fromPtr true && I) getCurrentValue_ (self & ())
      in
        value
      end
    fun getIncrement self = (AtkValueClass.FFI.withPtr ---> GDouble.FFI.fromVal) getIncrement_ self
    fun getMaximumValue self =
      let
        val value & () = (AtkValueClass.FFI.withPtr &&&> GObjectValueRecord.FFI.withNewPtr ---> GObjectValueRecord.FFI.fromPtr true && I) getMaximumValue_ (self & ())
      in
        value
      end
    fun getMinimumIncrement self =
      let
        val value & () = (AtkValueClass.FFI.withPtr &&&> GObjectValueRecord.FFI.withNewPtr ---> GObjectValueRecord.FFI.fromPtr true && I) getMinimumIncrement_ (self & ())
      in
        value
      end
    fun getMinimumValue self =
      let
        val value & () = (AtkValueClass.FFI.withPtr &&&> GObjectValueRecord.FFI.withNewPtr ---> GObjectValueRecord.FFI.fromPtr true && I) getMinimumValue_ (self & ())
      in
        value
      end
    fun getRange self = (AtkValueClass.FFI.withPtr ---> AtkRangeRecord.FFI.fromOptPtr true) getRange_ self
    fun getValueAndText self =
      let
        val value
         & text
         & () =
          (
            AtkValueClass.FFI.withPtr
             &&&> GDouble.FFI.withRefVal
             &&&> Utf8.FFI.withRefOptPtr
             ---> GDouble.FFI.fromVal
                   && Utf8.FFI.fromPtr 1
                   && I
          )
            getValueAndText_
            (
              self
               & GDouble.null
               & NONE
            )
      in
        (value, text)
      end
    fun setCurrentValue self value = (AtkValueClass.FFI.withPtr &&&> GObjectValueRecord.FFI.withPtr ---> GBool.FFI.fromVal) setCurrentValue_ (self & value)
    fun setValue self newValue = (AtkValueClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setValue_ (self & newValue)
    local
      open ClosureMarshal Signal
    in
      fun valueChangedSig f = signal "value-changed" (get 0w1 double &&&> get 0w2 string ---> ret_void) (fn value & text => f (value, text))
    end
  end
