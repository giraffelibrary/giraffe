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
    val new_ = fn x1 & x2 => (_import "gtk_box_new" : GtkOrientation.FFI.val_ * GInt.FFI.val_ -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;) (x1, x2)
    val getBaselinePosition_ = _import "gtk_box_get_baseline_position" : GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p -> GtkBaselinePosition.FFI.val_;
    val getCenterWidget_ = _import "gtk_box_get_center_widget" : GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getHomogeneous_ = _import "gtk_box_get_homogeneous" : GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p -> GBool.FFI.val_;
    val getSpacing_ = _import "gtk_box_get_spacing" : GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p -> GInt.FFI.val_;
    val packEnd_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_box_pack_end" :
              GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               * GUInt.FFI.val_
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
              GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               * GUInt.FFI.val_
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
              GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GBool.FFI.ref_
               * GBool.FFI.ref_
               * GUInt.FFI.ref_
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
              GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setBaselinePosition_ = fn x1 & x2 => (_import "gtk_box_set_baseline_position" : GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p * GtkBaselinePosition.FFI.val_ -> unit;) (x1, x2)
    val setCenterWidget_ = fn x1 & x2 => (_import "gtk_box_set_center_widget" : GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
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
              GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               * GUInt.FFI.val_
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
    val setHomogeneous_ = fn x1 & x2 => (_import "gtk_box_set_homogeneous" : GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "gtk_box_set_spacing" : GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type orientation_t = GtkOrientation.t
    type pack_type_t = GtkPackType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type baseline_position_t = GtkBaselinePosition.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (orientation, spacing) = (GtkOrientation.FFI.withVal &&&> GInt.FFI.withVal ---> GtkBoxClass.FFI.fromPtr false) new_ (orientation & spacing)
    fun getBaselinePosition self = (GtkBoxClass.FFI.withPtr ---> GtkBaselinePosition.FFI.fromVal) getBaselinePosition_ self
    fun getCenterWidget self = (GtkBoxClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getCenterWidget_ self
    fun getHomogeneous self = (GtkBoxClass.FFI.withPtr ---> GBool.FFI.fromVal) getHomogeneous_ self
    fun getSpacing self = (GtkBoxClass.FFI.withPtr ---> GInt.FFI.fromVal) getSpacing_ self
    fun packEnd
      self
      (
        child,
        expand,
        fill,
        padding
      ) =
      (
        GtkBoxClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GUInt.FFI.withVal
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
        GtkBoxClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GUInt.FFI.withVal
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
            GtkBoxClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GBool.FFI.withRefVal
             &&&> GBool.FFI.withRefVal
             &&&> GUInt.FFI.withRefVal
             &&&> GtkPackType.FFI.withRefVal
             ---> GBool.FFI.fromVal
                   && GBool.FFI.fromVal
                   && GUInt.FFI.fromVal
                   && GtkPackType.FFI.fromVal
                   && I
          )
            queryChildPacking_
            (
              self
               & child
               & GBool.null
               & GBool.null
               & GUInt.null
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
        GtkBoxClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        reorderChild_
        (
          self
           & child
           & position
        )
    fun setBaselinePosition self position = (GtkBoxClass.FFI.withPtr &&&> GtkBaselinePosition.FFI.withVal ---> I) setBaselinePosition_ (self & position)
    fun setCenterWidget self widget = (GtkBoxClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setCenterWidget_ (self & widget)
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
        GtkBoxClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GUInt.FFI.withVal
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
    fun setHomogeneous self homogeneous = (GtkBoxClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setSpacing self spacing = (GtkBoxClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setSpacing_ (self & spacing)
    local
      open Property
    in
      val baselinePositionProp =
        {
          get = fn x => get "baseline-position" GtkBaselinePosition.t x,
          set = fn x => set "baseline-position" GtkBaselinePosition.t x
        }
      val homogeneousProp =
        {
          get = fn x => get "homogeneous" boolean x,
          set = fn x => set "homogeneous" boolean x
        }
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x
        }
    end
  end
