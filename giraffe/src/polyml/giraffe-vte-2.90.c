/* Copyright (C) 2012, 2017-2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Vte C interface support for Poly/ML
 */

#include <vte/vte.h>


/* VteTerminal */

gboolean
giraffe_vte_terminal_fork_command_full (VteTerminal *terminal,
                                        VtePtyFlags pty_flags,
                                        const char *working_directory,
                                        char **argv,
                                        char **envp,
                                        GSpawnFlags flags,
                                        GPid *child_pid,
                                        GError **error)
{
  return vte_terminal_fork_command_full (terminal,
                                         pty_flags,
                                         working_directory,
                                         argv,
                                         envp,
                                         flags,
                                         NULL,
                                         NULL,
                                         child_pid,
                                         error);
}


/*
 * This is commented out because child setup callbacks for VteTerminal
 * just don't work because the child setup callback _must_ call
 * vte_pty_child_setup (not documented in API) but vte_pty_child_setup
 * requires the terminal's VtePty object as its argument which is not
 * available to the callback.  vte_terminal_get_pty_object cannot be
 * used in the child setup callback because vte_terminal_set_pty_object
 * occurs after __vte_pty_spawn in vte_terminal_fork_command_full.
 *
 * So we always use NULL as the callback function which causes
 * vte_pty_child_setup to be called internally.

static void
giraffe_spawn_child_setup_dispatch (gpointer data)


gboolean
giraffe_vte_terminal_fork_command_full (VteTerminal *terminal,
                                        VtePtyFlags pty_flags,
                                        const char *working_directory,
                                        char **argv,
                                        char **envp,
                                        GSpawnFlags flags,
                                        guint callback_id,
                                        GPid *child_pid,
                                        GError **error)
{
  return vte_terminal_fork_command_full (terminal,
                                         pty_flags,
                                         working_directory,
                                         argv,
                                         envp,
                                         flags,
                                         giraffe_spawn_child_setup_dispatch,
                                         GUINT_TO_POINTER(callback_id),
                                         child_pid,
                                         error);
}

 *
 */
