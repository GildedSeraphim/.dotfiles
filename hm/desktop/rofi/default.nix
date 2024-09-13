{pkgs, config, lib,  ... }: {

  xdg.configFile."rofi/config.rasi".text = with config.lib.stylix.colors; ''
    * {
    font: "MapleMono NF 10";

    background: #${base00};
    foreground: #${base05};
    red:        #${base08};
    yellow:     #${base0A};
    green:      #${base0B};
    cyan:       #${base0C};
    blue:       #${base0D};
    purple:     #${base0E};

    element-spacing: 20px;
    element-margin: 1px;
    element-border-radius: 9px;
    element-padding: 10px;

    fg-color: @foreground;
    bg-color: @background;
    altbg-color: #${base01};
    window-padding: 22px;
}

configuration {
    modi: "drun";
    show-icons: false;
    display-drun: "";
}

listview {
    columns: 1;
    lines: 6;
    fixed-height: true;
    fixed-columns: true;
    cycle: false;
    scrollbar: false;
    border: 0px solid;
}

window {
    transparency: "real";
    width: 385px;
    background-color: @bg-color;
    border: 5px solid;
    border-radius: @element-border-radius;
    border-color: #${base0D};
    padding: @window-padding;
}

prompt {
    text-color: @fg-color;
}

inputbar {
    children: ["prompt", "entry"];
    spacing: 10px;
    background-color: @altbg-color;
    padding: 15px;
    border-radius: @element-border-radius;
}

entry {
    placeholder: "            launcher";
    text-color: @fg-color;
    placeholder-color: #${base08};
}

mainbox {
    spacing: @element-spacing;
    margin: @element-margin;
    padding: @element-padding;
    children: ["inputbar", "listview", "message"];
}

element {
    spacing: @element-spacing;
    margin: @element-margin;
    padding: @element-padding;
    border-radius: @element-border-radius;
    background-color: transparent;
    text-color: @fg-color;
}

element normal.normal {
	background-color: transparent;
	text-color: @fg-color;
}

element alternate.normal {
	background-color: @bg-color;
	text-color: @fg-color;
}

element selected.active {
	background-color: @fg-color;
	text-color: @bg-color;
}

element selected.normal {
	background-color: @red;
	text-color: @bg-color;
}

message {
    background-color: red;
    border: 0px solid;
}
  '';
}
