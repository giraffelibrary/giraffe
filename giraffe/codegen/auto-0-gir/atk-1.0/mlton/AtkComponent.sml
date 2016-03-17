structure AtkComponent :>
  ATK_COMPONENT
    where type 'a class = 'a AtkComponentClass.class
    where type layer_t = AtkLayer.t
    where type 'a object_class = 'a AtkObjectClass.class
    where type coord_type_t = AtkCoordType.t
    where type rectangle_t = AtkRectangleRecord.t =
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
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * AtkCoordType.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAlpha_ = _import "atk_component_get_alpha" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getLayer_ = _import "atk_component_get_layer" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> AtkLayer.C.val_;
    val getMdiZorder_ = _import "atk_component_get_mdi_zorder" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val grabFocus_ = _import "atk_component_grab_focus" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val refAccessibleAtPoint_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_component_ref_accessible_at_point" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * AtkCoordType.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val removeFocusHandler_ = fn x1 & x2 => (_import "atk_component_remove_focus_handler" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
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
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * AtkCoordType.C.val_
               -> FFI.Bool.C.val_;
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
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * AtkCoordType.C.val_
               -> FFI.Bool.C.val_;
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
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
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
