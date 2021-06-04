def add_custom_keybindings() -> None:
    """
    This module changes the IPython shortcuts to be similar to fish shell.

    Added key-bindings:

        ctrl + r   Navigate to previous IPython history
        ctrl + e   Navigate to next IPython history

    Used resources:

      - IPython Docs | Keyboard shortcuts:
        https://ipython.readthedocs.io/en/stable/config/details.html#keyboard-shortcuts
      - IPython Docs | Startup files:
        https://ipython.readthedocs.io/en/stable/interactive/tutorial.html#startup-files
    """

    # Imports are local to avoid polluting the IPython shell for the user
    from IPython import get_ipython
    from prompt_toolkit.keys import Keys


    ip = get_ipython()

    if getattr(ip, 'pt_app', None):
        registry = ip.pt_app.key_bindings
        history_previous = registry.get_bindings_for_keys(('c-p',))[0]
        history_next = registry.get_bindings_for_keys(('c-n',))[0]
        registry.add_binding(Keys.ControlR)(history_previous.handler)
        registry.add_binding(Keys.ControlE)(history_next.handler)


add_custom_keybindings()

# Delete the function to avoid polluting the IPython shell for the user
del add_custom_keybindings
