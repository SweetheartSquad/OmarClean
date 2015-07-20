# Description:
#   Testing out intervals


module.exports = (robot) ->
  cronJob = require('cron').CronJob # require cron dependency and assign its CronJob prototype to cronJob
  job1 = null
  job2 = null
  room = "359195_test@conf.hipchat.com" # set the target chatroom
  tz = 'America/Toronto' # set the desired timezone

  startCronJobs = () ->
    stopCronJobs
    console.log("starting cron jobs")
    job1 = new cronJob('0 0 18 * * 0-6', dailyReminder, null, true, tz) # executes every day at 6PM
    job2 = new cronJob('0 0 18 * * 5', weeklyReminder, null, true, tz) # executes every friday at 6PM

  stopCronJobs = () ->
    console.log("stopping cron jobs")
    if job1 != null
      job1.stop()
    if job2 != null
      job2.stop()
    job1 = null
    job2 = null

  setTimeout(startCronJobs, 10000)
  
  
  dailyReminder = ->
    robot.messageRoom room, "@SeanLeblanc, @CatherineWong, @IanMartin, remember to post a character today!"
    console.log("Daily art reminder posted")
  
  weeklyReminder = ->
    robot.messageRoom room, "@all Remember to post a write-up if you haven't already this week!"
    console.log("Weekly summary reminder posted")



  robot.respond /stop cronjobs/i, (res) ->
    stopCronJobs()

  robot.respond /start cronjobs/i, (res) ->
    startCronJobs()