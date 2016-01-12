(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

fun use file =
  PolyML.use (
    if OS.Path.isRelative file
    then
      case PolyML.getUseFileName () of
        SOME name => OS.Path.concat (OS.Path.dir name, file)
      | NONE      => file
    else
      file
  )
