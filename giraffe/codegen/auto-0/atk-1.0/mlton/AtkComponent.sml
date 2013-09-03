structure AtkComponent :>
  ATK_COMPONENT
    where type 'a class_t = 'a AtkComponentClass.t
    where type layer_t = AtkLayer.t
    where type 'a objectclass_t = 'a AtkObjectClass.t
    where type coordtype_t = AtkCoordType.t
    where type rectanglerecord_t = AtkRectangleRecord.t =
  struct
    val getType_ = _import "atk_component_get_type" : unit -> GObjectType.C.val_;
    val contains_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_component_contains" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * AtkCoordType.C.val_
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAlpha_ = _import "atk_component_get_alpha" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.val_;
    val getLayer_ = _import "atk_component_get_layer" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> AtkLayer.C.val_;
    val getMdiZorder_ = _import "atk_component_get_mdi_zorder" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val grabFocus_ = _import "atk_component_grab_focus" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val refAccessibleAtPoint_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_component_ref_accessible_at_point" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * AtkCoordType.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val removeFocusHandler_ = fn x1 & x2 => (_import "atk_component_remove_focus_handler" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.val_ -> unit;) (x1, x2)
    val setExtents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "atk_component_set_extents" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * AtkCoordType.C.val_
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setPosition_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_component_set_position" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * AtkCoordType.C.val_
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_component_set_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a AtkComponentClass.t
    type layer_t = AtkLayer.t
    type 'a objectclass_t = 'a AtkObjectClass.t
    type coordtype_t = AtkCoordType.t
    type rectanglerecord_t = AtkRectangleRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun contains self x y coordType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> AtkCoordType.C.withVal
         ---> FFI.Bool.fromVal
      )
        contains_
        (
          self
           & x
           & y
           & coordType
        )
    fun getAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.Double.fromVal) getAlpha_ self
    fun getLayer self = (GObjectObjectClass.C.withPtr ---> AtkLayer.C.fromVal) getLayer_ self
    fun getMdiZorder self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getMdiZorder_ self
    fun grabFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) grabFocus_ self
    fun refAccessibleAtPoint self x y coordType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
    fun removeFocusHandler self handlerId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.withVal ---> I) removeFocusHandler_ (self & handlerId)
    fun setExtents self x y width height coordType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> AtkCoordType.C.withVal
         ---> FFI.Bool.fromVal
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> AtkCoordType.C.withVal
         ---> FFI.Bool.fromVal
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> FFI.Bool.fromVal
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
