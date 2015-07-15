$(document).ready ->
  $('#roll-dice').bind 'click', ->
    rollDice()
  $('#clear-dice').bind 'click', ->
    clearDice()
  $('#dice-roller-input').bind 'keyup', (e) ->
    rollInputChanged(e)


rollDice = () ->
  alert "TODO"

clearDice = () ->
  $("[id$='-amount']").val('')
  $("[id$='-modifier']").val('')

rollInputChanged = (e) ->
  if e.keyCode == 13
    submitDiceRoll()

submitDiceRoll = () ->
  formula = $('#dice-roller-input').val().replace(/\s/g, '')
  if validFormula formula
    formulaResult = evaluateFormula formula
    formula = formula.replace(/\+/g, ' + ')
    result = ""
    if $('#dice-roller-output').val() != ''
      result += "----------------------------------\n"
    result += formula + "\n" + "  = " + formulaResult + "\n"
    $('#dice-roller-output').append result
    $('#dice-roller-output').scrollTop($('#dice-roller-output')[0].scrollHeight)

validFormula = (formula) ->
  regex = /^((\d*d\d+)|(\d+))(\+((\d*d\d+)|(\d+)))*$/
  regex.test formula

evaluateFormula = (formula) ->
  result = formula.split('+')
  result = result.map evaluateDie
  sum = 0
  sum += n for n in result
  sum

evaluateDie = (die) ->
  if die.indexOf('d') == -1
    return parseInt(die)
  data = die.split('d')
  n = 1
  if data.length == 2
    n = data[0]
  d = data[data.length - 1]
  sum = 0
  sum += Math.floor((Math.random()*d)+1) for i in [0..n-1]
  sum


