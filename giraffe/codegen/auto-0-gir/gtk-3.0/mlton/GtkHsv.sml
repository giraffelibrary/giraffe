structure GtkHsv :>
  GTK_HSV
    where type 'a class = 'a GtkHsvClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type direction_type_t = GtkDirectionType.t =
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
              FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
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
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
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
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val isAdjusting_ = _import "gtk_hsv_is_adjusting" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setColor_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_hsv_set_color" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
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
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getMetrics_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
