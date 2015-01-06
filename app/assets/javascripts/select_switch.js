$(function() {
  $.fn.selectSwitch = function(options) {

    options = $.extend({
      divIdBase: "#selector-div",
      divClass: ".form-switch-div"
    }, options);

    console.log("Setting up selectSwitch plugin");
    var idBase = options.divIdBase;
    var classSelector = $(options.divClass)

    var createShowSelectName = function(val, base) {
      if (typeof val == 'undefined') {
        throw "Must pass in a value as first param to createShowSelector";
      }
      var ret;
      if (typeof base == 'undefined') {
        ret = "#" + val;
      }
      else {
        ret = base + "-" + val;
      }
      return ret;
    }

    var toggleDivs = function(showSelect, classSelect) {
      if (typeof showSelect == 'undefined') {
        throw "Must provide showSelect as first param to toggleDivs";
      }
      if (typeof classSelect == 'undefined') {
        throw "Must provide classSelect as second param to toggleDivs";
      }
      classSelect.hide();
      showSelect.show();
    }

    return this.each( function() {
      var $this = $(this);
    
      $this.on('change', function(ev) {
        console.log("Change called!");
        var currVal = $this.val();
        var showSelectName = createShowSelectName(currVal, idBase);
        var showSelector = $(showSelectName);
        $('#info-div').text(currVal);
        toggleDivs(showSelector, classSelector);
      });
    });
  };
}(jQuery));