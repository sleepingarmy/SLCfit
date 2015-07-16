$(document).ready ->

  $("#log-activities-button").click ->
    $('.activity-row').each ->
      $tableRow = $(@)
      activityId = $tableRow.data().activityId
      activityDate = $tableRow.find('.date').val()
      activityDuration = $tableRow.find('.duration').val()
      activityDescription = $tableRow.find('.description').val()

      if(activityDate isnt "" and activityDuration isnt "" and activityDescription isnt "")
        $.ajax "/update_activity",
          type: 'PUT'
          data:
            id: activityId
            date: activityDate
            duration: activityDuration
            description: activityDescription
          success: (data) ->
            console.log data
          error: (data) ->
            console.log data

    $('#myModal').modal('hide')
    $.ajax '/activity_display',
      type: 'GET'
      data:
        week_id: $('.week-id:first').val()
      success: (data) ->
        $("#activity_display").html(data)

  $('#myModal').on 'shown.bs.modal', ->
    $activitiesHolder = $('#activities-holder')
    $activitiesHolder.empty()
    $(".activity-check:checked").each ->
      $.ajax '/activity_tr',
        type: 'GET'
        data:
          id: $(@).data().activityId
        success: (data) ->
          $activitiesHolder.append(data)
