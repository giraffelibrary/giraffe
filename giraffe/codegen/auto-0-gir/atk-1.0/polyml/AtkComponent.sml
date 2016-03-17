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
      val getType_ = call (load_sym libatk "atk_component_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val contains_ =
        call (load_sym libatk "atk_component_contains")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val getAlpha_ = call (load_sym libatk "atk_component_get_alpha") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getLayer_ = call (load_sym libatk "atk_component_get_layer") (GObjectObjectClass.PolyML.cPtr --> AtkLayer.PolyML.cVal)
      val getMdiZorder_ = call (load_sym libatk "atk_component_get_mdi_zorder") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val grabFocus_ = call (load_sym libatk "atk_component_grab_focus") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val refAccessibleAtPoint_ =
        call (load_sym libatk "atk_component_ref_accessible_at_point")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val removeFocusHandler_ = call (load_sym libatk "atk_component_remove_focus_handler") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val setExtents_ =
        call (load_sym libatk "atk_component_set_extents")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val setPosition_ =
        call (load_sym libatk "atk_component_set_position")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> AtkCoordType.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val setSize_ =
        call (load_sym libatk "atk_component_set_size")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a AtkComponentClass.class
    type layer_t = AtkLayer.t
    type 'a object_class = 'a AtkObjectClass.class
    type coord_type_t = AtkCoordType.t
    type rectangle_t = AtkRectangleRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun contains self x y coordType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> AtkCoordType.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        contains_
        (
          self
           & x
           & y
           & coordType
        )
    fun getAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getAlpha_ self
    fun getLayer self = (GObjectObjectClass.C.withPtr ---> AtkLayer.C.fromVal) getLayer_ self
    fun getMdiZorder self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getMdiZorder_ self
    fun grabFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) grabFocus_ self
    fun refAccessibleAtPoint self x y coordType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> AtkCoordType.C.withVal
         ---> AtkObjectClass.C.fromPtr true
      )
        refAccessibleAtPoint_
        (
          self
           & x
           & y
           & coordType
        )
    fun removeFocusHandler self handlerId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) removeFocusHandler_ (self & handlerId)
    fun setExtents self x y width height coordType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> AtkCoordType.C.withVal
         ---> FFI.Bool.C.fromVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> AtkCoordType.C.withVal
         ---> FFI.Bool.C.fromVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Bool.C.fromVal
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
