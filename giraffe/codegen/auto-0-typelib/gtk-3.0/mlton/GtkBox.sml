structure GtkBox :>
  GTK_BOX
    where type 'a class = 'a GtkBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type orientation_t = GtkOrientation.t
    where type pack_type_t = GtkPackType.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type baseline_position_t = GtkBaselinePosition.t =
  struct
    val getType_ = _import "gtk_box_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_box_new" : GtkOrientation.FFI.val_ * GInt32.FFI.val_ -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val getBaselinePosition_ = _import "gtk_box_get_baseline_position" : GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p -> GtkBaselinePosition.FFI.val_;
    val getCenterWidget_ = _import "gtk_box_get_center_widget" : GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getHomogeneous_ = _import "gtk_box_get_homogeneous" : GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p -> GBool.FFI.val_;
    val getSpacing_ = _import "gtk_box_get_spacing" : GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p -> GInt32.FFI.val_;
    val packEnd_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_box_pack_end" :
              GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val packStart_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_box_pack_start" :
              GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val queryChildPacking_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_box_query_child_packing" :
              GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GBool.FFI.ref_
               * GBool.FFI.ref_
               * GUInt32.FFI.ref_
               * GtkPackType.FFI.ref_
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
    val reorderChild_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_box_reorder_child" :
              GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setBaselinePosition_ = fn x1 & x2 => (_import "gtk_box_set_baseline_position" : GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p * GtkBaselinePosition.FFI.val_ -> unit;) (x1, x2)
    val setCenterWidget_ = fn x1 & x2 => (_import "gtk_box_set_center_widget" : GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setChildPacking_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_box_set_child_packing" :
              GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               * GUInt32.FFI.val_
               * GtkPackType.FFI.val_
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
    val setHomogeneous_ = fn x1 & x2 => (_import "gtk_box_set_homogeneous" : GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "gtk_box_set_spacing" : GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type pack_type_t = GtkPackType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type baseline_position_t = GtkBaselinePosition.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (orientation, spacing) = (GtkOrientation.FFI.withVal &&&> GInt32.FFI.withVal ---> GtkBoxClass.FFI.fromPtr false) new_ (orientation & spacing)
    fun getBaselinePosition self = (GtkBoxClass.FFI.withPtr false ---> GtkBaselinePosition.FFI.fromVal) getBaselinePosition_ self
    fun getCenterWidget self = (GtkBoxClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getCenterWidget_ self
    fun getHomogeneous self = (GtkBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHomogeneous_ self
    fun getSpacing self = (GtkBoxClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getSpacing_ self
    fun packEnd
      self
      (
        child,
        expand,
        fill,
        padding
      ) =
      (
        GtkBoxClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        packEnd_
        (
          self
           & child
           & expand
           & fill
           & padding
        )
    fun packStart
      self
      (
        child,
        expand,
        fill,
        padding
      ) =
      (
        GtkBoxClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        packStart_
        (
          self
           & child
           & expand
           & fill
           & padding
        )
    fun queryChildPacking self child =
      let
        val expand
         & fill
         & padding
         & packType
         & () =
          (
            GtkBoxClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
             &&&> GBool.FFI.withRefVal
             &&&> GBool.FFI.withRefVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GtkPackType.FFI.withRefVal
             ---> GBool.FFI.fromVal
                   && GBool.FFI.fromVal
                   && GUInt32.FFI.fromVal
                   && GtkPackType.FFI.fromVal
                   && I
          )
            queryChildPacking_
            (
              self
               & child
               & GBool.null
               & GBool.null
               & GUInt32.null
               & GtkPackType.null
            )
      in
        (
          expand,
          fill,
          padding,
          packType
        )
      end
    fun reorderChild self (child, position) =
      (
        GtkBoxClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> I
      )
        reorderChild_
        (
          self
           & child
           & position
        )
    fun setBaselinePosition self position = (GtkBoxClass.FFI.withPtr false &&&> GtkBaselinePosition.FFI.withVal ---> I) setBaselinePosition_ (self & position)
    fun setCenterWidget self widget = (GtkBoxClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setCenterWidget_ (self & widget)
    fun setChildPacking
      self
      (
        child,
        expand,
        fill,
        padding,
        packType
      ) =
      (
        GtkBoxClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GtkPackType.FFI.withVal
         ---> I
      )
        setChildPacking_
        (
          self
           & child
           & expand
           & fill
           & padding
           & packType
        )
    fun setHomogeneous self homogeneous = (GtkBoxClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setSpacing self spacing = (GtkBoxClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setSpacing_ (self & spacing)
    local
      open ValueAccessor
    in
      val baselinePositionProp =
        {
          name = "baseline-position",
          gtype = fn () => C.gtype GtkBaselinePosition.t (),
          get = fn x => fn () => C.get GtkBaselinePosition.t x,
          set = fn x => C.set GtkBaselinePosition.t x,
          init = fn x => C.set GtkBaselinePosition.t x
        }
      val homogeneousProp =
        {
          name = "homogeneous",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val spacingProp =
        {
          name = "spacing",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
    end
  end
