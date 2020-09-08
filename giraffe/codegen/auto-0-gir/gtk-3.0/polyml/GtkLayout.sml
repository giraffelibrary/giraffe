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
             &&> GUInt.PolyML.cRef
             &&> GUInt.PolyML.cRef
             --> cVoid
          )
      val getVadjustment_ = call (getSymbol "gtk_layout_get_vadjustment") (GtkLayoutClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val move_ =
        call (getSymbol "gtk_layout_move")
          (
            GtkLayoutClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val put_ =
        call (getSymbol "gtk_layout_put")
          (
            GtkLayoutClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setHadjustment_ = call (getSymbol "gtk_layout_set_hadjustment") (GtkLayoutClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> cVoid)
      val setSize_ =
        call (getSymbol "gtk_layout_set_size")
          (
            GtkLayoutClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
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
             &&&> GUInt.FFI.withRefVal
             &&&> GUInt.FFI.withRefVal
             ---> GUInt.FFI.fromVal
                   && GUInt.FFI.fromVal
                   && I
          )
            getSize_
            (
              self
               & GUInt.null
               & GUInt.null
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
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
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
      open ValueAccessor
    in
      val heightProp =
        {
          name = "height",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val widthProp =
        {
          name = "width",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
    end
  end
