$(document).ready(function () {
    $("#appointment_start_time" ).datetimepicker({
          dateFormat: 'yy-mm-dd',
          timeFormat: 'HH:mm:ss',
          step: 30,
          onShow: function () {
              this.setOptions({
                  maxDate:$('#appointment_end_time').val()?$('#appointment_end_time').val():false,
                 // maxTime:$('#appointment_end_time').val()?$('#appointment_end_time').val():false
              });
          }
    }).attr('readonly', 'readonly');
    $( "#appointment_end_time" ).datetimepicker({
        dateFormat: 'yy-mm-dd',
        timeFormat: 'HH:mm:ss',
        step: 30,
          onShow: function () {
              this.setOptions({
                  minDate:$('#appointment_start_time').val()?$('#appointment_start_time').val():false,
                 // minTime:$('#appointment_start_time').val()?$('#appointment_start_time').val():false
              });
          }                    
    }).attr('readonly', 'readonly'); 
  });