# Description:
#   controlar los comandos de terminus y de drus
#
# Commands:
#   cc all <nombre_sitio> <entorno> - borra el cache de un sitio de panteon y su entorno


{exec} = require 'child_process'
module.exports = (robot) ->

#Borrando caches
  robot.respond /cc all (.+)\s(.*)/i, (msg) ->
    hostname = msg.match[1]
    env = msg.match[2]
    msg.send "Borrando el cache de #{hostname}..."

    if env.length = 0
      command = "terminus --site=#{hostname} drush cc all"

    command = "terminus --site=#{hostname} drush cc all --env=#{env}"
    msg.send "Este es el comando #{command}."

    exec command, (error, stdout, stderr) ->
      msg.send error if error
      msg.send "https://media.giphy.com/media/8WIJHInfWP6/giphy.gif" if stdout
      msg.send stderr if stderr

#Borrando caches
  robot.respond /deploy2test (.+)\s(.*)/i, (msg) ->
    hostname = msg.match[1]
    nota = msg.match[2]
    msg.send "Deploy a test en #{hostname}..."

    command = "terminus site deploy --site=#{hostname} --env=test --cc --note='Esto es cosa de hal-ito'"
    msg.send "Este es el comando #{command}."

    exec command, (error, stdout, stderr) ->
      msg.send error if error
      msg.send stdout if stdout
      msg.send stderr if stderr

#Borrando caches
  robot.respond /deploy2live (.+)\s(.*)/i, (msg) ->
    hostname = msg.match[1]
    nota = msg.match[2]
    msg.send "Deploy a test en #{hostname}..."

    command = "terminus site deploy --site=#{hostname} --env=live --cc --note='Esto es cosa de hal-ito'"
    msg.send "Este es el comando #{command}."

    exec command, (error, stdout, stderr) ->
      msg.send error if error
      msg.send stdout if stdout
      msg.send stderr if stderr



  # robot.hear /I like pie/i, (res) ->
  #   res.emote "makes a freshly baked pie"
  #
  # lulz = ['lol', 'rofl', 'lmao']
  #
  # robot.respond /lulz/i, (res) ->
  #   res.send res.random lulz
  #
  # robot.topic (res) ->
  #   res.send "#{res.message.teboot2docker --vm="Kalabox2" sshxt}? That's a Paddlin'"
  #
  #
  # enterReplies = ['Madefaker', 'Saludos ciudadano', 'Despiarta ostias', 'Como llegue miren veras', 'Gotcha', '¿Te veo?']
  # leaveReplies = ['Uno que se va sin hacer su trabajo', 'Ni caso es un perdedor', 'Searching']

  # robot.enter (res) ->
  #   res.send res.random enterReplies
  # robot.leave (res) ->
  #   res.send res.random leaveReplies
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (res) ->
  #   unless answer?
  #     res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   res.send "#{answer}, but what is the question?"
  #
  # robot.respond /you are a little slow/, (res) ->
  #   setTimeout () ->
  #     res.send "Who you calling 'slow'?"
  #   , 60 * 1000
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (res) ->
  #   if annoyIntervalId
  #     res.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     res.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, res) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if res?
  #     res.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (res) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     res.reply "I'm too fizzy.."
  #
  #   else
  #     res.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (res) ->
  #   robot.brain.set 'totalSodas', 0
  #   res.reply 'zzzzz'
