structure GtkLayout :>
  GTK_LAYOUT
    where type 'a class = 'a GtkLayoutClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_layout_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_layout_new") (GtkAdjustmentClass.PolyML.cOptPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val getBinWindow_ = call (getSymbol "gtk_layout_get_bin_window") (GtkLayoutClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getHadjustment_ = call (getSymbol "gtk_layout_get_hadjustment") (GtkLayoutClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getSize_ =
        call (getSymbol "gtk_layout_get_size")
          (
            GtkLayoutClass.PolyML.cPtr
             &&> GUInt32.PolyML.cRef
             &&> GUInt32.PolyML.cRef
             --> cVoid
          )
      val getVadjustment_ = call (getSymbol "gtk_layout_get_vadjustment") (GtkLayoutClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val move_ =
        call (getSymbol "gtk_layout_move")
          (
            GtkLayoutClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val put_ =
        call (getSymbol "gtk_layout_put")
          (
            GtkLayoutClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setHadjustment_ = call (getSymbol "gtk_layout_set_hadjustment") (GtkLayoutClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> cVoid)
      val setSize_ =
        call (getSymbol "gtk_layout_set_size")
          (
            GtkLayoutClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val setVadjustment_ = call (getSymbol "gtk_layout_set_vadjustment") (GtkLayoutClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GtkLayoutClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (hadjustment, vadjustment) = (GtkAdjustmentClass.FFI.withOptPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> GtkLayoutClass.FFI.fromPtr false) new_ (hadjustment & vadjustment)
    fun getBinWindow self = (GtkLayoutClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getBinWindow_ self
    fun getHadjustment self = (GtkLayoutClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GtkLayoutClass.FFI.withPtr false
             &&&> GUInt32.FFI.withRefVal
             &&&> GUInt32.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GUInt32.FFI.fromVal
                   && I
          )
            getSize_
            (
              self
               & GUInt32.null
               & GUInt32.null
            )
      in
        (width, height)
      end
    fun getVadjustment self = (GtkLayoutClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getVadjustment_ self
    fun move
      self
      (
        childWidget,
        x,
        y
      ) =
      (
        GtkLayoutClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        move_
        (
          self
           & childWidget
           & x
           & y
        )
    fun put
      self
      (
        childWidget,
        x,
        y
      ) =
      (
        GtkLayoutClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        put_
        (
          self
           & childWidget
           & x
           & y
        )
    fun setHadjustment self adjustment = (GtkLayoutClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setHadjustment_ (self & adjustment)
    fun setSize self (width, height) =
      (
        GtkLayoutClass.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        setSize_
        (
          self
           & width
           & height
        )
    fun setVadjustment self adjustment = (GtkLayoutClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setVadjustment_ (self & adjustment)
    local
      open Property
    in
      val heightProp =
        {
          get = fn x => get "height" uint x,
          set = fn x => set "height" uint x,
          new = fn x => new "height" uint x
        }
      val widthProp =
        {
          get = fn x => get "width" uint x,
          set = fn x => set "width" uint x,
          new = fn x => new "width" uint x
        }
    end
  end
