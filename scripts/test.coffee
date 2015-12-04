module.exports = (robot) ->
  robot.respond /((掃除))/i, (msg) ->
    data = 'blid={{ROOMBA_ID}}&robotpwd={{ROOMBA_PW}}&method=multipleFieldSet&value=%7b%22remoteCommand%22%20%3a%20%22start%22%7d'
    msg.http('https://irobot.axeda.com/services/v1/rest/Scripto/execute/AspenApiRequest')
      .header('Content-Type', 'application/x-www-form-urlencoded')
      .post(data) (err, res, body) ->
        json = JSON.parse body
        if json.status == "OK"
          msg.send "仕方ないね"
        else
          msg.send "ルンバに問題が発生しているよ"
