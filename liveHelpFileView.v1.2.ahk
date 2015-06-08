
;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
; if you press a letter or curser move script will open help file and get cursor back to scite.
; F1 will be triggerd as soon something is typed and idle time is more then 650 or so.
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#Persistent

doMoveCursor:=false
typedGlobal:=""

setbatchlines -1
SetTitleMatchMode,2


Loop,
{
  WinGetActiveTitle,at
  WinGetClass,ac,%at% 
  atc := at . " ahk_class " . ac 
  ;~ ToolTip,%A_TimeIdle% := A_TimeIdle `n
  ;~ ToolTip,%typedGlobal%
  if(  InStr(atc,"ahk_class SciTEWindow") && A_TimeIdle > 650  ){
    ;~ p := getMousePos()
    
    ;~ if ( p["x"] != pB["x"r] or  p["y"] != pB["y"]  ){
      ; mouse move recognition
      ;~ pB := p
      ;~ Sleep,700
      
      ;~ continue
    ;~ }
    if(StrLen(typedGlobal)<1)
      continue
    
    typedGlobal:=""
    
				;~ ToolTip % rArea["l"] . " " rArea["t"] . " `n " rArea["r"] . " " rArea["b"] . "  `n  `n " p["x"] . " " p["y"] . " " 
    
    if(doMoveCursor==true){
      SetKeyDelay,0,0
      Send,{Left 3}
    }
    SetKeyDelay,0,30
    Send,{f1}
    Sleep,10
    ; fight focus back
  ;~ rightNum:=3

  loop
  {
    WinActivate,%at%  
    IfWinActive,%at%
    {
      if(doMoveCursor==true){
        SetKeyDelay,0,0 
        Send,{Right 3}
      }
      goto, break_outer32
    }
    Sleep,10
  } 

break_outer32: 
WinWaitNotActive,%at%,,2
  lll(A_LineNumber, "liveHelpFileView.v1.2.ahk",Last_A_This)
  Loop
  {
      IfWinNotActive,%at%
        WinActivate,%at%
      ;~ WinWaitActive,%at%,,1
      IfWinActive,%at%
      {
        ;~ Goto, break_outer40
        ;~ ToolTip,fight for focus
        ;~ lll(A_LineNumber, "liveHelpFileView.v1.2.ahk",Last_A_This)
      }
      Sleep,40
      ;AutoHotkey Help ahk_class HH Parent 
 ; w=1280,
 ; x=428,y=28,t=0x241932
      IfWinActive,%at%
        goto,break_outer40
    }
    break_outer40: 
    lll(A_LineNumber, "liveHelpFileView.v1.2.ahk",Last_A_This)
    Sleep,700   
  }
  Sleep,500
 }
; hjkl
return

letterPressed(l,typedGlobal){
  ;~ global typedGlobal
  typedGlobal .= l ; 
  ;~ If(l = " "){
    ;~ openHelpFile(typedGlobal)
    ;~ typedGlobal:=""
  ;~ }
  return typedGlobal
}
if(true){
  
#IfWinActive,ahk_class SciTEWindow  ; x=588,y=22,t=0xf19d8
~*a::typedGlobal := letterPressed("a",typedGlobal) 
~*b::typedGlobal := letterPressed("b",typedGlobal) 
~*c::typedGlobal := letterPressed("c",typedGlobal) 
~*d::typedGlobal := letterPressed("d",typedGlobal) 
~*e::typedGlobal := letterPressed("e",typedGlobal) 
~*f::typedGlobal := letterPressed("f",typedGlobal) 
~*g::typedGlobal := letterPressed("g",typedGlobal) 
~*h::typedGlobal := letterPressed("h",typedGlobal) 
~*i::typedGlobal := letterPressed("i",typedGlobal) 
~*j::typedGlobal := letterPressed("j",typedGlobal) 
~*k::typedGlobal := letterPressed("k",typedGlobal) 
~*l::typedGlobal := letterPressed("l",typedGlobal) 
~*m::typedGlobal := letterPressed("m",typedGlobal) 
~*n::typedGlobal := letterPressed("n",typedGlobal) 
~*o::typedGlobal := letterPressed("o",typedGlobal) 
~*p::typedGlobal := letterPressed("p",typedGlobal) 
~*q::typedGlobal := letterPressed("q",typedGlobal) 
~*r::typedGlobal := letterPressed("r",typedGlobal) 
~*s::typedGlobal := letterPressed("s",typedGlobal) 
~*t::typedGlobal := letterPressed("t",typedGlobal) 
~*u::typedGlobal := letterPressed("u",typedGlobal) 
~*v::typedGlobal := letterPressed("v",typedGlobal) 
~*w::typedGlobal := letterPressed("w",typedGlobal) 
~*x::typedGlobal := letterPressed("x",typedGlobal) 
~*y::typedGlobal := letterPressed("y",typedGlobal) 
~*z::typedGlobal := letterPressed("z",typedGlobal) 
~Space::typedGlobal := letterPressed(" ",typedGlobal) 
;~ ~*ä::typedGlobal := letterPressed("ä",typedGlobal) 
;~ ~*ö::typedGlobal := letterPressed("ö",typedGlobal) 
;~ ~*ü::typedGlobal := letterPressed("ü",typedGlobal) 
~*Left::typedGlobal := letterPressed("Left",typedGlobal) 
~*Right::typedGlobal := letterPressed("Right",typedGlobal) 
~*Up::typedGlobal := letterPressed("Up",typedGlobal) 
~*Down::typedGlobal := letterPressed("Down",typedGlobal) 
}


return  ; probably redundant. its more secure if we do that.
