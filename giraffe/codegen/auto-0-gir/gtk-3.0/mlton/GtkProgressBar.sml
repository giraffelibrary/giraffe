structure GtkProgressBar :>
  GTK_PROGRESS_BAR
    where type 'a class = 'a GtkProgressBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    val getType_ = _import "gtk_progress_bar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_progress_bar_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getEllipsize_ = _import "gtk_progress_bar_get_ellipsize" : GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p -> PangoEllipsizeMode.FFI.val_;
    val getFraction_ = _import "gtk_progress_bar_get_fraction" : GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p -> GDouble.FFI.val_;
    val getInverted_ = _import "gtk_progress_bar_get_inverted" : GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p -> GBool.FFI.val_;
    val getPulseStep_ = _import "gtk_progress_bar_get_pulse_step" : GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p -> GDouble.FFI.val_;
    val getShowText_ = _import "gtk_progress_bar_get_show_text" : GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p -> GBool.FFI.val_;
    val getText_ = _import "gtk_progress_bar_get_text" : GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val pulse_ = _import "gtk_progress_bar_pulse" : GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p -> unit;
    val setEllipsize_ = fn x1 & x2 => (_import "gtk_progress_bar_set_ellipsize" : GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p * PangoEllipsizeMode.FFI.val_ -> unit;) (x1, x2)
    val setFraction_ = fn x1 & x2 => (_import "gtk_progress_bar_set_fraction" : GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setInverted_ = fn x1 & x2 => (_import "gtk_progress_bar_set_inverted" : GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPulseStep_ = fn x1 & x2 => (_import "gtk_progress_bar_set_pulse_step" : GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setShowText_ = fn x1 & x2 => (_import "gtk_progress_bar_set_show_text" : GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_progress_bar_set_text" :
              GtkProgressBarClass.FFI.notnull GtkProgressBarClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkProgressBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkProgressBarClass.FFI.fromPtr false) new_ ()
    fun getEllipsize self = (GtkProgressBarClass.FFI.withPtr ---> PangoEllipsizeMode.FFI.fromVal) getEllipsize_ self
    fun getFraction self = (GtkProgressBarClass.FFI.withPtr ---> GDouble.FFI.fromVal) getFraction_ self
    fun getInverted self = (GtkProgressBarClass.FFI.withPtr ---> GBool.FFI.fromVal) getInverted_ self
    fun getPulseStep self = (GtkProgressBarClass.FFI.withPtr ---> GDouble.FFI.fromVal) getPulseStep_ self
    fun getShowText self = (GtkProgressBarClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowText_ self
    fun getText self = (GtkProgressBarClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getText_ self
    fun pulse self = (GtkProgressBarClass.FFI.withPtr ---> I) pulse_ self
    fun setEllipsize self mode = (GtkProgressBarClass.FFI.withPtr &&&> PangoEllipsizeMode.FFI.withVal ---> I) setEllipsize_ (self & mode)
    fun setFraction self fraction = (GtkProgressBarClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setFraction_ (self & fraction)
    fun setInverted self inverted = (GtkProgressBarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setInverted_ (self & inverted)
    fun setPulseStep self fraction = (GtkProgressBarClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setPulseStep_ (self & fraction)
    fun setShowText self showText = (GtkProgressBarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowText_ (self & showText)
    fun setText self text = (GtkProgressBarClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setText_ (self & text)
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
