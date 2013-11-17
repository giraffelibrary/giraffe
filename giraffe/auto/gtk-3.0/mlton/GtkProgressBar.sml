structure GtkProgressBar :>
  GTK_PROGRESS_BAR
    where type 'a class_t = 'a GtkProgressBarClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t =
  struct
    val getType_ = _import "gtk_progress_bar_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_progress_bar_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getEllipsize_ = _import "gtk_progress_bar_get_ellipsize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoEllipsizeMode.C.val_;
    val getFraction_ = _import "gtk_progress_bar_get_fraction" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getInverted_ = _import "gtk_progress_bar_get_inverted" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getPulseStep_ = _import "gtk_progress_bar_get_pulse_step" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getShowText_ = _import "gtk_progress_bar_get_show_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getText_ = _import "gtk_progress_bar_get_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val pulse_ = _import "gtk_progress_bar_pulse" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setEllipsize_ = fn x1 & x2 => (_import "gtk_progress_bar_set_ellipsize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoEllipsizeMode.C.val_ -> unit;) (x1, x2)
    val setFraction_ = fn x1 & x2 => (_import "gtk_progress_bar_set_fraction" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setInverted_ = fn x1 & x2 => (_import "gtk_progress_bar_set_inverted" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setPulseStep_ = fn x1 & x2 => (_import "gtk_progress_bar_set_pulse_step" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setShowText_ = fn x1 & x2 => (_import "gtk_progress_bar_set_show_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_progress_bar_set_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkProgressBarClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkProgressBarClass.C.fromPtr false) new_ ()
    fun getEllipsize self = (GObjectObjectClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsize_ self
    fun getFraction self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getFraction_ self
    fun getInverted self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getInverted_ self
    fun getPulseStep self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getPulseStep_ self
    fun getShowText self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowText_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getText_ self
    fun pulse self = (GObjectObjectClass.C.withPtr ---> I) pulse_ self
    fun setEllipsize self mode = (GObjectObjectClass.C.withPtr &&&> PangoEllipsizeMode.C.withVal ---> I) setEllipsize_ (self & mode)
    fun setFraction self fraction = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setFraction_ (self & fraction)
    fun setInverted self inverted = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInverted_ (self & inverted)
    fun setPulseStep self fraction = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setPulseStep_ (self & fraction)
    fun setShowText self showText = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowText_ (self & showText)
    fun setText self text = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setText_ (self & text)
    local
      open Property
    in
      val ellipsizeProp =
        {
          get = fn x => get "ellipsize" PangoEllipsizeMode.t x,
          set = fn x => set "ellipsize" PangoEllipsizeMode.t x
        }
      val fractionProp =
        {
          get = fn x => get "fraction" double x,
          set = fn x => set "fraction" double x
        }
      val invertedProp =
        {
          get = fn x => get "inverted" boolean x,
          set = fn x => set "inverted" boolean x
        }
      val pulseStepProp =
        {
          get = fn x => get "pulse-step" double x,
          set = fn x => set "pulse-step" double x
        }
      val showTextProp =
        {
          get = fn x => get "show-text" boolean x,
          set = fn x => set "show-text" boolean x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
    end
  end
