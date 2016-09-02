<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="filter-wrapper">
 <div class="keyword-wrapper">
<input type="text" id="keyword" autocomplete="off" placeholder="start typing please..." required />
  <a href="#" target="_blank" id="keyword-button"><i class="fa fa-search-plus"></i></a>
  </div>
<ul id="filter-select" class="filter-select no-value">
</ul>
</section>


 <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript">
//global variables
var keyword = $("#keyword");
var filterSelect = $("#filter-select");
var keywordHref = $("#keyword-button").attr("href");
var keywordVal = "";

var filterArray = ["New York, New York",
"Los Angeles, California",
"Chicago, Illinois"];
var newFilter = [];
var tabIndex = -1;
//Events

keyword.on("focus", function(e){
  e.preventDefault();
  if (keywordVal !== "" && keydownTarget !== 9 && keydownTarget !== 16 && keydownTarget !== 38 && keydownTarget !== 40 && newFilter.length > 1) {
    fillSelect();
  }
});
keyword.on("keyup", function(e) {
  keywordVal = $(this).val();
  keydownTarget = e.which;
  var ignoreKeys = e.which !== 9 && e.which !== 16 && e.which !== 38 && e.which !== 40;
  if (keywordVal !== "" && ignoreKeys) {
     newFilter = filterArray.filter(isResult);
    if (newFilter.length === 0) {
      removeListBlur();
      return false;
    }

  }

  if (e.which !== 9 && ignoreKeys) {
    fillSelect();
    tabIndex = -1;
    if (newFilter.length === 0) {
      removeListBlur();
      return false;
    }

  }
});
keyword.on("keydown", function(e) {
  if (keywordVal !== "") {
    if (e.which === 9) {
    e.preventDefault();
      keydownTarget = e.which;
    if (!e.shiftKey) {
      cycleSelectList("next");
    }
    if (e.shiftKey) {
      cycleSelectList("previous");
    }
  }
    if (e.which === 38 || e.which === 40) {
      e.preventDefault();
      keydownTarget = e.which;
    }
    if (e.which === 38) {
      cycleSelectList("previous");
    }
    else if (e.which === 40) {
      cycleSelectList("next");
    }
  }
  if (e.which === 13) {
    $("#keyword-button").click()
  }
});
/*use mousedown instead of click because the keyword blur event is firing before this call back can occur*/
$("#filter-select").on("mousedown",".filter-select-list", function(e){
  e.preventDefault();
  var $this = $(this);
  var currentIndex = $this.index();
  tabIndex = currentIndex;
  keydownTarget = 9;
  cycleSelectList("none");
});
keyword.on('blur', removeListBlur);
//helper functions
function isResult(val) {
		return val.indexOf(keywordVal.toLowerCase()) === 0
}
function removeListBlur() {
  if (filterSelect.has("li").length) {
    filterSelect.addClass("no-value").children("li").remove();
  }
}
function cycleSelectList(direction) {
  var newList = filterSelect.find("li");
   if (direction === "previous") {
      if (tabIndex <= 0) {
        tabIndex = newList.length;
      }
      tabIndex--;
    }
    else if (direction === "next") {
      tabIndex++;
      if (tabIndex === newList.length) {

        tabIndex = 0;
      }
    }
  newList.eq(tabIndex).addClass("list-highlight");
  keyword.val(newList.eq(tabIndex).attr("data-value"));
  newList.not(newList.eq(tabIndex)).removeClass("list-highlight");
    keyword.focus();
}
function fillSelect() {
  filterSelect.children("li").remove();
  //filterSelect.attr("size",newFilter.length)
  if (keywordVal !== "") {
    filterSelect.removeClass("no-value");
  for (var i = 0; i < newFilter.length; i++) {
    filterSelect.append("<li class='filter-select-list' data-value='" + newFilter[i] + "'>" + newFilter[i] + "</li>");
    //filters[i].sprite;
  }
  }
  else {
    filterSelect.addClass("no-value");
  }
}
//for demo purposes only
$("#keyword-button").on("click", fillHref)
function fillHref() {
  var newHrefString = keywordHref + keyword.val().replace(/\s+/g, '+');
  var newHref = $("#keyword-button").attr("href", newHrefString);
}
</script>

</body>
</html>
