structure AtkComponent :>
  ATK_COMPONENT
    where type 'a class = 'a AtkComponentClass.class
    where type layer_t = AtkLayer.t
    where type 'a object_class = 'a AtkObjectClass.class
    where type coord_type_t = AtkCoordType.t
    where type rectangle_t = AtkRectangleRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_component_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val contains_ =
        call (getSymbol "atk_component_contains")
          (
            AtkComponentClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val getAlpha_ = call (getSymbol "atk_component_get_alpha") (AtkComponentClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getLayer_ = call (getSymbol "atk_component_get_layer") (AtkComponentClass.PolyML.cPtr --> AtkLayer.PolyML.cVal)
      val getMdiZorder_ = call (getSymbol "atk_component_get_mdi_zorder") (AtkComponentClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val grabFocus_ = call (getSymbol "atk_component_grab_focus") (AtkComponentClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val refAccessibleAtPoint_ =
        call (getSymbol "atk_component_ref_accessible_at_point")
          (
            AtkComponentClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             --> AtkObjectClass.PolyML.cPtr
          )
      val removeFocusHandler_ = call (getSymbol "atk_component_remove_focus_handler") (AtkComponentClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setExtents_ =
        call (getSymbol "atk_component_set_extents")
          (
            AtkComponentClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setPosition_ =
        call (getSymbol "atk_component_set_position")
          (
            AtkComponentClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setSize_ =
        call (getSymbol "atk_component_set_size")
          (
            AtkComponentClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a AtkComponentClass.class
    type layer_t = AtkLayer.t
    type 'a object_class = 'a AtkObjectClass.class
    type coord_type_t = AtkCoordType.t
    type rectangle_t = AtkRectangleRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun contains self x y coordType =
      (
        AtkComponentClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> AtkCoordType.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        contains_
        (
          self
           & x
           & y
           & coordType
        )
    fun getAlpha self = (AtkComponentClass.FFI.withPtr ---> GDouble.FFI.fromVal) getAlpha_ self
    fun getLayer self = (AtkComponentClass.FFI.withPtr ---> AtkLayer.FFI.fromVal) getLayer_ self
    fun getMdiZorder self = (AtkComponentClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMdiZorder_ self
    fun grabFocus self = (AtkComponentClass.FFI.withPtr ---> GBool.FFI.fromVal) grabFocus_ self
    fun refAccessibleAtPoint self x y coordType =
      (
        AtkComponentClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> AtkCoordType.FFI.withVal
         ---> AtkObjectClass.FFI.fromPtr true
      )
        refAccessibleAtPoint_
        (
          self
           & x
           & y
           & coordType
        )
    fun removeFocusHandler self handlerId = (AtkComponentClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) removeFocusHandler_ (self & handlerId)
    fun setExtents self x y width height coordType =
      (
        AtkComponentClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> AtkCoordType.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setExtents_
        (
          self
           & x
           & y
           & width
           & height
           & coordType
        )
    fun setPosition self x y coordType =
      (
        AtkComponentClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> AtkCoordType.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setPosition_
        (
          self
           & x
           & y
           & coordType
        )
    fun setSize self width height =
      (
        AtkComponentClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setSize_
        (
          self
           & width
           & height
        )
    local
      open ClosureMarshal Signal
    in
      fun boundsChangedSig f = signal "bounds-changed" (get 0w1 AtkRectangleRecord.t ---> ret_void) f
    end
  end
