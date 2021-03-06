$(document).ready ->

  $("#amount").keyup ->
    convertCurrency()

  $("#source_currency").change ->
    convertCurrency()

  $("#target_currency").change ->
    convertCurrency()

  $("#invert").click ->
    invertSourceAndTargetCurrency()

convertCurrency = ->
  if $("#amount").val() != '' && $("#amount").val() != '0'
    $.ajax '/convert',
        type: 'GET'
        dataType: 'json'
        data: {
                source_currency: $("#source_currency").val(),
                target_currency: $("#target_currency").val(),
                amount: $("#amount").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
      return false;

invertSourceAndTargetCurrency = ->
  source_currency_value = $("#source_currency").val()
  target_currency_value = $("#target_currency").val()

  $("#source_currency").val(target_currency_value)
  $("#target_currency").val(source_currency_value)

  convertCurrency()

