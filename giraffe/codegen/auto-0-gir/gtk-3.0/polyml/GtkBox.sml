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
      val new_ = call (getSymbol "gtk_box_new") (GtkOrientation.PolyML.cVal &&> GInt.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val getBaselinePosition_ = call (getSymbol "gtk_box_get_baseline_position") (GtkBoxClass.PolyML.cPtr --> GtkBaselinePosition.PolyML.cVal)
      val getCenterWidget_ = call (getSymbol "gtk_box_get_center_widget") (GtkBoxClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getHomogeneous_ = call (getSymbol "gtk_box_get_homogeneous") (GtkBoxClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSpacing_ = call (getSymbol "gtk_box_get_spacing") (GtkBoxClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val packEnd_ =
        call (getSymbol "gtk_box_pack_end")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GUInt.PolyML.cVal
             --> cVoid
          )
      val packStart_ =
        call (getSymbol "gtk_box_pack_start")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GUInt.PolyML.cVal
             --> cVoid
          )
      val queryChildPacking_ =
        call (getSymbol "gtk_box_query_child_packing")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cRef
             &&> GBool.PolyML.cRef
             &&> GUInt.PolyML.cRef
             &&> GtkPackType.PolyML.cRef
             --> cVoid
          )
      val reorderChild_ =
        call (getSymbol "gtk_box_reorder_child")
          (
            GtkBoxClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
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
             &&> GUInt.PolyML.cVal
             &&> GtkPackType.PolyML.cVal
             --> cVoid
          )
      val setHomogeneous_ = call (getSymbol "gtk_box_set_homogeneous") (GtkBoxClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSpacing_ = call (getSymbol "gtk_box_set_spacing") (GtkBoxClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
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
    fun new (orientation, spacing) = (GtkOrientation.FFI.withVal &&&> GInt.FFI.withVal ---> GtkBoxClass.FFI.fromPtr false) new_ (orientation & spacing)
    fun getBaselinePosition self = (GtkBoxClass.FFI.withPtr false ---> GtkBaselinePosition.FFI.fromVal) getBaselinePosition_ self
    fun getCenterWidget self = (GtkBoxClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getCenterWidget_ self
    fun getHomogeneous self = (GtkBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHomogeneous_ self
    fun getSpacing self = (GtkBoxClass.FFI.withPtr false ---> GInt.FFI.fromVal) getSpacing_ self
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
        GtkBoxClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
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
            GtkBoxClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
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
        GtkBoxClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
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
    fun setHomogeneous self homogeneous = (GtkBoxClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setSpacing self spacing = (GtkBoxClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setSpacing_ (self & spacing)
    local
      open Property
    in
      val baselinePositionProp =
        {
          get = fn x => get "baseline-position" GtkBaselinePosition.t x,
          set = fn x => set "baseline-position" GtkBaselinePosition.t x,
          new = fn x => new "baseline-position" GtkBaselinePosition.t x
        }
      val homogeneousProp =
        {
          get = fn x => get "homogeneous" boolean x,
          set = fn x => set "homogeneous" boolean x,
          new = fn x => new "homogeneous" boolean x
        }
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x,
          new = fn x => new "spacing" int x
        }
    end
  end
