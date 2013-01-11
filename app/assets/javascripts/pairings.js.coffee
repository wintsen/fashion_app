# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#Modal launch lazyloader
jQuery ->
    $('.modal').on 'show', ->
        $(this).find('img').each ->
            $(this).attr("src", $(this).attr("lazycontent"))


#For Tag list form
jQuery ->
    $('#pairing_tag_list').select2
        placeholder: "Add tags to describe your pairing!"
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

#For Item list form
jQuery ->
    $('#pairing_item_array').select2
        placeholder: "Items used in pairing"
        width: "300px"
        multiple: true
        ajax:
            url: "items.json"
            dataType: "json"
            quietMillis: 100
            data: (term, page) ->
            results: (data, page) ->
                results: data
        formatResult: itemFormatResult = (item) ->
            item.name
        formatSelection: itemFormatSelect = (item) ->
            item.name

#helper function
#@uniq = 0
#@addimage = (url) ->
    #div = document.createElement("div")
    #uniqid = uniq++
    #div.innerHTML = "<input name=\"pairing[images_attributes][#{uniqid}][original_url]\" type=\"text\" value=\"#{url}\">"
    #parent = document.getElementsByClassName("field")[0]
    #parent.appendChild(div)


##Image upload
#jQuery ->
    #$('#fileupload').fileupload
        #add: (e, data) ->
            #types = /(\.|\/)(gif|jpe?g|png)$/i
            #file = data.files[0]
            #if types.test(file.type) || types.test(file.name)
                #data.context = $(tmpl("template-upload", file))
                #$('#fileupload').append(data.context)
                #data.submit()
            #else
                #alert("#{file.name} is not a gif, jpeg, or png image file")

        #progress: (e, data) ->
            #if data.context
                #progress = parseInt(data.loaded / data.total * 100, 10)
                #data.context.find('.bar').css('width', progress + '%')

        #done: (e, data) ->
            #file = data.files[0]
            #domain = $('#fileupload').attr('action')
            #path = $('#fileupload input[name=key]').val().replace('${filename}', file.name)
            ##to = $('#fileupload').data('post')
            ##content = {}
            ##content[$('#fileupload').data('as')] = domain + path
            #addimage(domain+path)
            ##$.post(to, content)
            ##data.context.remove() if data.context

        #fail: (e, data) ->
            #alert("#{data.files[0].name} failed to upload.")
            #console.log("Upload failed:")
            #console.log(data)


