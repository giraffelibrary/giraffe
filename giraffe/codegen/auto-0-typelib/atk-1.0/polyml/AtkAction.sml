structure AtkAction :>
  ATK_ACTION
    where type 'a class = 'a AtkActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_action_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val doAction_ = call (load_sym libatk "atk_action_do_action") (AtkActionClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val getDescription_ = call (load_sym libatk "atk_action_get_description") (AtkActionClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getKeybinding_ = call (load_sym libatk "atk_action_get_keybinding") (AtkActionClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getLocalizedName_ = call (load_sym libatk "atk_action_get_localized_name") (AtkActionClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getNActions_ = call (load_sym libatk "atk_action_get_n_actions") (AtkActionClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getName_ = call (load_sym libatk "atk_action_get_name") (AtkActionClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val setDescription_ =
        call (load_sym libatk "atk_action_set_description")
          (
            AtkActionClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a AtkActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun doAction self i = (AtkActionClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) doAction_ (self & i)
    fun getDescription self i = (AtkActionClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 0) getDescription_ (self & i)
    fun getKeybinding self i = (AtkActionClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 0) getKeybinding_ (self & i)
    fun getLocalizedName self i = (AtkActionClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 0) getLocalizedName_ (self & i)
    fun getNActions self = (AtkActionClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNActions_ self
    fun getName self i = (AtkActionClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 0) getName_ (self & i)
    fun setDescription self i desc =
      (
        AtkActionClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        setDescription_
        (
          self
           & i
           & desc
        )
  end
