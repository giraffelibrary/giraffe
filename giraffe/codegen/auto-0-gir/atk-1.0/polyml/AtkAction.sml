structure AtkAction :>
  ATK_ACTION
    where type 'a class = 'a AtkActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_action_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val doAction_ = call (load_sym libatk "atk_action_do_action") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val getDescription_ = call (load_sym libatk "atk_action_get_description") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getKeybinding_ = call (load_sym libatk "atk_action_get_keybinding") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getLocalizedName_ = call (load_sym libatk "atk_action_get_localized_name") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getNActions_ = call (load_sym libatk "atk_action_get_n_actions") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getName_ = call (load_sym libatk "atk_action_get_name") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val setDescription_ =
        call (load_sym libatk "atk_action_set_description")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a AtkActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun doAction self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) doAction_ (self & i)
    fun getDescription self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr false) getDescription_ (self & i)
    fun getKeybinding self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr false) getKeybinding_ (self & i)
    fun getLocalizedName self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr false) getLocalizedName_ (self & i)
    fun getNActions self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNActions_ self
    fun getName self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr false) getName_ (self & i)
    fun setDescription self i desc =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        setDescription_
        (
          self
           & i
           & desc
        )
  end
