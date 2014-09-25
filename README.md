**vim-omniref** is a minimal Vim plugin for making searches on Omniref from the
editor and opening the results in a new browser window.

I plan to extend this plugin to be super best friends with Omniref, so stay tuned!

Install
-------

You can simply put omniref.vim in your Vim plugins directory (usually,
*~/.vim/plugin*).

But if you're using [Pathogen](https://github.com/tpope/vim-pathogen), which
I recommend wholeheartedly, please proceed like this:

```bash
$ cd ~/.vim/bundle
$ git clone https://github.com/svankmajer/vim-omniref.git
```

That's it.

Usage
-----

You can perform searches in Omniref in various ways.

For example, you can position your cursor on a word and call `:Omniref`. You can
select a collection of words in visual mode and then call `Omniref`. For both
ways, you can prepend some keywords calling `:Omniref addtional keywords`

Lastly, you can call `:Omniref` passing it a word or phrase directly, like
this:`:Omniref ActiveModel::Validator`.


Credit
------

vim-omniref is almost entirely based on [vim-g](https://github.com/szw/vim-g),
by [szw](https://github.com/szw).
