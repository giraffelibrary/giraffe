structure GtkProgressBar :>
  GTK_PROGRESS_BAR
    where type 'a class = 'a GtkProgressBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_progress_bar_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_progress_bar_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getEllipsize_ = call (load_sym libgtk "gtk_progress_bar_get_ellipsize") (GtkProgressBarClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getFraction_ = call (load_sym libgtk "gtk_progress_bar_get_fraction") (GtkProgressBarClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getInverted_ = call (load_sym libgtk "gtk_progress_bar_get_inverted") (GtkProgressBarClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPulseStep_ = call (load_sym libgtk "gtk_progress_bar_get_pulse_step") (GtkProgressBarClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getShowText_ = call (load_sym libgtk "gtk_progress_bar_get_show_text") (GtkProgressBarClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getText_ = call (load_sym libgtk "gtk_progress_bar_get_text") (GtkProgressBarClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val pulse_ = call (load_sym libgtk "gtk_progress_bar_pulse") (GtkProgressBarClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setEllipsize_ = call (load_sym libgtk "gtk_progress_bar_set_ellipsize") (GtkProgressBarClass.PolyML.cPtr &&> PangoEllipsizeMode.PolyML.cVal --> PolyMLFFI.cVoid)
      val setFraction_ = call (load_sym libgtk "gtk_progress_bar_set_fraction") (GtkProgressBarClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> PolyMLFFI.cVoid)
      val setInverted_ = call (load_sym libgtk "gtk_progress_bar_set_inverted") (GtkProgressBarClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPulseStep_ = call (load_sym libgtk "gtk_progress_bar_set_pulse_step") (GtkProgressBarClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> PolyMLFFI.cVoid)
      val setShowText_ = call (load_sym libgtk "gtk_progress_bar_set_show_text") (GtkProgressBarClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setText_ = call (load_sym libgtk "gtk_progress_bar_set_text") (GtkProgressBarClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkProgressBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkProgressBarClass.C.fromPtr false) new_ ()
    fun getEllipsize self = (GtkProgressBarClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsize_ self
    fun getFraction self = (GtkProgressBarClass.C.withPtr ---> FFI.Double.C.fromVal) getFraction_ self
    fun getInverted self = (GtkProgressBarClass.C.withPtr ---> FFI.Bool.C.fromVal) getInverted_ self
    fun getPulseStep self = (GtkProgressBarClass.C.withPtr ---> FFI.Double.C.fromVal) getPulseStep_ self
    fun getShowText self = (GtkProgressBarClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowText_ self
    fun getText self = (GtkProgressBarClass.C.withPtr ---> Utf8.C.fromPtr false) getText_ self
    fun pulse self = (GtkProgressBarClass.C.withPtr ---> I) pulse_ self
    fun setEllipsize self mode = (GtkProgressBarClass.C.withPtr &&&> PangoEllipsizeMode.C.withVal ---> I) setEllipsize_ (self & mode)
    fun setFraction self fraction = (GtkProgressBarClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setFraction_ (self & fraction)
    fun setInverted self inverted = (GtkProgressBarClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInverted_ (self & inverted)
    fun setPulseStep self fraction = (GtkProgressBarClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setPulseStep_ (self & fraction)
    fun setShowText self showText = (GtkProgressBarClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowText_ (self & showText)
    fun setText self text = (GtkProgressBarClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setText_ (self & text)
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
