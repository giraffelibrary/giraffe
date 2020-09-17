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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_box_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_box_new") (GtkOrientation.PolyML.cVal &&> GInt32.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val getBaselinePosition_ = call (getSymbol "gtk_box_get_baseline_position") (GtkBoxClass.PolyML.cPtr --> GtkBaselinePosition.PolyML.cVal)
      val getCenterWidget_ = call (getSymbol "gtk_box_get_center_widget") (GtkBoxClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getHomogeneous_ = call (getSymbol "gtk_box_get_homogeneous") (GtkBoxClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSpacing_ = call (getSymbol "gtk_box_get_spacing") (GtkBoxClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val packEnd_ =
        call (getSymbol "gtk_box_pack_end")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val packStart_ =
        call (getSymbol "gtk_box_pack_start")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val queryChildPacking_ =
        call (getSymbol "gtk_box_query_child_packing")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cRef
             &&> GBool.PolyML.cRef
             &&> GUInt32.PolyML.cRef
             &&> GtkPackType.PolyML.cRef
             --> cVoid
          )
      val reorderChild_ =
        call (getSymbol "gtk_box_reorder_child")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setBaselinePosition_ = call (getSymbol "gtk_box_set_baseline_position") (GtkBoxClass.PolyML.cPtr &&> GtkBaselinePosition.PolyML.cVal --> cVoid)
      val setCenterWidget_ = call (getSymbol "gtk_box_set_center_widget") (GtkBoxClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setChildPacking_ =
        call (getSymbol "gtk_box_set_child_packing")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GtkPackType.PolyML.cVal
             --> cVoid
          )
      val setHomogeneous_ = call (getSymbol "gtk_box_set_homogeneous") (GtkBoxClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSpacing_ = call (getSymbol "gtk_box_set_spacing") (GtkBoxClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
    end
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
    fun getCenterWidget self = (GtkBoxClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getCenterWidget_ self before GtkBoxClass.FFI.touchPtr self
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
