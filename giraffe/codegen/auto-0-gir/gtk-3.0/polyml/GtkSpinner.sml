structure GtkSpinner :>
  GTK_SPINNER
    where type 'a class = 'a GtkSpinnerClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_spinner_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_spinner_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val start_ = call (getSymbol "gtk_spinner_start") (GtkSpinnerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val stop_ = call (getSymbol "gtk_spinner_stop") (GtkSpinnerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkSpinnerClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSpinnerClass.FFI.fromPtr false) new_ ()
    fun start self = (GtkSpinnerClass.FFI.withPtr ---> I) start_ self
    fun stop self = (GtkSpinnerClass.FFI.withPtr ---> I) stop_ self
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
