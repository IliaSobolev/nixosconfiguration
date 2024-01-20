{ config, pkgs, ... }:

{
  home.file.".config/kitty/kitty.conf".text = ''
    font_family      jetbrains mono nerd font
    font_size        13
    bold_font        auto
    italic_font      auto
    bold_italic_font auto
    mouse_hide_wait  2.0
    cursor_shape     block
    url_color        #0087bd
    url_style        dotted
    background_opacity 0.95

    #vim:ft=kitty
    shell nu

    disable_audio yes
    #The basic colors
    background  #282828
    foreground  #ebdbb2
    selection_foreground  #928374
    selection_background  #3c3836

    #Cursor colors
    cursor                #928374
    cursor_text_color       #303446

    #URL underline color when hovering with mouse
    url_color               #F2D5CF

    #Kitty window border colors
    active_border_color     #BABBF1
    inactive_border_color   #737994
    bell_border_color       #E5C890

    #OS Window titlebar colors
    wayland_titlebar_color system
    macos_titlebar_color system

    #Tab bar colors
    active_tab_foreground   #232634
    active_tab_background   #CA9EE6
    inactive_tab_foreground #C6D0F5
    inactive_tab_background #292C3C
    tab_bar_background      #232634

    #Colors for marks (marked text in the terminal)
    mark1_foreground #303446
    mark1_background #BABBF1
    mark2_background #CA9EE6
    mark3_foreground #303446
    mark3_background #85C1DC

    #The 16 terminal colors

    #black
    color0  #282828
    color8  #928374

    #red
    color1 #cc241d
    #light red
    color9 #fb4934

    #green
    color2 #98971a
    #light green
    color10 #b8bb26

    #yellow
    color3 #d79921
    #light yellow
    color11 #fabd2d

    #blue
    color4 #458588
    #light blue
    color12 #83a598
  
    #magenta
    color5 #b16286
    #light magenta
    color13 #d3869b

    #cyan
    color6 #689d6a
    #lighy cyan
    color14 #8ec07c

    #light gray
    color7 #a89984
    #dark gray
    color15 #928374

    #white
    color7  #B5BFE2
    color15 #A5ADCE
  '';
}
