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
