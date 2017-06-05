structure AtkComponent :>
  ATK_COMPONENT
    where type 'a class = 'a AtkComponentClass.class
    where type layer_t = AtkLayer.t
    where type 'a object_class = 'a AtkObjectClass.class
    where type coord_type_t = AtkCoordType.t
    where type rectangle_t = AtkRectangleRecord.t =
  struct
    val getType_ = _import "atk_component_get_type" : unit -> GObjectType.FFI.val_;
    val contains_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_component_contains" :
              AtkComponentClass.FFI.notnull AtkComponentClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * AtkCoordType.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAlpha_ = _import "atk_component_get_alpha" : AtkComponentClass.FFI.notnull AtkComponentClass.FFI.p -> GDouble.FFI.val_;
    val getLayer_ = _import "atk_component_get_layer" : AtkComponentClass.FFI.notnull AtkComponentClass.FFI.p -> AtkLayer.FFI.val_;
    val getMdiZorder_ = _import "atk_component_get_mdi_zorder" : AtkComponentClass.FFI.notnull AtkComponentClass.FFI.p -> GInt32.FFI.val_;
    val grabFocus_ = _import "atk_component_grab_focus" : AtkComponentClass.FFI.notnull AtkComponentClass.FFI.p -> GBool.FFI.val_;
    val refAccessibleAtPoint_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_component_ref_accessible_at_point" :
              AtkComponentClass.FFI.notnull AtkComponentClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * AtkCoordType.FFI.val_
               -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val removeFocusHandler_ = fn x1 & x2 => (_import "atk_component_remove_focus_handler" : AtkComponentClass.FFI.notnull AtkComponentClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
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
              AtkComponentClass.FFI.notnull AtkComponentClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * AtkCoordType.FFI.val_
               -> GBool.FFI.val_;
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
              AtkComponentClass.FFI.notnull AtkComponentClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * AtkCoordType.FFI.val_
               -> GBool.FFI.val_;
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
              AtkComponentClass.FFI.notnull AtkComponentClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GBool.FFI.val_;
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
