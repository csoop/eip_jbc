// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require dropzone
//= require_tree .

Dropzone.options.photoDropzone = {
  paramName: "image",
  maxFilesize: 2,
  //允许上传多个照片
  uploadMultiple: true,

  //每次上传的最多文件数，经测试默认为2，坑啊
  //记得修改web.config 限制上传文件大小的节
  parallelUploads: 5,

  addRemoveLinks : true,
  dictDefaultMessage :
  '<span class="bigger-150 bolder"><i class="icon-caret-right red"></i> 将图片拖动到此处</span>上传 \
  <span class="smaller-80 grey">(或 “点击”)</span> <br /> \
  <i class="upload-icon icon-cloud-upload blue icon-3x"></i>',
  init: function() {
    return this.on('removedfile', function(file) {
      if (file.xhr) {
        return $.ajax({
          url: "" + ($("#picture-dropzone").attr("action")) + "/" + (JSON.parse(file.xhr.response).id),
          type: 'DELETE'
        });
      }
    });
  }
};