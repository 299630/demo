<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="A jQuery plugin wrapper for Cropper.js.">
    <meta name="author" content="Chen Fengyuan">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title>jquery-cropper</title>
    <link rel="stylesheet" href="/ui/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/ui/cropper/cropper.css">
    <link rel="stylesheet" href="/ui/cropper/main.css">
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/ui/cropper/cropper.js"></script>
    <script src="/ui/cropper/jquery-cropper.js"></script>
    <script src="/ui/cropper/main.js"></script>
</head>
<body>

<!-- Content -->
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <!-- <h3>Demo:</h3> -->
            <div class="img-container">
                <img id="image" src="/images/picture.jpg" alt="Picture">
            </div>
        </div>
        <div class="col-md-3">
            <!-- <h3>Preview:</h3> -->
            <div class="docs-preview clearfix">
                <div class="img-preview preview-lg"></div>
                <div class="img-preview preview-md"></div>
                <div class="img-preview preview-sm"></div>
                <div class="img-preview preview-xs"></div>
            </div>

            <!-- <h3>Data:</h3> -->
            <div class="docs-data">
                <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataX">X</label>
            </span>
                    <input type="text" class="form-control" id="dataX" placeholder="x">
                    <span class="input-group-append">
              <span class="input-group-text">px</span>
            </span>
                </div>
                <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataY">Y</label>
            </span>
                    <input type="text" class="form-control" id="dataY" placeholder="y">
                    <span class="input-group-append">
              <span class="input-group-text">px</span>
            </span>
                </div>
                <div class="input-group input-group-sm">
            <span class="input-group-prepend">
              <label class="input-group-text" for="dataWidth">宽度</label>
                </span>
                    <input type="text" class="form-control" id="dataWidth" placeholder="width">
                    <span class="input-group-append">
                  <span class="input-group-text">px</span>
                </span>
                </div>
                <div class="input-group input-group-sm">
                     <span class="input-group-prepend">
                          <label class="input-group-text" for="dataHeight">高度</label>
                     </span>
                    <input type="text" class="form-control" id="dataHeight" placeholder="height">
                    <span class="input-group-append">
                        <span class="input-group-text">px</span>
                     </span>
                </div>
                <div class="input-group input-group-sm" style="width: 320px; height: 42px">
                    <span class="input-group-prepend">
                       <label class="input-group-text" for="dataRotate">旋转</label>
                    </span>
                    <input type="text" class="form-control" id="dataRotate" placeholder="rotate">
                    <span class="input-group-append">
                        <span class="input-group-text">deg</span>
                    </span>&nbsp;
                    <div class="docs-buttons1">
                        <button type="button" name="dataRotate" class="btn btn-primary"  data-method="rotate" data-option="0">
                            设置
                        </button>
                    </div>
                </div>
                <div class="input-group input-group-sm" style="width: 320px; height: 42px">
                    <span class="input-group-prepend">
                      <label class="input-group-text" for="dataScaleX">scaleX</label>
                    </span>
                    <input type="text" class="form-control" id="dataScaleX" placeholder="scaleX">
                    &nbsp;
                    <div class="docs-buttons1">
                        <button type="button" name="dataScaleX" class="btn btn-primary"  data-method="scaleX" data-option="-1">
                            设置
                        </button>
                    </div>
                </div>
                <div class="input-group input-group-sm" style="width: 320px; height: 42px">
                    <span class="input-group-prepend">
                      <label class="input-group-text" for="dataScaleY">scaleY</label>
                    </span>
                    <input type="text" class="form-control" id="dataScaleY" placeholder="scaleY">
                    &nbsp;
                    <div class="docs-buttons1">
                        <button type="button" name="dataScaleY" class="btn btn-primary"  data-method="scaleY" data-option="-1">
                            设置
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-9 docs-buttons">

            <div class="btn-group">
                <button type="button" class="btn btn-primary" data-method="zoom" data-option="0.1" title="放大">
                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="放大">
                      <span class="fa fa-search-plus"></span>
                    </span>
                </button>
                <button type="button" class="btn btn-primary" data-method="zoom" data-option="-0.1" title="缩小">
                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="缩小">
                      <span class="fa fa-search-minus"></span>
                    </span>
                </button>
            </div>

            <div class="btn-group">
                <button type="button" class="btn btn-primary" data-method="move" data-option="-10" data-second-option="0" title="左移">
            <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="左移">
              <span class="fa fa-arrow-left"></span>
            </span>
                </button>
                <button type="button" class="btn btn-primary" data-method="move" data-option="10" data-second-option="0" title="右移">
                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="右移">
                      <span class="fa fa-arrow-right"></span>
                    </span>
                </button>
                <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="-10" title="上移">
                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="上移">
                      <span class="fa fa-arrow-up"></span>
                    </span>
                </button>
                <button type="button" class="btn btn-primary" data-method="move" data-option="0" data-second-option="10" title="下移">
                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="下移">
                      <span class="fa fa-arrow-down"></span>
                    </span>
                </button>
            </div>

            <div class="btn-group">
                <button type="button" class="btn btn-primary" data-method="rotate" data-option="-45" title="向左旋转">
                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="向左旋转45º">
                      <span class="fa fa-rotate-left"></span>
                    </span>
                </button>
                <button type="button" class="btn btn-primary" data-method="rotate" data-option="45" title="向右旋转">
                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="向右旋转45º">
                      <span class="fa fa-rotate-right"></span>
                    </span>
                </button>
            </div>

            <div class="btn-group">
                <button type="button" class="btn btn-primary" data-method="scaleX" data-option="-1" title="Flip Horizontal">
                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="上下颠倒">
                      <span class="fa fa-arrows-h"></span>
                    </span>
                </button>
                <button type="button" class="btn btn-primary" data-method="scaleY" data-option="-1" title="Flip Vertical">
                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="左右颠倒">
                      <span class="fa fa-arrows-v"></span>
                    </span>
                </button>
            </div>

            <div class="btn-group">
                <button type="button" class="btn btn-primary" data-method="reset" title="重置">
                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="重置">
                       <span class="fa fa-refresh"></span>
                    </span>
                </button>
                <label class="btn btn-primary btn-upload" for="inputImage" title="上传图片文件">
                    <input type="file" class="sr-only" id="inputImage" name="file" accept=".jpg,.jpeg,.png,.gif,.bmp,.tiff">
                    <span class="docs-tooltip" data-toggle="tooltip" data-animation="false" title="导入图像">
                        <span class="fa fa-upload"></span>
                    </span>
                </label>
            </div>

            <!-- Show the cropped image in modal -->
            <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="getCroppedCanvasTitle">Cropped</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body"></div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <a class="btn btn-primary" id="download" href="javascript:void(0);" download="cropped.jpg">下载</a>
                            <a class="btn btn-primary" id="getCroppedCanvas1" href="javascript:void(0);">上传</a>
                        </div>
                    </div>
                </div>
            </div><!-- /.资本 -->
            <button type="button" class="btn btn-secondary" data-method="moveTo" data-option="0">
                移动到 [0,0]
            </button>
            <button type="button" class="btn btn-secondary" data-method="zoomTo" data-option="1">
                放大到 100%
            </button>
            <div class="btn-group btn-group-crop docs-buttons" style="height: 42px">
                <button type="button" class="btn btn-success" id="getCroppedCanvas" data-method="getCroppedCanvas" data-option="{ &quot;width&quot;: 500, &quot;height&quot;: 500 }">
                    完成
                </button> &nbsp;
            </div>
        </div><!-- /.docs-buttons -->


        <div class="col-md-3 docs-toggles">
            <!-- <h3>Toggles:</h3> -->
            <div class="btn-group d-flex flex-nowrap" data-toggle="buttons">
                <label class="btn btn-primary active">
                    <input type="radio" class="sr-only" id="aspectRatio0" name="aspectRatio" value="1.7777777777777777">
                    16:9
                </label>
                <label class="btn btn-primary">
                    <input type="radio" class="sr-only" id="aspectRatio1" name="aspectRatio" value="1.3333333333333333">
                    4:3
                </label>
                <label class="btn btn-primary">
                    <input type="radio" class="sr-only" id="aspectRatio2" name="aspectRatio" value="1">
                    1:1
                </label>
                <label class="btn btn-primary">
                    <input type="radio" class="sr-only" id="aspectRatio3" name="aspectRatio" value="0.6666666666666666">
                    2:3
                </label>
                <label class="btn btn-primary">
                    <input type="radio" class="sr-only" id="aspectRatio4" name="aspectRatio" value="NaN">
                    自由
                </label>
            </div><!-- /.docs-toggles -->
        </div>
    </div>

  <script>
/*      $('#image').cropper({
          aspectRatio: 16 / 9,
          viewMode:1,
          dragMode:'none',
          preview:".small",
          responsive:false,
          restore:false,
//        modal:false,
//        guides:false,
//        background:false,
//        autoCrop:false,
//        autoCropArea:0.1,
//        movable:false,
//        scalable:false,
//        zoomable:false,
//        wheelZoomRatio:false,
//        cropBoxMovable:false,
//        cropBoxResizable:false,
          ready:function () {
              console.log("ready");
          },
          cropstart: function (e) {
              console.log("cropstart");
          },
          cropmove: function (e) {
              console.log("cropmove");
          },
          cropend: function (e) {
              console.log("cropend");
          },
          crop: function (e) {
              console.log("crop");
          },
          zoom: function (e) {
              console.log("zoom");
          },
      });*/

/*      $('#image').cropper('getCroppedCanvas', {
          width: 160,
          height: 90,
          minWidth: 256,
          minHeight: 256,
          maxWidth: 4096,
          maxHeight: 4096,
          fillColor: '#fff',
          imageSmoothingEnabled: false,
          imageSmoothingQuality: 'high',
      });*/

      $("#getCroppedCanvas1").on("click", function () {
          var cas=$('#image').cropper('getCroppedCanvas');
          var base64url=cas.toDataURL('image/jpeg');
          cas.toBlob(function (e) {
              //console.log(e);  //生成Blob的图片格式
          })
          var formData = new FormData();
          formData.append('image', base64url);
          $.ajax('/system/user/upload', {
              method: "POST",
              data: formData,
              processData: false,
              contentType: false,
              success: function (data) {
                  if (data == "true"){
                      alert('上传成功，注销后生效')
                      location.href="/system/user";
                  }
              },
              error: function () {
                  console.log('Upload error');
              }
          });
          //console.log(base64url); //生成base64图片的格式
          // $('.cavans').html(cas)  //在body显示出canvas元素
      })
    </script>
</body>
</html>