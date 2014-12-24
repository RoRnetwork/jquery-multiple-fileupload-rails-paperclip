jquery-multiple-fileupload-rails-paperclip
==========================================

https://github.com/blueimp/jQuery-File-Upload/wiki/Rails-setup-for-V6



<% content_for :javascript do %>
<%= javascript_include_tag 'images.js' %>
<% end %>

<div class="twelvecol">
    <h1 class="unionslg">Images</h1>
    <div class="twelvecol">
        <div class="portletFormContainer">
            <div class="portletFormTitle">
                <%=t :create_image%>
            </div>
            <div class="portletFormContent">


            
<%= form_for ([:administrator, @site, @administrator_image]), :html => { :multipart => true, :id => "fileupload"  } do |f| %>
   
    <div class="fileupload-buttonbar">
          
           <%= f.file_field :image, multiple: true %>
           
        <button type="submit" class="btn btn-primary start">
          <i class="icon-upload icon-white"></i>
          <span>Upload</span>
        </button>
        <button type="reset" class="btn btn-warning cancel">
          <i class="icon-ban-circle icon-white"></i>
          <span>Reset</span>
        </button>
        <li class="button"><%= link_to 'Back', administrator_site_images_path,:class=>"buttonLink backButton" %></li>
     </div>
    <!-- The loading indicator is shown during image processing -->
    <div class="fileupload-loading"></div>
    <br>
    <!-- The table listing the files available for upload/download -->
    <table class="table table-striped"><tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery"></tbody>
    </table>
  <% end %>

      </div>
        </div>
    </div>
</div>

<script>
  var fileUploadErrors = {
  maxFileSize: 'File is too big',
  minFileSize: 'File is too small',
  acceptFileTypes: 'Filetype not allowed',
  maxNumberOfFiles: 'Max number of files exceeded',
  uploadedBytes: 'Uploaded bytes exceed file size',
  emptyResult: 'Empty file upload result'
  };
</script>

<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
  {% for (var i=0, file; file=o.files[i]; i++) { %}
  <tr class="template-upload fade">
    <td class="preview"><span class="fade"></span></td>
    <td class="name"><input type="text" name="image[name]"value="{%= file.name.split('/').pop().split('.').shift()%}"/><span>{%=file.name%}</span></td>
    <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
    {% if (file.error) { %}
    <td class="error" colspan="2"><span class="label label-important">{%=locale.fileupload.error%}</span> {%=locale.fileupload.errors[file.error] || file.error%}</td>
    {% } else if (o.files.valid && !i) { %}

    <td class="start">{% if (!o.options.autoUpload) { %}
      <button class="">
        <span>{%="Upload"%}</span>
      </button>
      {% } %}</td>
    {% } else { %}
    <td colspan="2"></td>
    {% } %}
    <td class="cancel">{% if (!i) { %}
      <button class="btn btn-warning">
        <i class="icon-ban-circle icon-white"></i>
        <span>{%="Remove"%}</span>
      </button>
      {% } %}</td>
  </tr>
  {% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">

</script>

<script type="text/javascript" charset="utf-8">
  $(function () {

      $("#image_image").attr("name", "image[image]");
      // Initialize the jQuery File Upload widget:
      $('#fileupload').fileupload(
        {

          dataType: 'json',
          acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i, //png
          maxFileSize:10000000, //10 MB
          //maxNumberOfFiles: 30

        });
  $('#fileupload')
    .bind('fileuploadsubmit', function (e, data) {
       $.each(data.files, function (index, file) {
            alert('File Name: ' + file.name + '\n' + 'File Size: ' + file.size);
        });
    
    })
    .bind('fileuploadsend', function (e, data) {
      $.each(data.files, function (index, file) {
            alert('fileuploadsend' +'\n'+"==============="+ '\n' + 'File Name: ' + file.name + '\n' + 'File Size: ' + file.size);
        });

    })
    .bind('fileuploaddone', function (e, data) {
      $.each(data.files, function (index, file) {
            alert('fileuploaddone' +'\n'+"=====Minus=========="+ '\n' + 'File Name: ' + file.name + '\n' + 'File Size: ' + file.size);
        });

    })
    .bind('fileuploadfail', function (e, data) {
      $.each(data.files, function (index, file) {
            alert('fileuploadfail' +'\n'+"=======Minus========"+ '\n' + 'File Name: ' + file.name + '\n' + 'File Size: ' + file.size);
        });

    })



  });





   //$.each(file, function(key, element) {
      // alert('key: ' + key + '\n' + 'value: ' + element);
  //});
</script>






