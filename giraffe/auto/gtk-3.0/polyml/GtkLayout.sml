structure GtkLayout :>
  GTK_LAYOUT
    where type 'a class_t = 'a GtkLayoutClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a scrollableclass_t = 'a GtkScrollableClass.t
    where type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_layout_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_layout_new") (GObjectObjectClass.PolyML.OPTPTR &&> GObjectObjectClass.PolyML.OPTPTR --> GObjectObjectClass.PolyML.PTR)
      val getBinWindow_ = call (load_sym libgtk "gtk_layout_get_bin_window") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getSize_ =
        call (load_sym libgtk "gtk_layout_get_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.REF
             &&> FFI.UInt32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val move_ =
        call (load_sym libgtk "gtk_layout_move")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val put_ =
        call (load_sym libgtk "gtk_layout_put")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setSize_ =
        call (load_sym libgtk "gtk_layout_set_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkLayoutClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a scrollableclass_t = 'a GtkScrollableClass.t
    type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hadjustment vadjustment = (GObjectObjectClass.C.withOptPtr &&&> GObjectObjectClass.C.withOptPtr ---> GtkLayoutClass.C.fromPtr false) new_ (hadjustment & vadjustment)
    fun getBinWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getBinWindow_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.UInt32.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && FFI.UInt32.C.fromVal
                   && I
          )
            getSize_
            (
              self
               & FFI.UInt32.null
               & FFI.UInt32.null
            )
      in
        (width, height)
      end
    fun move self childWidget x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        move_
        (
          self
           & childWidget
           & x
           & y
        )
    fun put self childWidget x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        put_
        (
          self
           & childWidget
           & x
           & y
        )
    fun setSize self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        setSize_
        (
          self
           & width
           & height
        )
    local
      open Property
    in
      val heightProp =
        {
          get = fn x => get "height" uint x,
          set = fn x => set "height" uint x
        }
      val widthProp =
        {
          get = fn x => get "width" uint x,
          set = fn x => set "width" uint x
        }
    end
  end
