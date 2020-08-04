structure GtkHsv :>
  GTK_HSV
    where type 'a class = 'a GtkHsvClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type direction_type_t = GtkDirectionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_hsv_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_hsv_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val toRgb_ =
        call (getSymbol "gtk_hsv_to_rgb")
          (
            GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val getColor_ =
        call (getSymbol "gtk_hsv_get_color")
          (
            GtkHsvClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val getMetrics_ =
        call (getSymbol "gtk_hsv_get_metrics")
          (
            GtkHsvClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val isAdjusting_ = call (getSymbol "gtk_hsv_is_adjusting") (GtkHsvClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setColor_ =
        call (getSymbol "gtk_hsv_set_color")
          (
            GtkHsvClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val setMetrics_ =
        call (getSymbol "gtk_hsv_set_metrics")
          (
            GtkHsvClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GtkHsvClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type direction_type_t = GtkDirectionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkHsvClass.FFI.fromPtr false) new_ ()
    fun toRgb
      (
        h,
        s,
        v
      ) =
      let
        val r
         & g
         & b
         & () =
          (
            GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            toRgb_
            (
              h
               & s
               & v
               & GDouble.null
               & GDouble.null
               & GDouble.null
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
            GtkHsvClass.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            getColor_
            (
              self
               & GDouble.null
               & GDouble.null
               & GDouble.null
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
            GtkHsvClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getMetrics_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (size, ringWidth)
      end
    fun isAdjusting self = (GtkHsvClass.FFI.withPtr false ---> GBool.FFI.fromVal) isAdjusting_ self
    fun setColor
      self
      (
        h,
        s,
        v
      ) =
      (
        GtkHsvClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setColor_
        (
          self
           & h
           & s
           & v
        )
    fun setMetrics self (size, ringWidth) =
      (
        GtkHsvClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
