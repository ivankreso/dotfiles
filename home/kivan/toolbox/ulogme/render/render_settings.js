// various settings for the rendering, to be modified by user

// these are all regex patterns and the corresponding mapped title string
// the function mapwin() below will use these to transform the raw window
// titles into common groups. For example, any title mentioning Google Chrome
// may get mapped to just "Google Chrome".
// these get applied in order they are specified, from top to bottom
var title_mappings = [
{pattern : /Google Chrome/, mapto : 'Chromium'},
{pattern : /Chromium/, mapto : 'Chromium'},
{pattern : /Firefox/, mapto : 'Chromium'}, // lol
//{pattern : /MATLAB/, mapto : 'Matlab'},
{pattern : /Inotebook/, mapto : 'INotebook'},
{pattern : /.pdf/, mapto : 'Papers'},
{pattern : /Gmail/, mapto : 'Mail'},
{pattern : /Thunderbird/, mapto : 'Mail'},
{pattern : /Write: Re:/, mapto : 'Mail'},
{pattern : /kivan@/, mapto : 'Terminal'},
{pattern : /tmux/, mapto : 'Terminal'},
{pattern : /GVIM/, mapto : 'Vim'},
//{pattern : /Sublime Text/, mapto : 'SubText2'},
{pattern : /ipython/, mapto : 'Coding'},
{pattern : /Geeqie/, mapto : 'Coding'},
{pattern : /\.js.*GVIM/, mapto : 'Coding'},
{pattern : /\.py.*GVIM/, mapto : 'Coding'},
{pattern : /\.html.*GVIM/, mapto : 'Coding'},
{pattern : /\.cpp.*GVIM/, mapto : 'Coding'},
{pattern : /\.cc.*GVIM/, mapto : 'Coding'},
{pattern : /\.h.*GVIM/, mapto : 'Coding'},
{pattern : /\.hpp.*GVIM/, mapto : 'Coding'},
{pattern : /__LOCKEDSCREEN/, mapto : 'Locked Screen'}, // __LOCKEDSCREEN is a special token
{pattern : /TeXstudio/, mapto : 'Latex'},
{pattern : /TeXworks/, mapto : 'Latex'},
];

// be very careful with ordering in the above because titles
// get matched from up to down (see mapwin()), so put the more specific
// window title rules on the bottom and more generic ones on top

/*
This function takes a raw window title w as string
and outputs a more compact code, to be treated as a single
unit during rendering. Every single possibility output from
this function will have its own row and its own analysis
*/
function mapwin(w) {
  var n = title_mappings.length;
  var mapped_title = 'MISC';
  for(var i=0;i<n;i++) {
    var patmap = title_mappings[i];
    if(patmap.pattern.test(w)) {
      mapped_title = patmap.mapto;
    }
  }
  return mapped_title;
}

// These groups will be rendered together in the "barcode view". For example, I like
// to group my work stuff and play stuff together.
var display_groups = [];
display_groups.push(["Gmail", "Chromium", "MISC", "Vim"]); // internet related
display_groups.push(["Coding", "INotebook", "Terminal", "Papers"]); // work related
display_groups.push(["TeXstudio", "TeXworks"]); // paper writing related
display_groups.push(["Locked Screen"]); // computer not being used 

// list of titles that classify as "hacking", or being productive in general
// the main goal of the day is to get a lot of focused sessions of hacking
// done throughout the day. Windows that arent in this list do not
// classify as hacking, and they break "streaks" (events of focused hacking)
// the implementation is currently quite hacky, experimental and contains 
// many magic numbers.
var hacking_titles = ["INotebook", "Terminal", "Coding"];
var draw_hacking = true; // by default turning this off

// draw notes row?
var draw_notes = true;

// experimental coffee levels indicator :)
// looks for notes that mention coffee and shows 
// levels of coffee in body over time
var draw_coffee = false;
