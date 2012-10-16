structure GtkSpinner :>
  GTK_SPINNER
    where type 'a class_t = 'a GtkSpinnerClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_spinner_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_spinner_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val start_ = call (load_sym libgtk "gtk_spinner_start") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val stop_ = call (load_sym libgtk "gtk_spinner_stop") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkSpinnerClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSpinnerClass.C.fromPtr false) new_ ()
    fun start self = (GObjectObjectClass.C.withPtr ---> I) start_ self
    fun stop self = (GObjectObjectClass.C.withPtr ---> I) stop_ self
    local
      open Property
    in
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x
        }
    end
  end
