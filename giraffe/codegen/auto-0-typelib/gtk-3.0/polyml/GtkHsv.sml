structure GtkHsv :>
  GTK_HSV
    where type 'a class = 'a GtkHsvClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type direction_type_t = GtkDirectionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_hsv_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_hsv_new") (FFI.PolyML.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val toRgb_ =
        call (load_sym libgtk "gtk_hsv_to_rgb")
          (
            FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getColor_ =
        call (load_sym libgtk "gtk_hsv_get_color")
          (
            GtkHsvClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getMetrics_ =
        call (load_sym libgtk "gtk_hsv_get_metrics")
          (
            GtkHsvClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val isAdjusting_ = call (load_sym libgtk "gtk_hsv_is_adjusting") (GtkHsvClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setColor_ =
        call (load_sym libgtk "gtk_hsv_set_color")
          (
            GtkHsvClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setMetrics_ =
        call (load_sym libgtk "gtk_hsv_set_metrics")
          (
            GtkHsvClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
    type 'a class = 'a GtkHsvClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type direction_type_t = GtkDirectionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkHsvClass.C.fromPtr false) new_ ()
    fun toRgb h s v =
      let
        val r
         & g
         & b
         & () =
          (
            FFI.Double.C.withVal
             &&&> FFI.Double.C.withVal
             &&&> FFI.Double.C.withVal
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             ---> FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && I
          )
            toRgb_
            (
              h
               & s
               & v
               & FFI.Double.null
               & FFI.Double.null
               & FFI.Double.null
            )
      in
        (
          r,
          g,
          b
        )
      end
    fun getColor self =
      let
        val h
         & s
         & v
         & () =
          (
            GtkHsvClass.C.withPtr
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             ---> FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && I
          )
            getColor_
            (
              self
               & FFI.Double.null
               & FFI.Double.null
               & FFI.Double.null
            )
      in
        (
          h,
          s,
          v
        )
      end
    fun getMetrics self =
      let
        val size
         & ringWidth
         & () =
          (
            GtkHsvClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getMetrics_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (size, ringWidth)
      end
    fun isAdjusting self = (GtkHsvClass.C.withPtr ---> FFI.Bool.C.fromVal) isAdjusting_ self
    fun setColor self h s v =
      (
        GtkHsvClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        setColor_
        (
          self
           & h
           & s
           & v
        )
    fun setMetrics self size ringWidth =
      (
        GtkHsvClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setMetrics_
        (
          self
           & size
           & ringWidth
        )
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun moveSig f = signal "move" (get 0w1 GtkDirectionType.t ---> ret_void) f
    end
  end
