structure GtkProgressBar :>
  GTK_PROGRESS_BAR
    where type 'a class = 'a GtkProgressBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_progress_bar_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_progress_bar_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getEllipsize_ = call (load_sym libgtk "gtk_progress_bar_get_ellipsize") (GObjectObjectClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getFraction_ = call (load_sym libgtk "gtk_progress_bar_get_fraction") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getInverted_ = call (load_sym libgtk "gtk_progress_bar_get_inverted") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPulseStep_ = call (load_sym libgtk "gtk_progress_bar_get_pulse_step") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getShowText_ = call (load_sym libgtk "gtk_progress_bar_get_show_text") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getText_ = call (load_sym libgtk "gtk_progress_bar_get_text") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val pulse_ = call (load_sym libgtk "gtk_progress_bar_pulse") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setEllipsize_ = call (load_sym libgtk "gtk_progress_bar_set_ellipsize") (GObjectObjectClass.PolyML.cPtr &&> PangoEllipsizeMode.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFraction_ = call (load_sym libgtk "gtk_progress_bar_set_fraction") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setInverted_ = call (load_sym libgtk "gtk_progress_bar_set_inverted") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPulseStep_ = call (load_sym libgtk "gtk_progress_bar_set_pulse_step") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setShowText_ = call (load_sym libgtk "gtk_progress_bar_set_show_text") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setText_ = call (load_sym libgtk "gtk_progress_bar_set_text") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
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
    fun getEllipsize self = (GObjectObjectClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsize_ self
    fun getFraction self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getFraction_ self
    fun getInverted self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getInverted_ self
    fun getPulseStep self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getPulseStep_ self
    fun getShowText self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowText_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getText_ self
    fun pulse self = (GObjectObjectClass.C.withPtr ---> I) pulse_ self
    fun setEllipsize self mode = (GObjectObjectClass.C.withPtr &&&> PangoEllipsizeMode.C.withVal ---> I) setEllipsize_ (self & mode)
    fun setFraction self fraction = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setFraction_ (self & fraction)
    fun setInverted self inverted = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInverted_ (self & inverted)
    fun setPulseStep self fraction = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setPulseStep_ (self & fraction)
    fun setShowText self showText = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowText_ (self & showText)
    fun setText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setText_ (self & text)
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
