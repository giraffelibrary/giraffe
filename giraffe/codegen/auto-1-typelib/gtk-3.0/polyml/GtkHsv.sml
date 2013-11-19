structure GtkHsv :>
  GTK_HSV
    where type 'a class_t = 'a GtkHsvClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type directiontype_t = GtkDirectionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_hsv_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_hsv_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val toRgb_ =
        call (load_sym libgtk "gtk_hsv_to_rgb")
          (
            FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.REF
             &&> FFI.Double.PolyML.REF
             &&> FFI.Double.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getColor_ =
        call (load_sym libgtk "gtk_hsv_get_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.REF
             &&> FFI.Double.PolyML.REF
             &&> FFI.Double.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getMetrics_ =
        call (load_sym libgtk "gtk_hsv_get_metrics")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val isAdjusting_ = call (load_sym libgtk "gtk_hsv_is_adjusting") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setColor_ =
        call (load_sym libgtk "gtk_hsv_set_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setMetrics_ =
        call (load_sym libgtk "gtk_hsv_set_metrics")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkHsvClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type directiontype_t = GtkDirectionType.t
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
            GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
    fun isAdjusting self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isAdjusting_ self
    fun setColor self h s v =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
