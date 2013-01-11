# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#For Tag list form
jQuery ->
    $('#item_tag_list').select2
        placeholder: "Add tags to describe your item!"
        width: "300px"
        multiple: true
        ajax:
            url: "/tags.json"
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

#helper function
@uniq = 0
@addimage = (url) ->
    template = document.getElementById("image_field").cloneNode()
    parent = document.getElementsByClassName("field")[0]
    uniqid = uniq++
    template.setAttribute("name", template.getAttribute("name") + "[#{uniqid}[original_url]")
    template.setAttribute("value", url)
    parent.appendChild(template)

#Image upload
jQuery ->
    $('#fileupload').fileupload
        add: (e, data) ->
            types = /(\.|\/)(gif|jpe?g|png)$/i
            file = data.files[0]
            if types.test(file.type) || types.test(file.name)
                data.context = $(tmpl("template-upload", file))
                $('#fileupload').append(data.context)
                data.submit()
            else
                alert("#{file.name} is not a gif, jpeg, or png image file")

        progress: (e, data) ->
            if data.context
                progress = parseInt(data.loaded / data.total * 100, 10)
                data.context.find('.bar').css('width', progress + '%')

        done: (e, data) ->
            file = data.files[0]
            domain = $('#fileupload').attr('action')
            path = $('#fileupload input[name=key]').val().replace('${filename}', file.name)
            addimage(domain+path)

        fail: (e, data) ->
            alert("#{data.files[0].name} failed to upload.")
            console.log("Upload failed:")
            console.log(data)
