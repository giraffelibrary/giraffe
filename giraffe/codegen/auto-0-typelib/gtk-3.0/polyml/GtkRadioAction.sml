structure GtkRadioAction :>
  GTK_RADIO_ACTION
    where type 'a class = 'a GtkRadioActionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_radio_action_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgtk "gtk_radio_action_new")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> FFI.Int32.PolyML.cVal
             --> GtkRadioActionClass.PolyML.cPtr
          )
      val getCurrentValue_ = call (load_sym libgtk "gtk_radio_action_get_current_value") (GtkRadioActionClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val joinGroup_ = call (load_sym libgtk "gtk_radio_action_join_group") (GtkRadioActionClass.PolyML.cPtr &&> GtkRadioActionClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setCurrentValue_ = call (load_sym libgtk "gtk_radio_action_set_current_value") (GtkRadioActionClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkRadioActionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name label tooltip stockId value =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         &&&> FFI.Int32.C.withVal
         ---> GtkRadioActionClass.C.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
           & value
        )
    fun getCurrentValue self = (GtkRadioActionClass.C.withPtr ---> FFI.Int32.C.fromVal) getCurrentValue_ self
    fun joinGroup self groupSource = (GtkRadioActionClass.C.withPtr &&&> GtkRadioActionClass.C.withOptPtr ---> I) joinGroup_ (self & groupSource)
    fun setCurrentValue self currentValue = (GtkRadioActionClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setCurrentValue_ (self & currentValue)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (get 0w1 GtkRadioActionClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val currentValueProp =
        {
          get = fn x => get "current-value" int x,
          set = fn x => set "current-value" int x
        }
      val groupProp = {set = fn x => set "group" GtkRadioActionClass.tOpt x}
      val valueProp =
        {
          get = fn x => get "value" int x,
          set = fn x => set "value" int x
        }
    end
  end
