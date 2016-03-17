structure AtkMisc :>
  ATK_MISC
    where type 'a class = 'a AtkMiscClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_misc_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getInstance_ = call (load_sym libatk "atk_misc_get_instance") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val threadsEnter_ = call (load_sym libatk "atk_misc_threads_enter") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val threadsLeave_ = call (load_sym libatk "atk_misc_threads_leave") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a AtkMiscClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInstance () = (I ---> AtkMiscClass.C.fromPtr false) getInstance_ ()
    fun threadsEnter self = (GObjectObjectClass.C.withPtr ---> I) threadsEnter_ self
    fun threadsLeave self = (GObjectObjectClass.C.withPtr ---> I) threadsLeave_ self
  end
