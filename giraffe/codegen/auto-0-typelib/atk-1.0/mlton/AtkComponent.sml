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
              AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p
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
    val getAlpha_ = _import "atk_component_get_alpha" : AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p -> GDouble.FFI.val_;
    val getExtents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "atk_component_get_extents" :
              AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * AtkCoordType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getLayer_ = _import "atk_component_get_layer" : AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p -> AtkLayer.FFI.val_;
    val getMdiZorder_ = _import "atk_component_get_mdi_zorder" : AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p -> GInt32.FFI.val_;
    val getPosition_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_component_get_position" :
              AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * AtkCoordType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_component_get_size" :
              AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val grabFocus_ = _import "atk_component_grab_focus" : AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p -> GBool.FFI.val_;
    val refAccessibleAtPoint_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "atk_component_ref_accessible_at_point" :
              AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * AtkCoordType.FFI.val_
               -> AtkObjectClass.FFI.opt AtkObjectClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val removeFocusHandler_ = fn x1 & x2 => (_import "atk_component_remove_focus_handler" : AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
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
              AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p
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
              AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p
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
              AtkComponentClass.FFI.non_opt AtkComponentClass.FFI.p
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
    fun contains
      self
      (
        x,
        y,
        coordType
      ) =
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
    fun getExtents self coordType =
      let
        val x
         & y
         & width
         & height
         & () =
          (
            AtkComponentClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> AtkCoordType.FFI.withVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getExtents_
            (
              self
               & GInt32.null
               & GInt32.null
               & GInt32.null
               & GInt32.null
               & coordType
            )
      in
        (
          x,
          y,
          width,
          height
        )
      end
    fun getLayer self = (AtkComponentClass.FFI.withPtr ---> AtkLayer.FFI.fromVal) getLayer_ self
    fun getMdiZorder self = (AtkComponentClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMdiZorder_ self
    fun getPosition self coordType =
      let
        val x
         & y
         & () =
          (
            AtkComponentClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> AtkCoordType.FFI.withVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPosition_
            (
              self
               & GInt32.null
               & GInt32.null
               & coordType
            )
      in
        (x, y)
      end
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            AtkComponentClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getSize_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (width, height)
      end
    fun grabFocus self = (AtkComponentClass.FFI.withPtr ---> GBool.FFI.fromVal) grabFocus_ self
    fun refAccessibleAtPoint
      self
      (
        x,
        y,
        coordType
      ) =
      (
        AtkComponentClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> AtkCoordType.FFI.withVal
         ---> AtkObjectClass.FFI.fromOptPtr true
      )
        refAccessibleAtPoint_
        (
          self
           & x
           & y
           & coordType
        )
    fun removeFocusHandler self handlerId = (AtkComponentClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) removeFocusHandler_ (self & handlerId)
    fun setExtents
      self
      (
        x,
        y,
        width,
        height,
        coordType
      ) =
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
    fun setPosition
      self
      (
        x,
        y,
        coordType
      ) =
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
    fun setSize self (width, height) =
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
