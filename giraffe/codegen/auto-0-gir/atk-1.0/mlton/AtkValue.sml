structure AtkValue :>
  ATK_VALUE
    where type 'a class = 'a AtkValueClass.class
    where type range_t = AtkRangeRecord.t =
  struct
    val getType_ = _import "atk_value_get_type" : unit -> GObjectType.FFI.val_;
    val getCurrentValue_ = fn x1 & x2 => (_import "atk_value_get_current_value" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit;) (x1, x2)
    val getIncrement_ = _import "atk_value_get_increment" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p -> GDouble.FFI.val_;
    val getMaximumValue_ = fn x1 & x2 => (_import "atk_value_get_maximum_value" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit;) (x1, x2)
    val getMinimumIncrement_ = fn x1 & x2 => (_import "atk_value_get_minimum_increment" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit;) (x1, x2)
    val getMinimumValue_ = fn x1 & x2 => (_import "atk_value_get_minimum_value" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit;) (x1, x2)
    val getRange_ = _import "atk_value_get_range" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p -> AtkRangeRecord.FFI.notnull AtkRangeRecord.FFI.p;
    val getValueAndText_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_atk_value_get_value_and_text" :
              AtkValueClass.FFI.notnull AtkValueClass.FFI.p
               * GDouble.FFI.ref_
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setCurrentValue_ = fn x1 & x2 => (_import "atk_value_set_current_value" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setValue_ = fn x1 & x2 => (_import "atk_value_set_value" : AtkValueClass.FFI.notnull AtkValueClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
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
    fun getRange self = (AtkValueClass.FFI.withPtr ---> AtkRangeRecord.FFI.fromPtr true) getRange_ self
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
