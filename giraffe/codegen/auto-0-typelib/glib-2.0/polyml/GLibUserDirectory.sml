structure GLibUserDirectory :>
  sig
    include G_LIB_USER_DIRECTORY
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            DIRECTORY_DESKTOP => f 0
          | DIRECTORY_DOCUMENTS => f 1
          | DIRECTORY_DOWNLOAD => f 2
          | DIRECTORY_MUSIC => f 3
          | DIRECTORY_PICTURES => f 4
          | DIRECTORY_PUBLIC_SHARE => f 5
          | DIRECTORY_TEMPLATES => f 6
          | DIRECTORY_VIDEOS => f 7
          | N_DIRECTORIES => f 8
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => DIRECTORY_DESKTOP
          | 1 => DIRECTORY_DOCUMENTS
          | 2 => DIRECTORY_DOWNLOAD
          | 3 => DIRECTORY_MUSIC
          | 4 => DIRECTORY_PICTURES
          | 5 => DIRECTORY_PUBLIC_SHARE
          | 6 => DIRECTORY_TEMPLATES
          | 7 => DIRECTORY_VIDEOS
          | 8 => N_DIRECTORIES
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    val null = DIRECTORY_DESKTOP
  end
