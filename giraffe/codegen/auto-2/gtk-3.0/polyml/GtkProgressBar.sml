structure GtkProgressBar :>
  GTK_PROGRESS_BAR
    where type 'a class_t = 'a GtkProgressBarClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_progress_bar_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_progress_bar_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getEllipsize_ = call (load_sym libgtk "gtk_progress_bar_get_ellipsize") (GObjectObjectClass.PolyML.PTR --> PangoEllipsizeMode.PolyML.VAL)
      val getFraction_ = call (load_sym libgtk "gtk_progress_bar_get_fraction") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Double.VAL)
      val getInverted_ = call (load_sym libgtk "gtk_progress_bar_get_inverted") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getPulseStep_ = call (load_sym libgtk "gtk_progress_bar_get_pulse_step") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Double.VAL)
      val getShowText_ = call (load_sym libgtk "gtk_progress_bar_get_show_text") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getText_ = call (load_sym libgtk "gtk_progress_bar_get_text") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val pulse_ = call (load_sym libgtk "gtk_progress_bar_pulse") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setEllipsize_ = call (load_sym libgtk "gtk_progress_bar_set_ellipsize") (GObjectObjectClass.PolyML.PTR &&> PangoEllipsizeMode.PolyML.VAL --> FFI.PolyML.VOID)
      val setFraction_ = call (load_sym libgtk "gtk_progress_bar_set_fraction") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Double.VAL --> FFI.PolyML.VOID)
      val setInverted_ = call (load_sym libgtk "gtk_progress_bar_set_inverted") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setPulseStep_ = call (load_sym libgtk "gtk_progress_bar_set_pulse_step") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Double.VAL --> FFI.PolyML.VOID)
      val setShowText_ = call (load_sym libgtk "gtk_progress_bar_set_show_text") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setText_ = call (load_sym libgtk "gtk_progress_bar_set_text") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INOPTPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkProgressBarClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkProgressBarClass.C.fromPtr false) new_ ()
    fun getEllipsize self = (GObjectObjectClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsize_ self
    fun getFraction self = (GObjectObjectClass.C.withPtr ---> FFI.Double.fromVal) getFraction_ self
    fun getInverted self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getInverted_ self
    fun getPulseStep self = (GObjectObjectClass.C.withPtr ---> FFI.Double.fromVal) getPulseStep_ self
    fun getShowText self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getShowText_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getText_ self
    fun pulse self = (GObjectObjectClass.C.withPtr ---> I) pulse_ self
    fun setEllipsize self mode = (GObjectObjectClass.C.withPtr &&&> PangoEllipsizeMode.C.withVal ---> I) setEllipsize_ (self & mode)
    fun setFraction self fraction = (GObjectObjectClass.C.withPtr &&&> FFI.Double.withVal ---> I) setFraction_ (self & fraction)
    fun setInverted self inverted = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setInverted_ (self & inverted)
    fun setPulseStep self fraction = (GObjectObjectClass.C.withPtr &&&> FFI.Double.withVal ---> I) setPulseStep_ (self & fraction)
    fun setShowText self showText = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setShowText_ (self & showText)
    fun setText self text = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setText_ (self & text)
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
