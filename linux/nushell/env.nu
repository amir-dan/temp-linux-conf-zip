$env.PROMPT_COMMAND = {|| $"(ansi -e '0;34m')($env.PWD)"}
$env.PROMPT_COMMAND_RIGHT = {|| ""}
$env.PROMPT_INDICATOR = {|| $"(ansi -e '0;1;31m') (ansi -e '0;1;33m')(ansi -e '0;1;32m') "}
$env.PROMPT_INDICATOR_VI_INSERT = {|| ""}
$env.PROMPT_INDICATOR_VI_NORMAL = {|| ""}
$env.PROMPT_MULTILINE_INDICATOR = {|| ""}
$env.config = {
  ls: {
    use_ls_colors: true
    clickable_links: false
  }
  rm: {
    always_trash: false
  }
  cd: {
    abbreviations: true
  }
  table: {
    mode: none
    index_mode: always
    trim: {
      methodology: wrapping
      wrapping_try_keep_words: false
    }
  }
  history: {
    max_size: 1000000
    sync_on_enter: true
    file_format: plaintext
  }
  completions: {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: prefix
    external: {
      enable: true
      max_results: 100
      completer: null
    }
  }
  filesize: {
    metric: true
    format: "auto"
  }
  color_config: {
    separator: white
    leading_trailing_space_bg: { attr: n }
    header: green_bold
    empty: blue
    bool: {|| if $in { 'light_cyan' } else { 'light_gray' } }
    int: white
    filesize: {|e|
      if $e == 0b {
        'white'
      } else if $e < 1mb {
        'cyan'
      } else { 'blue' }
    }
    duration: white
    date: {|| (date now) - $in |
      if $in < 1hr {
        '#e61919'
      } else if $in < 6hr {
        '#e68019'
      } else if $in < 1day {
        '#e5e619'
      } else if $in < 3day {
        '#80e619'
      } else if $in < 1wk {
        '#19e619'
      } else if $in < 6wk {
        '#19e5e6'
      } else if $in < 52wk {
        '#197fe6'
      } else { 'light_gray' }
    }
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cellpath: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
  }
  use_grid_icons: true
  footer_mode: 25
  float_precision: 2
  use_ansi_coloring: true
  edit_mode: emacs
  shell_integration: true
  show_banner: false
  render_right_prompt_on_last_line: false
  hooks: {
    pre_prompt: [{||
      null
    }]
    pre_execution: [{||
      null
    }]
    env_change: {
      PWD: [{|before, after|
        null
      }]
    }
    display_output: {||
      if (term size).columns >= 100 { table -e } else { table }
    }
  }
  menus: [
      {
        name: completion_menu
        only_buffer_difference: false
        marker: "| "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: help_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
  ]
  keybindings: [
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: [emacs vi_normal vi_insert]
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
    {
      name: completion_previous
      modifier: shift
      keycode: backtab
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menuprevious }
    }
    {
      name: yank
      modifier: control
      keycode: char_y
      mode: emacs
      event: {
        until: [
          {edit: pastecutbufferafter}
        ]
      }
    }
    {
      name: kill-line
      modifier: control
      keycode: char_k
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {edit: cuttolineend}
        ]
      }
    }
    {
      name: commands_menu
      modifier: control
      keycode: char_t
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: commands_menu }
    }
  ]
}
