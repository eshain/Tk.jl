## dialogs

## File dialogs functions. Tk keywords added
function GetOpenFile(;filetypes::Vector=String[], initialdir::String="",
                     initialfile::String="", multiple::Bool=false, title::String="")
  args = Dict()
  if length(filetypes) > 0 args["filetypes"] = filetypes end
  if length(initialdir) > 0 args["initialdir"] = initialdir end
  if length(initialfile) > 0 args["initialfile"] = initialfile end
  args["multiple"] = multiple
  if length(title) > 0 args["title"] = title end
  tcl("tk_getOpenFile", args)
end
function GetSaveFile(;filetypes::Vector=String[], initialdir::String="",
                    initialfile::String="", title::String="")
  args = Dict()
  if length(filetypes) > 0 args["filetypes"] = filetypes end
  if length(initialdir) > 0 args["initialdir"] = initialdir end
  if length(initialfile) > 0 args["initialfile"] = initialfile end
  if length(title) > 0 args["title"] = title end
  tcl("tk_getSaveFile", args)
end
function ChooseDirectory(;initialdir::String="",mustexist=false,title::String="")
  args = Dict()
  if length(initialdir) > 0 args["initialdir"] = initialdir end
  if length(title) > 0 args["title"] = title end
  args["mustexist"] = mustexist
    tcl("tk_chooseDirectory", args)
end

## Message box
function Messagebox(parent::MaybeWidget; title::String="", message::String="", detail::String="")
    args = Dict()
    if !isa(parent, Nothing) args["parent"] = get_path(parent) end
    if length(title) > 0 args["title"] = title  end
    if length(message) > 0 args["message"] = message end
    if length(detail) > 0 args["detail"] = detail end
    args["type"] = "okcancel"

    tcl("tk_messageBox", args)
end
Messagebox(;kwargs...) = Messagebox(nothing; kwargs...)
Messagebox(parent::Widget, message::String) = Messagebox(parent, message=message)
Messagebox(message::String) = Message(nothing, message=message)
