structure GtkLevelBar :>
  GTK_LEVEL_BAR
    where type 'a class = 'a GtkLevelBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type level_bar_mode_t = GtkLevelBarMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_level_bar_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_level_bar_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newForInterval_ = call (getSymbol "gtk_level_bar_new_for_interval") (GDouble.PolyML.cVal &&> GDouble.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val addOffsetValue_ =
        call (getSymbol "gtk_level_bar_add_offset_value")
          (
            GtkLevelBarClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val getInverted_ = call (getSymbol "gtk_level_bar_get_inverted") (GtkLevelBarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMaxValue_ = call (getSymbol "gtk_level_bar_get_max_value") (GtkLevelBarClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getMinValue_ = call (getSymbol "gtk_level_bar_get_min_value") (GtkLevelBarClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getMode_ = call (getSymbol "gtk_level_bar_get_mode") (GtkLevelBarClass.PolyML.cPtr --> GtkLevelBarMode.PolyML.cVal)
      val getOffsetValue_ =
        call (getSymbol "gtk_level_bar_get_offset_value")
          (
            GtkLevelBarClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GDouble.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getValue_ = call (getSymbol "gtk_level_bar_get_value") (GtkLevelBarClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val removeOffsetValue_ = call (getSymbol "gtk_level_bar_remove_offset_value") (GtkLevelBarClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setInverted_ = call (getSymbol "gtk_level_bar_set_inverted") (GtkLevelBarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMaxValue_ = call (getSymbol "gtk_level_bar_set_max_value") (GtkLevelBarClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setMinValue_ = call (getSymbol "gtk_level_bar_set_min_value") (GtkLevelBarClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setMode_ = call (getSymbol "gtk_level_bar_set_mode") (GtkLevelBarClass.PolyML.cPtr &&> GtkLevelBarMode.PolyML.cVal --> cVoid)
      val setValue_ = call (getSymbol "gtk_level_bar_set_value") (GtkLevelBarClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkLevelBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type level_bar_mode_t = GtkLevelBarMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkLevelBarClass.FFI.fromPtr false) new_ ()
    fun newForInterval (minValue, maxValue) = (GDouble.FFI.withVal &&&> GDouble.FFI.withVal ---> GtkLevelBarClass.FFI.fromPtr false) newForInterval_ (minValue & maxValue)
    fun addOffsetValue self (name, value) =
      (
        GtkLevelBarClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GDouble.FFI.withVal
         ---> I
      )
        addOffsetValue_
        (
          self
           & name
           & value
        )
    fun getInverted self = (GtkLevelBarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getInverted_ self
    fun getMaxValue self = (GtkLevelBarClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getMaxValue_ self
    fun getMinValue self = (GtkLevelBarClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getMinValue_ self
    fun getMode self = (GtkLevelBarClass.FFI.withPtr false ---> GtkLevelBarMode.FFI.fromVal) getMode_ self
    fun getOffsetValue self name =
      let
        val value & retVal =
          (
            GtkLevelBarClass.FFI.withPtr false
             &&&> Utf8.FFI.withOptPtr 0
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal && GBool.FFI.fromVal
          )
            getOffsetValue_
            (
              self
               & name
               & GDouble.null
            )
      in
        if retVal then SOME value else NONE
      end
    fun getValue self = (GtkLevelBarClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getValue_ self
    fun removeOffsetValue self name = (GtkLevelBarClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) removeOffsetValue_ (self & name)
    fun setInverted self inverted = (GtkLevelBarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setInverted_ (self & inverted)
    fun setMaxValue self value = (GtkLevelBarClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setMaxValue_ (self & value)
    fun setMinValue self value = (GtkLevelBarClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setMinValue_ (self & value)
    fun setMode self mode = (GtkLevelBarClass.FFI.withPtr false &&&> GtkLevelBarMode.FFI.withVal ---> I) setMode_ (self & mode)
    fun setValue self value = (GtkLevelBarClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setValue_ (self & value)
    local
      open ClosureMarshal Signal
    in
      fun offsetChangedSig f = signal "offset-changed" (get 0w1 string ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val invertedProp =
        {
          name = "inverted",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val maxValueProp =
        {
          name = "max-value",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val minValueProp =
        {
          name = "min-value",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val modeProp =
        {
          name = "mode",
          gtype = fn () => C.gtype GtkLevelBarMode.t (),
          get = fn x => fn () => C.get GtkLevelBarMode.t x,
          set = fn x => C.set GtkLevelBarMode.t x,
          init = fn x => C.set GtkLevelBarMode.t x
        }
      val valueProp =
        {
          name = "value",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
    end
  end
