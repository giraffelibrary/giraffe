structure GtkHsv :>
  GTK_HSV
    where type 'a class_t = 'a GtkHsvClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type directiontype_t = GtkDirectionType.t =
  struct
    val getType_ = _import "gtk_hsv_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_hsv_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val toRgb_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_hsv_to_rgb" :
              FFI.Double.val_
               * FFI.Double.val_
               * FFI.Double.val_
               * FFI.Double.ref_
               * FFI.Double.ref_
               * FFI.Double.ref_
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
    val getColor_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_hsv_get_color" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.ref_
               * FFI.Double.ref_
               * FFI.Double.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getMetrics_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_hsv_get_metrics" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.ref_
               * FFI.Int32.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val isAdjusting_ = _import "gtk_hsv_is_adjusting" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val setColor_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_hsv_set_color" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.val_
               * FFI.Double.val_
               * FFI.Double.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setMetrics_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_hsv_set_metrics" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
            FFI.Double.withVal
             &&&> FFI.Double.withVal
             &&&> FFI.Double.withVal
             &&&> FFI.Double.withRefVal
             &&&> FFI.Double.withRefVal
             &&&> FFI.Double.withRefVal
             ---> FFI.Double.fromVal
                   && FFI.Double.fromVal
                   && FFI.Double.fromVal
                   && I
          )
            toRgb_
            (
              h
               & s
               & v
               & 0.0
               & 0.0
               & 0.0
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
             &&&> FFI.Double.withRefVal
             &&&> FFI.Double.withRefVal
             &&&> FFI.Double.withRefVal
             ---> FFI.Double.fromVal
                   && FFI.Double.fromVal
                   && FFI.Double.fromVal
                   && I
          )
            getColor_
            (
              self
               & 0.0
               & 0.0
               & 0.0
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
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getMetrics_
            (
              self
               & 0
               & 0
            )
      in
        (size, ringWidth)
      end
    fun isAdjusting self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isAdjusting_ self
    fun setColor self h s v =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
