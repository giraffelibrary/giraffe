structure GtkProgressBar :>
  GTK_PROGRESS_BAR
    where type 'a class = 'a GtkProgressBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_progress_bar_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_progress_bar_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getEllipsize_ = call (getSymbol "gtk_progress_bar_get_ellipsize") (GtkProgressBarClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getFraction_ = call (getSymbol "gtk_progress_bar_get_fraction") (GtkProgressBarClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getInverted_ = call (getSymbol "gtk_progress_bar_get_inverted") (GtkProgressBarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPulseStep_ = call (getSymbol "gtk_progress_bar_get_pulse_step") (GtkProgressBarClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getShowText_ = call (getSymbol "gtk_progress_bar_get_show_text") (GtkProgressBarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getText_ = call (getSymbol "gtk_progress_bar_get_text") (GtkProgressBarClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val pulse_ = call (getSymbol "gtk_progress_bar_pulse") (GtkProgressBarClass.PolyML.cPtr --> cVoid)
      val setEllipsize_ = call (getSymbol "gtk_progress_bar_set_ellipsize") (GtkProgressBarClass.PolyML.cPtr &&> PangoEllipsizeMode.PolyML.cVal --> cVoid)
      val setFraction_ = call (getSymbol "gtk_progress_bar_set_fraction") (GtkProgressBarClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setInverted_ = call (getSymbol "gtk_progress_bar_set_inverted") (GtkProgressBarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPulseStep_ = call (getSymbol "gtk_progress_bar_set_pulse_step") (GtkProgressBarClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setShowText_ = call (getSymbol "gtk_progress_bar_set_show_text") (GtkProgressBarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setText_ = call (getSymbol "gtk_progress_bar_set_text") (GtkProgressBarClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
    end
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
    fun getText self = (GtkProgressBarClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getText_ self
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
          set = fn x => set "ellipsize" PangoEllipsizeMode.t x,
          new = fn x => new "ellipsize" PangoEllipsizeMode.t x
        }
      val fractionProp =
        {
          get = fn x => get "fraction" double x,
          set = fn x => set "fraction" double x,
          new = fn x => new "fraction" double x
        }
      val invertedProp =
        {
          get = fn x => get "inverted" boolean x,
          set = fn x => set "inverted" boolean x,
          new = fn x => new "inverted" boolean x
        }
      val pulseStepProp =
        {
          get = fn x => get "pulse-step" double x,
          set = fn x => set "pulse-step" double x,
          new = fn x => new "pulse-step" double x
        }
      val showTextProp =
        {
          get = fn x => get "show-text" boolean x,
          set = fn x => set "show-text" boolean x,
          new = fn x => new "show-text" boolean x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x,
          new = fn x => new "text" stringOpt x
        }
    end
  end
