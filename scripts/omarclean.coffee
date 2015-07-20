#arrayTest = ["knows you're talking about him.","glares ominously.","wasn't paying attention that time."]

module.exports = (robot) ->
    #robot.hear /omar/i, (res) ->
      #res.emote res.random arrayTest
    robot.respond /version/i, (res) ->
      res.send "v0.0.3"
    robot.respond /test console/i, (res) ->
      res.send "testing console"
      console.log("testing console")