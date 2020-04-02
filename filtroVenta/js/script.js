$(function() {
  var oTable = $('#grid').DataTable({
    "oLanguage": {
      "sUrl": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json",
      "sSearch": "Filter Data"
    },
    "iDisplayLength": -1,
    "sPaginationType": "two_button",
  });
  
  
  
  
  $("#datepicker_from").datepicker({
    showOn: "button",
    //dateFormat: "dd-mm-yy",
    monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ],
    dayNamesMin: [ "Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa" ],
    buttonImage: "images/calendar.gif",
    buttonImageOnly: false,
    "onSelect": function(date) {
      minDateFilter = new Date(date).getTime();
      oTable.fnDraw();
    }
  }).keyup(function() {
    minDateFilter = new Date(this.value).getTime();
    oTable.fnDraw();
  });
  
  $("#datepicker_to").datepicker({
    showOn: "button",
    //dateFormat: "dd-mm-yy",
    monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ],
    dayNamesMin: [ "Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa" ],
    buttonImage: "images/calendar.gif",
    buttonImageOnly: false,
    "onSelect": function(date) {
      maxDateFilter = new Date(date).getTime();
      oTable.fnDraw();
    }
  }).keyup(function() {
    maxDateFilter = new Date(this.value).getTime();
    oTable.fnDraw();
  });
});
  
// Date range filter
minDateFilter = "";
maxDateFilter = "";
  
$.fn.dataTableExt.afnFiltering.push(
  function(oSettings, aData, iDataIndex) {
    if (typeof aData._date == 'undefined') {
      aData._date = new Date(aData[0]).getTime();
    }
  
    if (minDateFilter && !isNaN(minDateFilter)) {
      if (aData._date < minDateFilter) {
        return false;
      }
    }
  
    if (maxDateFilter && !isNaN(maxDateFilter)) {
      if (aData._date > maxDateFilter) {
        return false;
      }
    }
  
    return true;
  }
);