signature G_LIB_USER_DIRECTORY =
  sig
    datatype t =
      DIRECTORY_DESKTOP
    | DIRECTORY_DOCUMENTS
    | DIRECTORY_DOWNLOAD
    | DIRECTORY_MUSIC
    | DIRECTORY_PICTURES
    | DIRECTORY_PUBLIC_SHARE
    | DIRECTORY_TEMPLATES
    | DIRECTORY_VIDEOS
    | N_DIRECTORIES
    val null : t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.C.val_
      end
  end
