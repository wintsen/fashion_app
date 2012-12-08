# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
    $('#item_tag_list').select2
        placeholder: "Add tags to describe your item!"
        width: "300px"
        multiple: true
        ajax:
            url: "http://localhost:3000/tags.json"
            dataType: "json"
            quietMillis: 100
            data: (term, page) ->
                q: term
            results: (data, page) ->
                results: data
        formatResult: tagFormatResult = (tag) ->
            tag.name
        formatSelection: tagFormatSelect = (tag) ->
            tag.name

jQuery ->
    $('#item_image').fileupload
        dataType: "script"
        types = /(\.|\/)(gif|jpe?g|png)$/i
        add: (e, data) ->
            file = data.files[0]
            if types.test(file.type) || types.test(file.name)
                data.context = $("template-upload", file)
                $('#item_image').append(data.context)
                data.submit()
            else
                alert("#{file.name} is not a gif, jpeg, or png image file")
        progress: (e, data) ->
            if data.context
                progress = parseInt(data.loaded/data.total * 100, 10)
                data.context.find('.bar').css('width', progress + '%')
