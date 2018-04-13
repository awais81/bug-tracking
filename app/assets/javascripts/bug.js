$(document).ready(function () {
	
  

  $(document).on("change", "#new-bug-type", function(event) {
	var type = document.getElementById("new-bug-type").value;
	var status=document.getElementById("new-bug-status-dropdown");
  	set_dropdown(type,status);
  });
  $(document).on("change", "#bug-type-selection", function(event) {
  	var type = document.getElementById("bug-type-selection").value;
	var status=document.getElementById("bug-dropdown");
  	set_dropdown(type,status);
  });
});
function set_dropdown(type,status) {
	console.log("sajbdb");
  if(type=="Feature"){
  	status.options[3].value="Completed";
    status.options[3].text="Completed";
  }else if(type=="Bug"){
	status.options[3].value="Resolved";
    status.options[3].text="Resolved";
  }else{
  	status.options[3].value="";
    status.options[3].text="";
  }
}