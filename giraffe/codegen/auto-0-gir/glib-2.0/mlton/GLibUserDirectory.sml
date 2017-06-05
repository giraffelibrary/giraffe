structure GLibUserDirectory :> G_LIB_USER_DIRECTORY =
  struct
    datatype enum =
      DIRECTORY_DESKTOP
    | DIRECTORY_DOCUMENTS
    | DIRECTORY_DOWNLOAD
    | DIRECTORY_MUSIC
    | DIRECTORY_PICTURES
    | DIRECTORY_PUBLIC_SHARE
    | DIRECTORY_TEMPLATES
    | DIRECTORY_VIDEOS
    | N_DIRECTORIES
    structure Enum =
      Enum(
        type enum = enum
        val null = DIRECTORY_DESKTOP
        val toInt =
          fn
            DIRECTORY_DESKTOP => 0
          | DIRECTORY_DOCUMENTS => 1
          | DIRECTORY_DOWNLOAD => 2
          | DIRECTORY_MUSIC => 3
          | DIRECTORY_PICTURES => 4
          | DIRECTORY_PUBLIC_SHARE => 5
          | DIRECTORY_TEMPLATES => 6
          | DIRECTORY_VIDEOS => 7
          | N_DIRECTORIES => 8
        exception Value of GInt.t
        val fromInt =
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
      )
    open Enum
  end
