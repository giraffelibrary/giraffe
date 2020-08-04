structure GtkHsv :>
  GTK_HSV
    where type 'a class = 'a GtkHsvClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type direction_type_t = GtkDirectionType.t =
  struct
    val getType_ = _import "gtk_hsv_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_hsv_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
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
              GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
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
              GtkHsvClass.FFI.non_opt GtkHsvClass.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
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
              GtkHsvClass.FFI.non_opt GtkHsvClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val isAdjusting_ = _import "gtk_hsv_is_adjusting" : GtkHsvClass.FFI.non_opt GtkHsvClass.FFI.p -> GBool.FFI.val_;
    val setColor_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_hsv_set_color" :
              GtkHsvClass.FFI.non_opt GtkHsvClass.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
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
              GtkHsvClass.FFI.non_opt GtkHsvClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
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
