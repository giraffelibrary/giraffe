structure AtkMisc :>
  ATK_MISC
    where type 'a class = 'a AtkMiscClass.class =
  struct
    val getType_ = _import "atk_misc_get_type" : unit -> GObjectType.FFI.val_;
    val getInstance_ = _import "atk_misc_get_instance" : unit -> AtkMiscClass.FFI.notnull AtkMiscClass.FFI.p;
    val threadsEnter_ = _import "atk_misc_threads_enter" : AtkMiscClass.FFI.notnull AtkMiscClass.FFI.p -> unit;
    val threadsLeave_ = _import "atk_misc_threads_leave" : AtkMiscClass.FFI.notnull AtkMiscClass.FFI.p -> unit;
    type 'a class = 'a AtkMiscClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getInstance () = (I ---> AtkMiscClass.FFI.fromPtr false) getInstance_ ()
    fun threadsEnter self = (AtkMiscClass.FFI.withPtr ---> I) threadsEnter_ self
    fun threadsLeave self = (AtkMiscClass.FFI.withPtr ---> I) threadsLeave_ self
  end
